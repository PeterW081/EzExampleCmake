set(VAR_cmake_version 3.12)
set(VAR_project_name "EzExampleCmakeExecute")
##X
option(OPT_IS_ENABLE_GTEST "" OFF)

###
cmake_minimum_required(VERSION "${VAR_cmake_version}")
project("${VAR_project_name}")

###
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

###
add_executable(
  "${VAR_project_name}-MAINEXE"
)
target_link_libraries(
  "${VAR_project_name}-MAINEXE" PUBLIC
  "${VAR_project_name}-MAINLIB"
)
set_target_properties(
  "${VAR_project_name}-MAINEXE" PROPERTIES
  OUTPUT_NAME "${VAR_project_name}"
)

###
file(GLOB_RECURSE ARR_cxx_src "${PROJECT_SOURCE_DIR}/cxx_src/*.cxx")
list(APPEND ARR_cxx_include "${PROJECT_SOURCE_DIR}/cxx_include/")
add_library(
  "${VAR_project_name}-MAINLIB" OBJECT
)
target_sources(
  "${VAR_project_name}-MAINLIB" PUBLIC
  PRIVATE "${ARR_cxx_src}"
)
target_include_directories(
  "${VAR_project_name}-MAINLIB" PUBLIC
  "${ARR_cxx_include}"
)

###
if(EXISTS "${CMAKE_CURRENT_LIST_FILE}-Gtest.cmake")
  include("${CMAKE_CURRENT_LIST_FILE}-Gtest.cmake")
endif()
