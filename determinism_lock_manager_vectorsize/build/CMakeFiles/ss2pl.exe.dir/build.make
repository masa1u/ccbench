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
CMAKE_SOURCE_DIR = /home/ccbench/determinism_lock_manager_vectorsize

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ccbench/determinism_lock_manager_vectorsize/build

# Include any dependencies generated for this target.
include CMakeFiles/ss2pl.exe.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ss2pl.exe.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ss2pl.exe.dir/flags.make

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o: CMakeFiles/ss2pl.exe.dir/flags.make
CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o: ../ss2pl.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ccbench/determinism_lock_manager_vectorsize/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o -c /home/ccbench/determinism_lock_manager_vectorsize/ss2pl.cc

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ss2pl.exe.dir/ss2pl.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ccbench/determinism_lock_manager_vectorsize/ss2pl.cc > CMakeFiles/ss2pl.exe.dir/ss2pl.cc.i

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ss2pl.exe.dir/ss2pl.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ccbench/determinism_lock_manager_vectorsize/ss2pl.cc -o CMakeFiles/ss2pl.exe.dir/ss2pl.cc.s

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.requires:

.PHONY : CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.requires

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.provides: CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.requires
	$(MAKE) -f CMakeFiles/ss2pl.exe.dir/build.make CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.provides.build
.PHONY : CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.provides

CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.provides.build: CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o


# Object files for target ss2pl.exe
ss2pl_exe_OBJECTS = \
"CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o"

# External object files for target ss2pl.exe
ss2pl_exe_EXTERNAL_OBJECTS =

ss2pl.exe: CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o
ss2pl.exe: CMakeFiles/ss2pl.exe.dir/build.make
ss2pl.exe: /usr/lib/x86_64-linux-gnu/libgflags.so
ss2pl.exe: CMakeFiles/ss2pl.exe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ccbench/determinism_lock_manager_vectorsize/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ss2pl.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ss2pl.exe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ss2pl.exe.dir/build: ss2pl.exe

.PHONY : CMakeFiles/ss2pl.exe.dir/build

CMakeFiles/ss2pl.exe.dir/requires: CMakeFiles/ss2pl.exe.dir/ss2pl.cc.o.requires

.PHONY : CMakeFiles/ss2pl.exe.dir/requires

CMakeFiles/ss2pl.exe.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ss2pl.exe.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ss2pl.exe.dir/clean

CMakeFiles/ss2pl.exe.dir/depend:
	cd /home/ccbench/determinism_lock_manager_vectorsize/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ccbench/determinism_lock_manager_vectorsize /home/ccbench/determinism_lock_manager_vectorsize /home/ccbench/determinism_lock_manager_vectorsize/build /home/ccbench/determinism_lock_manager_vectorsize/build /home/ccbench/determinism_lock_manager_vectorsize/build/CMakeFiles/ss2pl.exe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ss2pl.exe.dir/depend

