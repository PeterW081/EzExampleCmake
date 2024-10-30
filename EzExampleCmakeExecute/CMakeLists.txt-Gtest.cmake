###
#set(OPT_IS_ENABLE_GTEST ON)

###
if(OPT_IS_ENABLE_GTEST)
  ###
  file(GLOB_RECURSE ARR_cxx_src_gtest "${PROJECT_SOURCE_DIR}/cxx_xxx_gtest/*.cxx")
  list(APPEND ARR_cxx_include_gtest "${PROJECT_SOURCE_DIR}/cxx_xxx_gtest/")
  add_executable(
    "${VAR_project_name}-TESTEXE-GTest"
  )
  target_sources(
    "${VAR_project_name}-TESTEXE-GTest" PUBLIC
    PRIVATE "${ARR_cxx_src_gtest}"
  )
  target_include_directories(
    "${VAR_project_name}-TESTEXE-GTest" PUBLIC
    "${ARR_cxx_include_gtest}"
  )
  target_link_libraries(
    "${VAR_project_name}-TESTEXE-GTest" PUBLIC
    "${VAR_project_name}-TESTLIB-GTest"
    "${VAR_project_name}-INTERFACE-GTest"
  )
  ##X
  add_library(
    "${VAR_project_name}-TESTLIB-GTest" STATIC EXCLUDE_FROM_ALL
  )
  target_link_libraries(
    "${VAR_project_name}-TESTLIB-GTest" PUBLIC
    "${VAR_project_name}-MAINLIB"
  )
  target_compile_options(
    "${VAR_project_name}-TESTLIB-GTest" PUBLIC
    PRIVATE -include "${PROJECT_SOURCE_DIR}/cxx_xxx_gtest/_head_global_include_for_test.h"
  )
endif()

###
##X - GTest
if(OPT_IS_ENABLE_GTEST)
  add_library(
    "${VAR_project_name}-INTERFACE-GTest" INTERFACE
  )
endif()
if(OPT_IS_ENABLE_GTEST)
  ###
  # find_package()
  # > brew install googletest
  # > sudo apt-get install -y libgtest-dev libgmock-dev
  # FetchContent_Declare()
  # > wget "https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip" -O ./cmake_fetch_content-googletest.zip
  ###
  find_package(GTest CONFIG REQUIRED COMPONENTS GTest GMock)
  if(NOT GTest_FOUND OR NOT TARGET "GTest::gtest" OR NOT TARGET "GTest::gmock")
    set(VAR_CmakeFetchContent_0_GTest_URL_REMOTE "https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip")
    set(VAR_CmakeFetchContent_0_GTest_URL_LOCALE "file://${PROJECT_SOURCE_DIR}/_deps/cmake_fetch_content-googletest.zip")
    set(VAR_CmakeFetchContent_0_GTest_MD5_xxxxxx "611067c2affbf9eafb919df5db1ea7f6")
    ###
    set(VAR_CmakeFetchContentArg_0_GTest_URL)
    set(VAR_CmakeFetchContentArg_0_GTest_MD5)
    string(REGEX REPLACE "^file://" "" VAR_CmakeFetchContentArg_0_GTest_URL "${VAR_CmakeFetchContent_0_GTest_URL_LOCALE}")
    if(EXISTS "${VAR_CmakeFetchContentArg_0_GTest_URL}")
      set(VAR_CmakeFetchContentArg_0_GTest_URL "${VAR_CmakeFetchContent_0_GTest_URL_LOCALE}")
      set(VAR_CmakeFetchContentArg_0_GTest_MD5 "${VAR_CmakeFetchContent_0_GTest_MD5_xxxxxx}")
    else()
      set(VAR_CmakeFetchContentArg_0_GTest_URL "${VAR_CmakeFetchContent_0_GTest_URL_REMOTE}")
      set(VAR_CmakeFetchContentArg_0_GTest_MD5 "${VAR_CmakeFetchContent_0_GTest_MD5_xxxxxx}")
    endif()
    ###
    include(FetchContent)
    FetchContent_Declare(
      googletest
      URL "${VAR_CmakeFetchContentArg_0_GTest_URL}"
      URL_MD5 "${VAR_CmakeFetchContentArg_0_GTest_MD5}"
      DOWNLOAD_EXTRACT_TIMESTAMP OFF
    )
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
    FetchContent_MakeAvailable(googletest)
  endif()
  ###
  target_link_libraries(
    "${VAR_project_name}-INTERFACE-GTest" INTERFACE
    "GTest::gtest"
    "GTest::gmock"
  )
endif()
##X - Boost
if(OPT_IS_ENABLE_GTEST AND OFF)
  find_package(Boost REQUIRED COMPONENTS system)
  target_include_directories(
    "${VAR_project_name}-INTERFACE-GTest" INTERFACE
    "${Boost_INCLUDE_DIRS}"
  )
  target_link_libraries(
    "${VAR_project_name}-INTERFACE-GTest" INTERFACE
    "${Boost_LIBRARIES}"
  )
endif()
