#! /bin/bash
set -e
cd "$(realpath -m "${0}/../")"
##
declare -a cmake_option=(
	-DOPT_IS_ENABLE_GTEST="ON"
)

################################ ################################ ################################ ################################
declare wkspace_position_file="./CMakeLists.txt"
cd ../
if [ ! -f "${wkspace_position_file}" ]
	then
	false; return;
fi

################################ ################################ ################################ ################################
: "./_build_plz_delete_me_when_need" && mkdir -p "${_}" && cd "${_}";
cmake ../ "${cmake_option[@]}"
cmake --build ./ -- -j 6
