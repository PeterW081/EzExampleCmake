#include <gtest/gtest.h>
#pragma
#
#include <iostream>
#include <format>
#
#include "melon_feature.h"
#include "melon_feature_02.h"
#

TEST(Example01, Test01)
{
	std::cout << std::format("{:s}:{:03d}", __FILE__, __LINE__) << std::endl;
	ns_xxx::FX_func_melon_feature();
	ns_xxx::FX_func_melon_feature_02();
}
