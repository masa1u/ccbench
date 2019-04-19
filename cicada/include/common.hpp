#pragma once

#include <pthread.h>
#include <iostream>
#include <atomic>
#include <queue>

#include "lock.hpp"
#include "procedure.hpp"
#include "tuple.hpp"
#include "version.hpp"

#include "../../include/cache_line_size.hpp"
#include "../../include/int64byte.hpp"

#ifdef GLOBAL_VALUE_DEFINE
  #define GLOBAL

GLOBAL std::atomic<size_t> Running(0);
GLOBAL std::atomic<bool> Finish(false);
alignas(CACHE_LINE_SIZE) GLOBAL std::atomic<uint64_t> MinRts(0);
alignas(CACHE_LINE_SIZE) GLOBAL std::atomic<uint64_t> MinWts(0);
alignas(CACHE_LINE_SIZE) GLOBAL std::atomic<unsigned int> FirstAllocateTimestamp(0);

#else
  #define GLOBAL extern

GLOBAL std::atomic<size_t> Running;
GLOBAL std::atomic<bool> Finish;
alignas(CACHE_LINE_SIZE) GLOBAL std::atomic<uint64_t> MinRts;
alignas(CACHE_LINE_SIZE) GLOBAL std::atomic<uint64_t> MinWts;
alignas(CACHE_LINE_SIZE) GLOBAL std::atomic<unsigned int> FirstAllocateTimestamp;

#endif

GLOBAL size_t TUPLE_NUM;
GLOBAL size_t MAX_OPE;
GLOBAL size_t THREAD_NUM;
GLOBAL size_t RRATIO;
GLOBAL bool RMW;
GLOBAL double ZIPF_SKEW;
GLOBAL bool YCSB;
GLOBAL bool P_WAL;
GLOBAL bool S_WAL;
GLOBAL size_t GROUP_COMMIT;
GLOBAL size_t CLOCKS_PER_US; // US = micro(µ) seconds 
GLOBAL size_t IO_TIME_NS; // nano second
GLOBAL size_t GROUP_COMMIT_TIMEOUT_US; // micro seconds
GLOBAL size_t GC_INTER_US; // garbage collection interval
GLOBAL size_t EXTIME;

GLOBAL uint64_t_64byte *ThreadWtsArray;
GLOBAL uint64_t_64byte *ThreadRtsArray;
GLOBAL uint64_t_64byte *ThreadRtsArrayForGroup; // グループコミットをする時，これが必要である．

GLOBAL uint64_t_64byte *GROUP_COMMIT_INDEX;
GLOBAL uint64_t_64byte *GROUP_COMMIT_COUNTER; // s-walの時は[0]のみ使用。全スレッドで共有。

GLOBAL Version ***PLogSet;  // [thID][index] pointer array
GLOBAL Version **SLogSet; // [index] pointer array
GLOBAL RWLock SwalLock;
GLOBAL RWLock CtrLock;

GLOBAL uint64_t_64byte *GCFlag;
GLOBAL uint64_t_64byte *GCExecuteFlag;

GLOBAL Tuple *Table;
GLOBAL uint64_t InitialWts;

#define SPIN_WAIT_TIMEOUT_US 2
