###
set(VAR_project_name "${VAR_package_name}-_TESTEXE_-Gtest")

###
cmake_minimum_required(VERSION "${VAR_cmake_version}")
project("${VAR_project_name}")
##X
if(NOT TARGET "${VAR_package_name}-INTERFACE-GlobeInterface")
  return()
endif()

###
file(GLOB_RECURSE ARR_cxx_src "${PROJECT_SOURCE_DIR}/cxx_xxx_gtest/*.cxx")
list(APPEND ARR_cxx_include "${PROJECT_SOURCE_DIR}/cxx_xxx_gtest/")
add_executable(
  "${VAR_project_name}"
)
target_sources(
  "${VAR_project_name}" PUBLIC
  PRIVATE "${ARR_cxx_src}"
)
target_include_directories(
  "${VAR_project_name}" PUBLIC
  "${ARR_cxx_include}"
)
target_link_libraries(
  "${VAR_project_name}" PUBLIC
  "${VAR_package_name}-INTERFACE-GlobeInterface"
  "${VAR_package_name}-INTERFACE-GTest"
)
##X
target_link_libraries(
  "${VAR_project_name}" PUBLIC
  "${VAR_package_name}-CxxLibrary"
  "${VAR_package_name}-CxxExecute-TESTLIB"
)

###
include("${CMAKE_CURRENT_LIST_FILE}+TESTLIB.cmake")
