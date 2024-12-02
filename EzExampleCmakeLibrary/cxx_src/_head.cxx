#include "_head.h"
#pragma
#
#include <spdlog/spdlog.h>
#include <spdlog/sinks/stdout_color_sinks.h>
#

///
inline const auto ext_spdlog::G_logger01 = []() -> auto
{
	auto logger = std::make_shared<spdlog::logger>("ext_spdlog::cout", std::make_shared<spdlog::sinks::stdout_color_sink_mt>());
	logger->set_pattern("%s:%#");
	return logger;
}();
