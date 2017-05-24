cmake_minimum_required(VERSION 3.7)
project(VE311)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
        homework/homework1/HW1.pdf
        lab/lab1/Lab1.pdf
        slides/Diodes.pdf
        slides/DIP.pdf
        slides/Intro.pdf
        slides/SSE.pdf)

add_executable(VE311 ${SOURCE_FILES})