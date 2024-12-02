###
#set(OPT_IS_ENABLE_GTEST ON)

###
if(OPT_IS_ENABLE_GTEST)
  ###
  file(GLOB_RECURSE ARR_cxx_src_gtest "${PROJECT_SOURCE_DIR}/cxx_xxx_gtest/*.cxx")
  list(APPEND ARR_cxx_include_gtest "${PROJECT_SOURCE_DIR}/cxx_xxx_gtest/")
  add_executable(
    "0TESTEXE-${VAR_project_name}" EXCLUDE_FROM_ALL
  )
  target_sources(
    "0TESTEXE-${VAR_project_name}" PUBLIC
    PRIVATE "${ARR_cxx_src_gtest}"
  )
  target_include_directories(
    "0TESTEXE-${VAR_project_name}" PUBLIC
    "${ARR_cxx_include_gtest}"
  )
  target_link_libraries(
    "0TESTEXE-${VAR_project_name}" PUBLIC
    "0TESTLIB-${VAR_project_name}"
    "${VAR_project_name}-INTERFACE-GTest"
  )
  ##X
  set_target_properties(
    "${VAR_project_name}" PROPERTIES
    ENABLE_EXPORTS ON
  )
  add_library(
    "0TESTLIB-${VAR_project_name}" STATIC EXCLUDE_FROM_ALL
  )
  target_sources(
    "0TESTLIB-${VAR_project_name}" PUBLIC
    PRIVATE "$<TARGET_PROPERTY:${VAR_project_name},SOURCES>"
  )
  target_link_libraries(
    "0TESTLIB-${VAR_project_name}" PUBLIC
    "${VAR_project_name}"
    "$<TARGET_PROPERTY:${VAR_project_name},LINK_LIBRARIES>"
  )
  target_compile_options(
    "0TESTLIB-${VAR_project_name}" PUBLIC
    PRIVATE -include "${PROJECT_SOURCE_DIR}/cxx_xxx_gtest/_head_global_include_for_test.h"
  )
endif()

###
##X - GTest
if(OPT_IS_ENABLE_GTEST)
  find_package("GTest" CONFIG COMPONENTS "GTest" "GMock") # REQUIRED
  add_library(
    "${VAR_project_name}-INTERFACE-GTest" INTERFACE
  )
  target_link_libraries(
    "${VAR_project_name}-INTERFACE-GTest" INTERFACE
    "GTest::gtest"
    "GTest::gmock"
  )
endif()
##X - Spdlog
if(OPT_IS_ENABLE_GTEST AND OFF)
  find_package("spdlog")  # REQUIRED
  target_link_libraries(
    "${VAR_project_name}-INTERFACE-GTest" INTERFACE
    "spdlog::spdlog"
  )
endif()
##X - Boost
if(OPT_IS_ENABLE_GTEST AND OFF)
  find_package("Boost" REQUIRED COMPONENTS "system")
  target_include_directories(
    "${VAR_project_name}-INTERFACE-GTest" INTERFACE
    "${Boost_INCLUDE_DIRS}"
  )
  target_link_libraries(
    "${VAR_project_name}-INTERFACE-GTest" INTERFACE
    "${Boost_LIBRARIES}"
  )
endif()
