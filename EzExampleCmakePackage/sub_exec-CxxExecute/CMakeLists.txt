###
set(VAR_project_name "${VAR_package_name}-CxxExecute")

###
cmake_minimum_required(VERSION "${VAR_cmake_version}")
project("${VAR_project_name}")

###
file(GLOB_RECURSE ARR_cxx_src "${PROJECT_SOURCE_DIR}/cxx_src/*.cxx")
list(APPEND ARR_cxx_include "${PROJECT_SOURCE_DIR}/cxx_include/")
add_executable(
  "${VAR_project_name}"
)
target_link_libraries(
  "${VAR_project_name}" PUBLIC
)
target_sources(
  "${VAR_project_name}" PUBLIC
  PRIVATE "${ARR_cxx_src}"
)
target_include_directories(
  "${VAR_project_name}" PUBLIC
  "${ARR_cxx_include}"
)
##X
target_link_libraries(
  "${VAR_project_name}" PUBLIC
  "${VAR_package_name}-INTERFACE-GlobeInterface"
  "${VAR_package_name}-CxxLibrary"
)
