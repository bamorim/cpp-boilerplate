#include<catch.hpp>
#include<fib.hpp>

TEST_CASE( " Example ", "[tag]" ){

  SECTION( "it works " ){
    REQUIRE( Fib::fib(1) == 1 );
    REQUIRE( Fib::fib(2) == 1 );
    REQUIRE( Fib::fib(3) == 2 );
    REQUIRE( Fib::fib(4) == 3 );
    REQUIRE( Fib::fib(5) == 5 );
    REQUIRE( Fib::fib(6) == 8 );
    REQUIRE_THROWS_AS( Fib::fib(1000), std::overflow_error );
  }

}
