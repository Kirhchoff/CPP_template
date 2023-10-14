cmake_minimum_required(VERSION 3.27)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "-Wall -Wpedantic -Werror")
project(project_template LANGUAGES CXX)

# STATIC LIB SOURCES
add_library(${CMAKE_PROJECT_NAME}_lib)
target_include_directories(${CMAKE_PROJECT_NAME}_lib PUBLIC include)
target_sources(${CMAKE_PROJECT_NAME}_lib PRIVATE src/hello.cpp)

# MAIN
add_executable(${CMAKE_PROJECT_NAME} main.cpp)
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE ${CMAKE_PROJECT_NAME}_lib)

# TESTS
Include(FetchContent)

FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        v3.0.1 # or a later release
)
FetchContent_MakeAvailable(Catch2)

add_executable(tests test/hello_test.cpp)
target_link_libraries(tests PRIVATE Catch2::Catch2WithMain ${CMAKE_PROJECT_NAME}_lib)
