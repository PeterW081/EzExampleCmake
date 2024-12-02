###
if(OFF)
  set(GTest_FOUND 0)
  set(spdlog_FOUND 0)
endif()

###
##X - GTest
if("${GTest_FOUND}" EQUAL "0" AND (NOT TARGET "GTest::gtest" OR NOT TARGET "GTest::gmock"))
  ###
  # find_package()
  # > brew install googletest
  # > sudo apt-get install -y libgtest-dev libgmock-dev
  # FetchContent_Declare()
  # > wget "https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip" -O ./cmake_fetch_content-googletest.zip
  ###
  include(FetchContent)
  FetchContent_Declare(
    googletest
    URL "${CMAKE_CURRENT_LIST_DIR}/cmake_fetch_content-googletest.zip"
    URL_MD5 "611067C2AFFBF9EAFB919DF5DB1EA7F6"
    DOWNLOAD_EXTRACT_TIMESTAMP OFF
  )
  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
  FetchContent_MakeAvailable(googletest)
  find_package("GTest" CONFIG COMPONENTS "GTest" "GMock") # REQUIRED
endif()

###
##X - Spdlog
if("${spdlog_FOUND}" EQUAL "0" AND (NOT TARGET "spdlog::spdlog"))
  ###
  # find_package()
  # > brew install spdlog
  # > sudo apt-get install -y libspdlog-dev
  # FetchContent_Declare()
  # > wget "https://github.com/gabime/spdlog/archive/refs/tags/v1.12.0.zip" -O ./cmake_fetch_content-spdlog.zip
  ###
  include(FetchContent)
  FetchContent_Declare(
    spdlog
    URL "${CMAKE_CURRENT_LIST_DIR}/cmake_fetch_content-spdlog.zip"
    URL_MD5 "FEC8838EFCEDD1C01B4E2B067BA582C6"
    DOWNLOAD_EXTRACT_TIMESTAMP OFF
  )
  FetchContent_MakeAvailable(spdlog)
  find_package("spdlog")  # REQUIRED
endif()
