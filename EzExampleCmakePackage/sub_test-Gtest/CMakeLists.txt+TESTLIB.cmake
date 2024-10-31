###
##X - "${VAR_package_name}-CxxExecute-TESTLIB"
if(TARGET "${VAR_package_name}-CxxExecute-MAINLIB")
  add_library(
    "${VAR_package_name}-CxxExecute-TESTLIB" STATIC EXCLUDE_FROM_ALL
  )
  target_link_libraries(
    "${VAR_package_name}-CxxExecute-TESTLIB" PUBLIC
    "${VAR_package_name}-CxxExecute-MAINLIB"
  )
  target_compile_options(
    "${VAR_package_name}-CxxExecute-TESTLIB" PUBLIC
    PRIVATE -include "${PROJECT_SOURCE_DIR}/cxx_xxx_gtest/_head_global_include_for_test.h"
  )
else()
  message(WARNING)
endif()
