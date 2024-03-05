macro(enable_cross_compile_options)
    set(MINGW_ADDITIONAL_LIBDIR "" CACHE STRING "Additional libraries directory for cross-compiling")

    string(COMPARE EQUAL "${MINGW_ADDITIONAL_LIBDIR}" "" MINGW_CROSS_COMPILING_STATE)
    if(NOT ${MINGW_CROSS_COMPILING_STATE})
        list(APPEND CMAKE_FIND_ROOT_PATH "${PROJECT_SOURCE_DIR}/${MINGW_ADDITIONAL_LIBDIR}")
        message(STATUS "set additional root paths: ${CMAKE_FIND_ROOT_PATH}")
        # for libraries and headers in the target directories
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
    endif()
endmacro()