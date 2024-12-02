###
#set(OPT_IS_ENABLE_GTEST ON)

###
##X - GTest
if(OPT_IS_ENABLE_GTEST)
  find_package("GTest" CONFIG COMPONENTS "GTest" "GMock") # REQUIRED
  add_library(
    "${VAR_package_name}-INTERFACE-GTest" INTERFACE
  )
  target_link_libraries(
    "${VAR_package_name}-INTERFACE-GTest" INTERFACE
    "GTest::gtest"
    "GTest::gmock"
  )
endif()
##X - Spdlog
if(OPT_IS_ENABLE_GTEST AND OFF)
  find_package("spdlog" REQUIRED)
  target_link_libraries(
    "${VAR_package_name}-INTERFACE-GTest" INTERFACE
    "spdlog::spdlog"
  )
endif()
##X - Boost
if(OPT_IS_ENABLE_GTEST AND OFF)
  find_package("Boost" REQUIRED COMPONENTS "system")
  target_include_directories(
    "${VAR_package_name}-INTERFACE-GTest" INTERFACE
    "${Boost_INCLUDE_DIRS}"
  )
  target_link_libraries(
    "${VAR_package_name}-INTERFACE-GTest" INTERFACE
    "${Boost_LIBRARIES}"
  )
endif()
