#pragma once
#
#include <spdlog/spdlog.h>
#

#define XPLUM_0_SPDLOG_LOG_HERE() ext_spdlog::G_logger01->log(spdlog::source_loc{__FILE__, __LINE__, __FUNCTION__}, ext_spdlog::G_level_max, "")
namespace ext_spdlog
{
	extern inline constexpr spdlog::level::level_enum G_level_off = static_cast<spdlog::level::level_enum>(std::numeric_limits<std::underlying_type<spdlog::level::level_enum>::type>::max());
	extern inline constexpr spdlog::level::level_enum G_level_max = static_cast<spdlog::level::level_enum>(G_level_off - 1);
	extern const std::shared_ptr<spdlog::logger> G_logger01;
}
