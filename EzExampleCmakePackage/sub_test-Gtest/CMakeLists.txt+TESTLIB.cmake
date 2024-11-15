###
set(VAR_target_name "${VAR_package_name}-CxxExecute")
if(TARGET "${VAR_target_name}")
  set_target_properties(
    "${VAR_target_name}" PROPERTIES
    ENABLE_EXPORTS ON
  )
  add_library(
    "0TESTLIB-${VAR_target_name}" STATIC EXCLUDE_FROM_ALL
  )
  target_sources(
    "0TESTLIB-${VAR_target_name}" PUBLIC
    PRIVATE "$<TARGET_PROPERTY:${VAR_target_name},SOURCES>"
  )
  target_link_libraries(
    "0TESTLIB-${VAR_target_name}" PUBLIC
    "${VAR_target_name}"
    "$<TARGET_PROPERTY:${VAR_target_name},LINK_LIBRARIES>"
  )
  target_compile_options(
    "0TESTLIB-${VAR_target_name}" PUBLIC
    PRIVATE -include "${PROJECT_SOURCE_DIR}/cxx_xxx_gtest/_head_global_include_for_test.h"
  )
else()
  message(WARNING)
endif()
