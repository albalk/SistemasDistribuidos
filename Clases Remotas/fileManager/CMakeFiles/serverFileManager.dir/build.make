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
CMAKE_SOURCE_DIR = /home/ubuntu/Practica1/fileManager

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/Practica1/fileManager

# Include any dependencies generated for this target.
include CMakeFiles/serverFileManager.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/serverFileManager.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/serverFileManager.dir/flags.make

CMakeFiles/serverFileManager.dir/utils.cpp.o: CMakeFiles/serverFileManager.dir/flags.make
CMakeFiles/serverFileManager.dir/utils.cpp.o: utils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Practica1/fileManager/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/serverFileManager.dir/utils.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/serverFileManager.dir/utils.cpp.o -c /home/ubuntu/Practica1/fileManager/utils.cpp

CMakeFiles/serverFileManager.dir/utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/serverFileManager.dir/utils.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Practica1/fileManager/utils.cpp > CMakeFiles/serverFileManager.dir/utils.cpp.i

CMakeFiles/serverFileManager.dir/utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/serverFileManager.dir/utils.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Practica1/fileManager/utils.cpp -o CMakeFiles/serverFileManager.dir/utils.cpp.s

CMakeFiles/serverFileManager.dir/utils.cpp.o.requires:

.PHONY : CMakeFiles/serverFileManager.dir/utils.cpp.o.requires

CMakeFiles/serverFileManager.dir/utils.cpp.o.provides: CMakeFiles/serverFileManager.dir/utils.cpp.o.requires
	$(MAKE) -f CMakeFiles/serverFileManager.dir/build.make CMakeFiles/serverFileManager.dir/utils.cpp.o.provides.build
.PHONY : CMakeFiles/serverFileManager.dir/utils.cpp.o.provides

CMakeFiles/serverFileManager.dir/utils.cpp.o.provides.build: CMakeFiles/serverFileManager.dir/utils.cpp.o


CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o: CMakeFiles/serverFileManager.dir/flags.make
CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o: serverFileManager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Practica1/fileManager/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o -c /home/ubuntu/Practica1/fileManager/serverFileManager.cpp

CMakeFiles/serverFileManager.dir/serverFileManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/serverFileManager.dir/serverFileManager.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Practica1/fileManager/serverFileManager.cpp > CMakeFiles/serverFileManager.dir/serverFileManager.cpp.i

CMakeFiles/serverFileManager.dir/serverFileManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/serverFileManager.dir/serverFileManager.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Practica1/fileManager/serverFileManager.cpp -o CMakeFiles/serverFileManager.dir/serverFileManager.cpp.s

CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o.requires:

.PHONY : CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o.requires

CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o.provides: CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o.requires
	$(MAKE) -f CMakeFiles/serverFileManager.dir/build.make CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o.provides.build
.PHONY : CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o.provides

CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o.provides.build: CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o


CMakeFiles/serverFileManager.dir/filemanager.cpp.o: CMakeFiles/serverFileManager.dir/flags.make
CMakeFiles/serverFileManager.dir/filemanager.cpp.o: filemanager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Practica1/fileManager/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/serverFileManager.dir/filemanager.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/serverFileManager.dir/filemanager.cpp.o -c /home/ubuntu/Practica1/fileManager/filemanager.cpp

CMakeFiles/serverFileManager.dir/filemanager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/serverFileManager.dir/filemanager.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Practica1/fileManager/filemanager.cpp > CMakeFiles/serverFileManager.dir/filemanager.cpp.i

CMakeFiles/serverFileManager.dir/filemanager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/serverFileManager.dir/filemanager.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Practica1/fileManager/filemanager.cpp -o CMakeFiles/serverFileManager.dir/filemanager.cpp.s

CMakeFiles/serverFileManager.dir/filemanager.cpp.o.requires:

.PHONY : CMakeFiles/serverFileManager.dir/filemanager.cpp.o.requires

CMakeFiles/serverFileManager.dir/filemanager.cpp.o.provides: CMakeFiles/serverFileManager.dir/filemanager.cpp.o.requires
	$(MAKE) -f CMakeFiles/serverFileManager.dir/build.make CMakeFiles/serverFileManager.dir/filemanager.cpp.o.provides.build
.PHONY : CMakeFiles/serverFileManager.dir/filemanager.cpp.o.provides

CMakeFiles/serverFileManager.dir/filemanager.cpp.o.provides.build: CMakeFiles/serverFileManager.dir/filemanager.cpp.o


# Object files for target serverFileManager
serverFileManager_OBJECTS = \
"CMakeFiles/serverFileManager.dir/utils.cpp.o" \
"CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o" \
"CMakeFiles/serverFileManager.dir/filemanager.cpp.o"

# External object files for target serverFileManager
serverFileManager_EXTERNAL_OBJECTS =

serverFileManager: CMakeFiles/serverFileManager.dir/utils.cpp.o
serverFileManager: CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o
serverFileManager: CMakeFiles/serverFileManager.dir/filemanager.cpp.o
serverFileManager: CMakeFiles/serverFileManager.dir/build.make
serverFileManager: CMakeFiles/serverFileManager.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/Practica1/fileManager/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable serverFileManager"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/serverFileManager.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/serverFileManager.dir/build: serverFileManager

.PHONY : CMakeFiles/serverFileManager.dir/build

CMakeFiles/serverFileManager.dir/requires: CMakeFiles/serverFileManager.dir/utils.cpp.o.requires
CMakeFiles/serverFileManager.dir/requires: CMakeFiles/serverFileManager.dir/serverFileManager.cpp.o.requires
CMakeFiles/serverFileManager.dir/requires: CMakeFiles/serverFileManager.dir/filemanager.cpp.o.requires

.PHONY : CMakeFiles/serverFileManager.dir/requires

CMakeFiles/serverFileManager.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/serverFileManager.dir/cmake_clean.cmake
.PHONY : CMakeFiles/serverFileManager.dir/clean

CMakeFiles/serverFileManager.dir/depend:
	cd /home/ubuntu/Practica1/fileManager && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/Practica1/fileManager /home/ubuntu/Practica1/fileManager /home/ubuntu/Practica1/fileManager /home/ubuntu/Practica1/fileManager /home/ubuntu/Practica1/fileManager/CMakeFiles/serverFileManager.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/serverFileManager.dir/depend

