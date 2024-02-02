# Correctly set C++ standard.
# Bonus feature: fixes Visual Studio generator =) and enables FPIC
# Usage: set_language_standard(20)
macro(set_language_standard __STANDARD)
  if(NOT CMAKE_CXX_STANDARD)
    message(STATUS "[${PROJECT_NAME}] setting c++ standard to ${__STANDARD}")
    set(CMAKE_CXX_STANDARD ${__STANDARD})
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
  endif(NOT CMAKE_CXX_STANDARD)

  if("${CMAKE_GENERATOR}" MATCHES "^Visual Studio")
    set(CMAKE_GENERATOR_PLATFORM "x64" CACHE STRING "" FORCE)
  endif()

  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endmacro()