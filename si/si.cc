
#include <ctype.h>  //isdigit, 
#include <pthread.h>
#include <string.h> //strlen,
#include <sys/syscall.h>  //syscall(SYS_gettid),  
#include <sys/types.h>  //syscall(SYS_gettid),
#include <time.h>
#include <unistd.h> //syscall(SYS_gettid), 
#include <iostream>
#include <string> //string

#define GLOBAL_VALUE_DEFINE

#include "../include/cpu.hpp"
#include "../include/debug.hpp"
#include "../include/int64byte.hpp"
#include "../include/procedure.hpp"
#include "../include/random.hpp"
#include "../include/tsc.hpp"
#include "../include/zipf.hpp"
#include "include/common.hpp"
#include "include/garbageCollection.hpp"
#include "include/result.hpp"
#include "include/transaction.hpp"

using namespace std;

extern void chkArg(const int argc, const char *argv[]);
extern bool chkClkSpan(const uint64_t start, const uint64_t stop, const uint64_t threshold);
extern void makeDB();
extern void makeProcedure(std::vector<Procedure>& pro, Xoroshiro128Plus &rnd, FastZipf &zipf, size_t tuple_num, size_t max_ope, size_t rratio, bool rmw, bool ycsb);
extern void naiveGarbageCollection();
extern void ReadyAndWaitForReadyOfAllThread(std::atomic<size_t> &running, size_t thnm);
extern void waitForReadyOfAllThread(std::atomic<size_t> &running, size_t thnm);
extern void sleepMs(size_t ms);

static void *
manager_worker(void *arg)
{
  SIResult &res = *(SIResult *)(arg);
  GarbageCollection gcobject;
 
#ifdef Linux 
  setThreadAffinity(res.thid);
#endif // Linux

  gcobject.decideFirstRange();
  ReadyAndWaitForReadyOfAllThread(Running, THREAD_NUM);
  
  for (;;) {
    usleep(1);

    if (gcobject.chkSecondRange()) {
      gcobject.decideGcThreshold();
      gcobject.mvSecondRangeToFirstRange();
    }
    if (Result::Finish.load(std::memory_order_acquire)) return nullptr;
  }

  return nullptr;
}


static void *
worker(void *arg)
{
  SIResult &res = *(SIResult *)(arg);
  TxExecutor trans(res.thid, MAX_OPE);
  Xoroshiro128Plus rnd;
  rnd.init();
  FastZipf zipf(&rnd, ZIPF_SKEW, TUPLE_NUM);
 
#if MASSTREE_USE
 MasstreeWrapper<Tuple>::thread_init(int(res.thid));
#endif

#ifdef Linux
  setThreadAffinity(res.thid);
  //printf("Thread #%d: on CPU %d\n", *myid, sched_getcpu());
  //printf("sysconf(_SC_NPROCESSORS_CONF) %ld\n", sysconf(_SC_NPROCESSORS_CONF));
#endif // Linux

  ReadyAndWaitForReadyOfAllThread(Running, THREAD_NUM);
  
  //start work (transaction)
  //printf("Thread #%d: on CPU %d\n", *myid, sched_getcpu());
  for(;;) {
    makeProcedure(trans.proSet, rnd, zipf, TUPLE_NUM, MAX_OPE, RRATIO, RMW, YCSB);
RETRY:

    if (Result::Finish.load(std::memory_order_acquire)) {
      return nullptr;
    }

    //-----
    //transaction begin
    trans.tbegin();
    for (auto itr = trans.proSet.begin(); itr != trans.proSet.end(); ++itr) {
      if ((*itr).ope_ == Ope::READ) {
        trans.tread((*itr).key_);
      } else if ((*itr).ope_ == Ope::WRITE) {
        trans.twrite((*itr).key_);
      } else if ((*itr).ope_ == Ope::READ_MODIFY_WRITE) {
        trans.tread((*itr).key_);
        trans.twrite((*itr).key_);
      } else {
        ERR;
      }

      if (trans.status == TransactionStatus::aborted) {
        trans.abort();
        ++res.local_abort_counts;
        goto RETRY;
      }
    }

    trans.commit();
    ++res.local_commit_counts;

#if 1
    // maintenance phase
    // garbage collection
    uint32_t loadThreshold = trans.gcobject.getGcThreshold();
    if (trans.preGcThreshold != loadThreshold) {
      trans.gcobject.gcVersion(res);
      trans.preGcThreshold = loadThreshold;
#ifdef CCTR_ON
      trans.gcobject.gcTMTElements(res);
#endif // CCTR_ON
      ++res.localGCCounts;
    }
#endif
    }

  return nullptr;
}

int
main(const int argc, const char *argv[]) try
{
  chkArg(argc, argv);
  makeDB();

  SIResult rsob[THREAD_NUM];
  SIResult &rsroot = rsob[0];
  pthread_t thread[THREAD_NUM];
  for (unsigned int i = 0; i < THREAD_NUM; ++i) {
    int ret;
    rsob[i].thid = i;
    if (i == 0)
      ret = pthread_create(&thread[i], NULL, manager_worker, (void *)(&rsob[i]));
    else
      ret = pthread_create(&thread[i], NULL, worker, (void *)(&rsob[i]));
    if (ret) ERR;
  }

  waitForReadyOfAllThread(Running, THREAD_NUM);
  for (size_t i = 0; i < EXTIME; ++i) {
    sleepMs(1000);
  }
  Result::Finish.store(true, std::memory_order_release);

  for (unsigned int i = 0; i < THREAD_NUM; ++i) {
    pthread_join(thread[i], nullptr);
    rsroot.add_localAllSIResult(rsob[i]);
  }

  rsroot.extime = EXTIME;
  rsroot.display_AllSIResult();

  return 0;
} catch (bad_alloc) {
  ERR;
}
