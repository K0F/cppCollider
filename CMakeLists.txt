
cmake_minimum_required (VERSION 2.8.12)
project (helloSc)

if (CMAKE_SYSTEM_NAME MATCHES "Linux")
   set(LINUX 1)
endif()


set(helloSc_VERSION_MAJOR 1)
set(helloSc_VERSION_MINOR 0)


set(SC_SOURCE_DIR "SC_SOURCE_PATH" CACHE STRING "A path to SuperCollider source directory")
set(SC_BUILD_DIR "SC_BUILD_PATH" CACHE STRING "A path to SuperCollider build directory")

file(GLOB_RECURSE ${EXT_LIBS} ${SC_BUILD_PATH}/external_libraries/ *.a)

set(CMAKE_MODULE_PATH ${SC_SOURCE_PATH}/cmake_modules ${CMAKE_MODULE_PATH})

message( ${EXT_LIBS} )

set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${SC_SOURCE_}/cmake_modules/)

find_package(Boost NAMES boost PATHS "${SC_BUILD_PATH}/external_libraries/" NO_DEFAULT_PATH)
find_package(Tlsf NAMES tlsf PATHS "${SC_BUILD_PATH}/external_libraries/" NO_DEFAULT_PATH)
find_package(Oscpack NAMES oscpack PATHS "${SC_BUILD_PATH}/external_libraries/" NO_DEFAULT_PATH)
find_package(Yaml NAMES yaml PATHS "${SC_BUILD_PATH}/external_libraries/" NO_DEFAULT_PATH)
find_package(YamlCpp NAMES yamlcpp PATHS "${SC_BUILD_PATH}/external_libraries/" NO_DEFAULT_PATH)

include_directories("${PROJECT_SOURCE_DIR}" "${SC_SOURCE_PATH}/include")


add_executable(helloSc helloSc.cpp)

target_link_libraries(helloSc "${SC_BUILD_DIR}/external_libraries/*.h")
