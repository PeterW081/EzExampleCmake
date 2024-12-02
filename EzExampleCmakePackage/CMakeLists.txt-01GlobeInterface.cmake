###
add_library(
  "${VAR_package_name}-INTERFACE-GlobeInterface" INTERFACE
)

###
##X - Spdlog
if(ON)
  find_package("spdlog")  # REQUIRED
  target_link_libraries(
    "${VAR_package_name}-INTERFACE-GlobeInterface" INTERFACE
    "spdlog::spdlog"
  )
endif()
##X - Boost
if(OFF)
  find_package("Boost" REQUIRED COMPONENTS "system")
  target_include_directories(
    "${VAR_package_name}-INTERFACE-GlobeInterface" INTERFACE
    "${Boost_INCLUDE_DIRS}"
  )
  target_link_libraries(
    "${VAR_package_name}-INTERFACE-GlobeInterface" INTERFACE
    "${Boost_LIBRARIES}"
  )
endif()
