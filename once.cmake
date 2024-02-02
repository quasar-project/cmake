# Header-guard for older cmake versions
# Usage: pragma_once()
macro(pragma_once)
  if(TARGET ${PROJECT_NAME})
    return()
  endif()
endmacro()