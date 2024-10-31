set(VAR_cmake_version 3.12)
set(VAR_package_name "EzExampleCmakePackage")
set(VAR_project_name "${VAR_package_name}")
##X
option(OPT_IS_ENABLE_GTEST "" OFF)

###
cmake_minimum_required(VERSION "${VAR_cmake_version}")
project("${VAR_project_name}")

###
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

###
include("${CMAKE_CURRENT_LIST_FILE}+01GlobeInterface.cmake")
add_subdirectory("${PROJECT_SOURCE_DIR}/sub_exec-CxxExecute/")
add_subdirectory("${PROJECT_SOURCE_DIR}/sub_libx-CxxLibrary/")

###
if(OPT_IS_ENABLE_GTEST AND EXISTS "${CMAKE_CURRENT_LIST_FILE}-Gtest.cmake")
  include("${CMAKE_CURRENT_LIST_FILE}-Gtest.cmake")
endif()
if(OPT_IS_ENABLE_GTEST AND EXISTS "${PROJECT_SOURCE_DIR}/sub_test-Gtest/")
  add_subdirectory("${PROJECT_SOURCE_DIR}/sub_test-Gtest/")
endif()
