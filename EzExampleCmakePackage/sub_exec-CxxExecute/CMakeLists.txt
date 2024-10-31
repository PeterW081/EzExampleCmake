###
set(VAR_project_name-xxx "${VAR_package_name}-CxxExecute")
set(VAR_project_name-exe "${VAR_package_name}-CxxExecute-MAINEXE")
set(VAR_project_name-lib "${VAR_package_name}-CxxExecute-MAINLIB")
set(VAR_project_name "${VAR_project_name-xxx}")

###
cmake_minimum_required(VERSION "${VAR_cmake_version}")
project("${VAR_project_name}")

###
add_executable(
  "${VAR_project_name-exe}"
)
target_link_libraries(
  "${VAR_project_name-exe}" PUBLIC
  "${VAR_project_name-lib}"
)
set_target_properties(
  "${VAR_project_name-exe}" PROPERTIES
  OUTPUT_NAME "${VAR_project_name}"
)

###
file(GLOB_RECURSE ARR_cxx_src "${PROJECT_SOURCE_DIR}/cxx_src/*.cxx")
list(APPEND ARR_cxx_include "${PROJECT_SOURCE_DIR}/cxx_include/")
add_library(
  "${VAR_project_name-lib}" OBJECT
)
target_sources(
  "${VAR_project_name-lib}" PUBLIC
  PRIVATE "${ARR_cxx_src}"
)
target_include_directories(
  "${VAR_project_name-lib}" PUBLIC
  "${ARR_cxx_include}"
)
##X
target_link_libraries(
  "${VAR_project_name-lib}" PUBLIC
  "${VAR_package_name}-INTERFACE-GlobeInterface"
  "${VAR_package_name}-CxxLibrary"
)
