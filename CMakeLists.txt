project (hello)

cmake_minimum_required (VERSION 2.8.11)

SET(SC_SRC_PATH "/home/kof/src/supercollider" CACHE PATH "Supercollider source path")
SET(SC_BUILD_PATH "/home/kof/src/supercollider/build" CACHE PATH "Supercollider build path")

set(EXECUTABLE_NAME "helloSc")
set(HEADERS "${SC_SRC_PATH}/include/lang/SC_LanguageClient.h")

LIST(APPEND CMAKE_MODULE_PATH "${SC_SRC_PATH}/cmake_modules/")
LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake_modules/")

message(STATUS "${CMAKE_MODULE_PATH}")

FIND_PACKAGE(Qt5Core)
FIND_PACKAGE(Qt5Widgets)
FIND_PACKAGE(Qt5LinguistTools)
FIND_PACKAGE(Qt5WebKitWidgets)
FIND_PACKAGE(Qt5OpenGL)
FIND_PACKAGE(Qt5PrintSupport)
FIND_PACKAGE(Qt5Sensors)
FIND_PACKAGE(Qt5Quick)
FIND_PACKAGE(Qt5Qml)
FIND_PACKAGE(Qt5Sql)
FIND_PACKAGE(Qt5Positioning)



################## COPY PASTE z SCROOTU ################


if (NOT WIN32)
  find_package(hidapi)
  if(hidapi_FOUND)
    include_directories(${hidapi_INCLUDE_DIRS})
  endif()

  find_package(Pthreads)

  if (NOT Pthreads_FOUND)
    message(SEND_ERROR "cannot find libpthreads")
  endif()
  include_directories(${Pthreads_INCLUDE_DIR})
endif()

if(MSVC OR MINGW)
  set(MATH_LIBRARY "")
else()
  find_library(MATH_LIBRARY m)
endif()

if(NOT WIN32)
  set(Boost_USE_MULTITHREADED      ON)
  find_package( Boost 1.58 COMPONENTS thread system filesystem program_options regex test_exec_monitor )


  if (Boost_FOUND)
    link_directories(${Boost_LIBRARY_DIRS})
  else()
    message(STATUS "building boost libraries manually")
  endif()
endif()

if(SYSTEM_YAMLCPP)
  find_package(YamlCpp)
else()
  set(YAMLCPP_FOUND OFF)
endif()

add_definitions(-DBOOST_CHRONO_HEADER_ONLY -DBOOST_NO_AUTO_PTR)

##########################################################



SET(QT_LIBRARIES 
  Qt5::Core
  Qt5::Gui 
  Qt5::Widgets
  Qt5::Network
  Qt5::WebKit
  Qt5::WebKitWidgets
  Qt5::OpenGL 
  Qt5::PrintSupport 
  Qt5::Sensors 
  Qt5::Quick 
  Qt5::Qml 
  Qt5::Sql 
  Qt5::Positioning
  )


INCLUDE_DIRECTORIES(
  "${SC_BUILD_PATH}"
  "${SC_SRC_PATH}"
  "${SC_SRC_PATH}/include"
  "${SC_SRC_PATH}/include/plugin_interface"
  "${SC_SRC_PATH}/include/common"
  "${SC_SRC_PATH}/include/lang"
  "${SC_SRC_PATH}/include/server"
  )



LINK_DIRECTORIES(
  "${SC_BUILD_PATH}/lang"
  "${SC_BUILD_PATH}/hidapi/linux"
  "${SC_BUILD_PATH}/hidapi/hidapi_parser"
  "${SC_BUILD_PATH}/server/scsynth"
  "${SC_BUILD_PATH}/external_libraries"
  )


add_executable(${EXECUTABLE_NAME} "helloSc.cpp" ${HEADERS})


TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME}
  ${QT_LIBRARIES}
  sclang
  scsynth
  boost_thread
  yaml
  oscpack
  sndfile
  )

if(NOT WIN32)
  TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME}
    pthread
    jack  
    rt
    z
    dl
    readline
    udev
    fftw3
    asound
    )

  find_package(hidapi)
  if(hidapi_FOUND)
    link_directories(${hidapi_LIBRARY_DIRS})
  endif()
endif()





####### WTF COPY PASTE 
# hide advanced variables
mark_as_advanced(AVAHI_LIBRARIES AVAHI_INCLUDE_DIRS AVAHI_INCLUDE_DIR AVAHI_LIBRARY-COMMON AVAHI_LIBRARY-CLIENT)
mark_as_advanced(DL)
mark_as_advanced(EMACS_EXECUTABLE)
mark_as_advanced(FFTW3F_INCLUDE_DIR FFTW3F_LIBRARY)
mark_as_advanced(JACK JACK_INCLUDE_DIR JACK_LIBRARY)
mark_as_advanced(MATH_LIBRARY)
mark_as_advanced(QT_QMAKE_EXECUTABLE)
mark_as_advanced(SNDFILE)
