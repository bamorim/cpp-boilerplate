#include<fib.hpp>
#include<stdexcept>

// Returns zero on overflow
uint64_t Fib::fib(uint32_t n){
  uint64_t previous = 0;
  uint64_t current = 1;
  uint64_t temp = 0;

  for(uint32_t i = 1; i < n; i++){
    temp = current;

    // Check for overflow before it happens
    if(current > UINT64_MAX - previous) {
      throw std::overflow_error("Cannot compute this number using fixed 64-bit numbers");
    }

    current = current + previous;

    previous = temp;
  }
  return current;
}
