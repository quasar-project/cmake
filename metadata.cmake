# Set metadata compile definitions for target.
# Currently sets PROJECT_NAME, PROJECT_VERSION, PROJECT_HOMEPAGE_URL, PROJECT_COMPANY defs.
# Usage: target_add_metadata_definitions(<target>)
function(target_add_metadata_definitions __TARGET)
  set(company COMPANY)
  cmake_parse_arguments(TARGET_ADD_INTEGRATION_TESTS "" "${company}" "" ${ARGN})
  message(STATUS "[${PROJECT_NAME}] setting company: ${TARGET_ADD_INTEGRATION_TESTS_COMPANY}")
  target_compile_definitions(${__TARGET}
    PRIVATE
      -DPROJECT_NAME="${PROJECT_NAME}"
      -DPROJECT_VERSION="${PROJECT_VERSION}"
      -DPROJECT_COMPANY=${TARGET_ADD_INTEGRATION_TESTS_COMPANY}
      -DPROJECT_DOMAIN="${PROJECT_HOMEPAGE_URL}"
  )
endfunction()