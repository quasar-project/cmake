# Set metadata compile definitions for target.
# Currently sets PROJECT_NAME, PROJECT_VERSION, PROJECT_HOMEPAGE_URL, PROJECT_COMPANY defs.
# Usage: target_add_metadata_definitions(<target>)
macro(target_add_metadata_definitions __TARGET)
  target_compile_definitions(${__TARGET}
    PUBLIC
      -DPROJECT_NAME="${PROJECT_NAME}"
      -DPROJECT_VERSION="${PROJECT_VERSION}"
      -DPROJECT_COMPANY="Radar MMS"
      -DPROJECT_DOMAIN="${PROJECT_HOMEPAGE_URL}"
  )
endmacro()