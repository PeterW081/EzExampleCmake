#include "melon_feature.h"
#pragma
#
#include <iostream>
#include <format>
#

auto ns_xxx::FX_func_melon_feature() -> void
{
	std::cout << std::format("{:s}:{:03d}", __FILE__, __LINE__) << std::endl;
}
