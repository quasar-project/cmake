# Sets definition for DLL import/export.
# Usage: target_add_shared_library_exports(<target>)
macro(target_add_shared_library_exports __TARGET)
  string(TOUPPER ${__TARGET} __TARGET_ALL_CAPS)
  target_compile_definitions(${__TARGET}
    PUBLIC
      -D${__TARGET_ALL_CAPS}_LIBRARY=1
  )
  message(STATUS "[${PROJECT_NAME}] added definition for shared library export: ${__TARGET_ALL_CAPS}_LIBRARY")
endmacro()

macro(target_add_static_library_exports __TARGET)
  string(TOUPPER ${__TARGET} __TARGET_ALL_CAPS)
  target_compile_definitions(${__TARGET}
    PUBLIC
      -D${__TARGET_ALL_CAPS}_STATIC_LIBRARY=1
  )
  message(STATUS "[${PROJECT_NAME}] added definition for static library export: ${__TARGET_ALL_CAPS}_STATIC_LIBRARY")
endmacro()