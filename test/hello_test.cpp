#include <catch2/catch_test_macros.hpp>
#include "hello.h"

TEST_CASE("test hello") {
    REQUIRE(Hello{}.hello() == "hello");
}