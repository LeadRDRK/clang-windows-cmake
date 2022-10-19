cmake_minimum_required(VERSION 3.0)
project(test)
add_executable(hello WIN32 hello.c)
target_link_libraries(hello PRIVATE user32)
