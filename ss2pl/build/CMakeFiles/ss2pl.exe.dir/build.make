# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ccbench/ss2pl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ccbench/ss2pl/build

# Include any dependencies generated for this target.
include CMakeFiles/ss2pl.exe.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ss2pl.exe.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ss2pl.exe.dir/flags.make

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o: CMakeFiles/ss2pl.exe.dir/flags.make
CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o: /home/ccbench/common/result.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ccbench/ss2pl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o -c /home/ccbench/common/result.cc

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ccbench/common/result.cc > CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.i

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ccbench/common/result.cc -o CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.s

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o.requires:

.PHONY : CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o.requires

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o.provides: CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o.requires
	$(MAKE) -f CMakeFiles/ss2pl.exe.dir/build.make CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o.provides.build
.PHONY : CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o.provides

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o.provides.build: CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o


CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o: CMakeFiles/ss2pl.exe.dir/flags.make
CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o: /home/ccbench/common/util.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ccbench/ss2pl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o -c /home/ccbench/common/util.cc

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ccbench/common/util.cc > CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.i

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ccbench/common/util.cc -o CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.s

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o.requires:

.PHONY : CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o.requires

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o.provides: CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o.requires
	$(MAKE) -f CMakeFiles/ss2pl.exe.dir/build.make CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o.provides.build
.PHONY : CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o.provides

CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o.provides.build: CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o


CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o: CMakeFiles/ss2pl.exe.dir/flags.make
CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o: ../ss2pl.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ccbench/ss2pl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o -c /home/ccbench/ss2pl/ss2pl.cc

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ss2pl.exe.dir/ss2pl.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ccbench/ss2pl/ss2pl.cc > CMakeFiles/ss2pl.exe.dir/ss2pl.cc.i

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ss2pl.exe.dir/ss2pl.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ccbench/ss2pl/ss2pl.cc -o CMakeFiles/ss2pl.exe.dir/ss2pl.cc.s

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.requires:

.PHONY : CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.requires

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.provides: CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.requires
	$(MAKE) -f CMakeFiles/ss2pl.exe.dir/build.make CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.provides.build
.PHONY : CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.provides

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.provides.build: CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o


CMakeFiles/ss2pl.exe.dir/result.cc.o: CMakeFiles/ss2pl.exe.dir/flags.make
CMakeFiles/ss2pl.exe.dir/result.cc.o: ../result.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ccbench/ss2pl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/ss2pl.exe.dir/result.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ss2pl.exe.dir/result.cc.o -c /home/ccbench/ss2pl/result.cc

CMakeFiles/ss2pl.exe.dir/result.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ss2pl.exe.dir/result.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ccbench/ss2pl/result.cc > CMakeFiles/ss2pl.exe.dir/result.cc.i

CMakeFiles/ss2pl.exe.dir/result.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ss2pl.exe.dir/result.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ccbench/ss2pl/result.cc -o CMakeFiles/ss2pl.exe.dir/result.cc.s

CMakeFiles/ss2pl.exe.dir/result.cc.o.requires:

.PHONY : CMakeFiles/ss2pl.exe.dir/result.cc.o.requires

CMakeFiles/ss2pl.exe.dir/result.cc.o.provides: CMakeFiles/ss2pl.exe.dir/result.cc.o.requires
	$(MAKE) -f CMakeFiles/ss2pl.exe.dir/build.make CMakeFiles/ss2pl.exe.dir/result.cc.o.provides.build
.PHONY : CMakeFiles/ss2pl.exe.dir/result.cc.o.provides

CMakeFiles/ss2pl.exe.dir/result.cc.o.provides.build: CMakeFiles/ss2pl.exe.dir/result.cc.o


CMakeFiles/ss2pl.exe.dir/transaction.cc.o: CMakeFiles/ss2pl.exe.dir/flags.make
CMakeFiles/ss2pl.exe.dir/transaction.cc.o: ../transaction.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ccbench/ss2pl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/ss2pl.exe.dir/transaction.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ss2pl.exe.dir/transaction.cc.o -c /home/ccbench/ss2pl/transaction.cc

CMakeFiles/ss2pl.exe.dir/transaction.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ss2pl.exe.dir/transaction.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ccbench/ss2pl/transaction.cc > CMakeFiles/ss2pl.exe.dir/transaction.cc.i

CMakeFiles/ss2pl.exe.dir/transaction.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ss2pl.exe.dir/transaction.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ccbench/ss2pl/transaction.cc -o CMakeFiles/ss2pl.exe.dir/transaction.cc.s

CMakeFiles/ss2pl.exe.dir/transaction.cc.o.requires:

.PHONY : CMakeFiles/ss2pl.exe.dir/transaction.cc.o.requires

CMakeFiles/ss2pl.exe.dir/transaction.cc.o.provides: CMakeFiles/ss2pl.exe.dir/transaction.cc.o.requires
	$(MAKE) -f CMakeFiles/ss2pl.exe.dir/build.make CMakeFiles/ss2pl.exe.dir/transaction.cc.o.provides.build
.PHONY : CMakeFiles/ss2pl.exe.dir/transaction.cc.o.provides

CMakeFiles/ss2pl.exe.dir/transaction.cc.o.provides.build: CMakeFiles/ss2pl.exe.dir/transaction.cc.o


CMakeFiles/ss2pl.exe.dir/util.cc.o: CMakeFiles/ss2pl.exe.dir/flags.make
CMakeFiles/ss2pl.exe.dir/util.cc.o: ../util.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ccbench/ss2pl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/ss2pl.exe.dir/util.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ss2pl.exe.dir/util.cc.o -c /home/ccbench/ss2pl/util.cc

CMakeFiles/ss2pl.exe.dir/util.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ss2pl.exe.dir/util.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ccbench/ss2pl/util.cc > CMakeFiles/ss2pl.exe.dir/util.cc.i

CMakeFiles/ss2pl.exe.dir/util.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ss2pl.exe.dir/util.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ccbench/ss2pl/util.cc -o CMakeFiles/ss2pl.exe.dir/util.cc.s

CMakeFiles/ss2pl.exe.dir/util.cc.o.requires:

.PHONY : CMakeFiles/ss2pl.exe.dir/util.cc.o.requires

CMakeFiles/ss2pl.exe.dir/util.cc.o.provides: CMakeFiles/ss2pl.exe.dir/util.cc.o.requires
	$(MAKE) -f CMakeFiles/ss2pl.exe.dir/build.make CMakeFiles/ss2pl.exe.dir/util.cc.o.provides.build
.PHONY : CMakeFiles/ss2pl.exe.dir/util.cc.o.provides

CMakeFiles/ss2pl.exe.dir/util.cc.o.provides.build: CMakeFiles/ss2pl.exe.dir/util.cc.o


# Object files for target ss2pl.exe
ss2pl_exe_OBJECTS = \
"CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o" \
"CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o" \
"CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o" \
"CMakeFiles/ss2pl.exe.dir/result.cc.o" \
"CMakeFiles/ss2pl.exe.dir/transaction.cc.o" \
"CMakeFiles/ss2pl.exe.dir/util.cc.o"

# External object files for target ss2pl.exe
ss2pl_exe_EXTERNAL_OBJECTS =

ss2pl.exe: CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o
ss2pl.exe: CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o
ss2pl.exe: CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o
ss2pl.exe: CMakeFiles/ss2pl.exe.dir/result.cc.o
ss2pl.exe: CMakeFiles/ss2pl.exe.dir/transaction.cc.o
ss2pl.exe: CMakeFiles/ss2pl.exe.dir/util.cc.o
ss2pl.exe: CMakeFiles/ss2pl.exe.dir/build.make
ss2pl.exe: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
ss2pl.exe: /usr/lib/x86_64-linux-gnu/libgflags.so
ss2pl.exe: ../../third_party/mimalloc/out/release/libmimalloc.a
ss2pl.exe: ../../third_party/masstree/libkohler_masstree_json.a
ss2pl.exe: /usr/lib/x86_64-linux-gnu/libboost_system.so
ss2pl.exe: CMakeFiles/ss2pl.exe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ccbench/ss2pl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable ss2pl.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ss2pl.exe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ss2pl.exe.dir/build: ss2pl.exe

.PHONY : CMakeFiles/ss2pl.exe.dir/build

CMakeFiles/ss2pl.exe.dir/requires: CMakeFiles/ss2pl.exe.dir/home/ccbench/common/result.cc.o.requires
CMakeFiles/ss2pl.exe.dir/requires: CMakeFiles/ss2pl.exe.dir/home/ccbench/common/util.cc.o.requires
CMakeFiles/ss2pl.exe.dir/requires: CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.requires
CMakeFiles/ss2pl.exe.dir/requires: CMakeFiles/ss2pl.exe.dir/result.cc.o.requires
CMakeFiles/ss2pl.exe.dir/requires: CMakeFiles/ss2pl.exe.dir/transaction.cc.o.requires
CMakeFiles/ss2pl.exe.dir/requires: CMakeFiles/ss2pl.exe.dir/util.cc.o.requires

.PHONY : CMakeFiles/ss2pl.exe.dir/requires

CMakeFiles/ss2pl.exe.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ss2pl.exe.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ss2pl.exe.dir/clean

CMakeFiles/ss2pl.exe.dir/depend:
	cd /home/ccbench/ss2pl/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ccbench/ss2pl /home/ccbench/ss2pl /home/ccbench/ss2pl/build /home/ccbench/ss2pl/build /home/ccbench/ss2pl/build/CMakeFiles/ss2pl.exe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ss2pl.exe.dir/depend
