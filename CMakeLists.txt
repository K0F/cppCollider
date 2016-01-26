cmake_minimum_required(VERSION 3.0)
project(helloSc)

MACRO(HEADER_DIRECTORIES return_list)
  FILE(GLOB_RECURSE new_list *.h)
  SET(dir_list "")
  FOREACH(file_path ${new_list})
    GET_FILENAME_COMPONENT(dir_path ${file_path} PATH)
    SET(dir_list ${dir_list} ${dir_path})
  ENDFOREACH()
  LIST(REMOVE_DUPLICATES dir_list)
  SET(${return_list} ${dir_list})
ENDMACRO()


FIND_PACKAGE()


########## VARS ##############
set(SC_INCLUDE_DIR "please enter" CACHE FILEPATH "SuperCollider include directory")
set(SC_EXTERNAL_LIBS_DIR "please enter" CACHE FILEPATH "SuperCollider external_libries directory")
set(SC_BUILD_DIR "please enter" CACHE FILEPATH "SuperCollider build directory")

##############################

file( GLOB_RECURSE INCLUDE "/*.h" )
file( GLOB_RECURSE EXTERNALS "${SC_EXTERNAL_LIBS_DIR}/*" )
file( GLOB_RECURSE LIBS "${SC_BUILD_DIR}/*" )


###############################################################################
## file globbing ##############################################################
###############################################################################

# thise instructions search the directory tree when cmake is
# invoked and put all files that math the pattern in the variables 
# `sources` and `data`
file(GLOB sources *.cpp *.h)
# you can use set(sources src/main.cpp) etc if you don't want to
# use globbing to find files automatically

###############################################################################
## target definitions #########################################################
###############################################################################

# add the data to the target, so it becomes visible in some IDE
add_executable(helloSc ${sources} ${data})

# just for example add some compiler flags
target_compile_options(helloSc PUBLIC -std=c++1y -Wall -fPIC -shared)

# this lets me include files relative to the root src dir with a <> pair
target_include_directories(helloSc ${INCLUDE} .) 

# this copies all resource files in the build directory
# we need this, because we want to work with paths relative to the executabl
#file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/assets DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

###############################################################################
## dependencies ###############################################################
###############################################################################

link_directories(/usr/lib ${LIBS} ${EXTERNALS})

target_link_libraries(helloSc PUBLIC
  boost_thread
  boost_system
  boost_program_options
  boost_filesystem
  tlsf
  sndfile
  sclang
  scsynth
  pthread
  yaml
  oscpack
  hidapi
  udev
  z
  rt
  readline
  dl
  jack
  )

###############################################################################
## packaging ##################################################################
###############################################################################

# all install commands get the same destination. this allows us to use paths
# relative to the executable.
install(TARGETS helloSc DESTINATION ./)
# this is basically a repeat of the file copy instruction that copies the
# resources in the build directory, but here we tell cmake that we want it
# in the package
install(DIRECTORY assets DESTINATION ./)

# now comse everything we need, to create a package
# there are a lot more variables you can set, and some
# you need to set for some package types, but we want to
# be minimal here
set(CPACK_PACKAGE_NAME "helloSc")
set(CPACK_PACKAGE_VERSION "1.0.0")

# we don't want to split our program up into several things
set(CPACK_MONOLITHIC_INSTALL 1)

# This must be last
include(CPack)
