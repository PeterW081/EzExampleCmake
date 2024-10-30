《專案介紹》
　Cmake 範本，從簡設計。力求能讓新手快速進入狀態。
　集成 GTest 及其源碼。即使編譯環境沒有安裝 GTest，也可使用 GTest 編寫測試代碼。

《使用說明》
　簡述如下：
　1、./Launcher/0_build_compile.sh 執行之後，可得編譯結果。該個腳本可以當作編譯指示。
　2、./CMakeLists.txt 之中，修改 VAR_cmake_version 可改編譯結果的名稱。
　3、./cxx_src/、./cxx_xxx_gtest/ 中的 .cxx 文檔會被自動檢索編譯。./cxx_include/ 中的 .h 文檔，可被 #include 檢索導入。
