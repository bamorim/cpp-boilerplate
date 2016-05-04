#include<iostream>
#include<cxxopts.hpp>
#include<fib.hpp>

int main(int argc, char** argv){
  cxxopts::Options options(argv[0]);

  options.add_options("")
    ("h,help", "prints the help message")
  ;

  options.add_options("params")
    ("n,number", "sequence number of the fibonacci to get", cxxopts::value<uint32_t>()->default_value("1"))
  ;

  // Catch exceptions here
  options.parse(argc, argv);

  if(options.count("help") > 0) {
    std::cout << options.help({"", "params"}) << std::endl;
    return 0;
  }

  auto n = options["number"].as<uint32_t>();
  try {
    auto result = Fib::fib(n);
    std::cout << "The " << n << "' fibonacci number is: " << result << std::endl;
  } catch(std::overflow_error& e) {
    std::cout << e.what() << std::endl;
  }

  return 0;
}
