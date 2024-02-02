# Checks all dirty language features and hacks.
# Produces fairly nice error messages instead of compilation failures.
# Usage: check_language_features()
function(check_language_features)
  include(CheckCXXSourceCompiles)
  message(STATUS "[${PROJECT_NAME}] checking language features...")

  message(STATUS "[${PROJECT_NAME}] checking dollar macro...")
  check_cxx_source_compiles(
    "#include <iostream>
    #define $dollar(x) x
    int main() {
      std::cout << $dollar(1.0) << std::endl;
      return 0;
    }
    #undef $dollar"
    DOLLAR_MACRO_ALLOWED
  )
  if(NOT DOLLAR_MACRO_ALLOWED)
    message(FATAL_ERROR "[${PROJECT_NAME}] checking dollar macro... FAILURE")
  else()
    message(STATUS "[${PROJECT_NAME}] checking dollar macro... OK!")
  endif()
endfunction()