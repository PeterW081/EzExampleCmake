#pragma once
// clang-format off
#define main(VAR...) static __xplum_ignore_main_x; static auto __xplum_ignore_main__(VAR)
// clang-format on
