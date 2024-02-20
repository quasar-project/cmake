# # export targets
#
function(target_install_library TARGET)
  set(one_value_args NAME NAMESPACE)
  cmake_parse_arguments(TARGET_INSTALL_LIBRARY "" "${one_value_args}" "" ${ARGN})
  message(STATUS "[${PROJECT_NAME}] installing library: ${TARGET_INSTALL_LIBRARY_NAME}")
  message(STATUS "[${PROJECT_NAME}] installing in namespace: ${TARGET_INSTALL_LIBRARY_NAMESPACE}")

  include(GNUInstallDirs)
  include(GenerateExportHeader)
  include(CMakePackageConfigHelpers)

  message(STATUS "[${PROJECT_NAME}] installing in prefix: ${CMAKE_INSTALL_PREFIX}")
  set(project_config_in "${CMAKE_CURRENT_LIST_DIR}/${TARGET_INSTALL_LIBRARY_NAME}Config.cmake.in")
  set(project_config_out "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_INSTALL_LIBRARY_NAME}Config.cmake")
  set(config_targets_file "${TARGET_INSTALL_LIBRARY_NAME}ConfigTargets.cmake")
  set(version_config_file "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_INSTALL_LIBRARY_NAME}ConfigVersion.cmake")
  set(export_dest_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${TARGET_INSTALL_LIBRARY_NAME}")

  install(TARGETS ${TARGET}
    EXPORT ${TARGET}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  )

  install(DIRECTORY
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/${TARGET_INSTALL_LIBRARY_NAME}> $<INSTALL_INTERFACE:include/${TARGET_INSTALL_LIBRARY_NAME}> ;
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  )

  export(TARGETS ${TARGET}
    NAMESPACE ${TARGET_INSTALL_LIBRARY_NAMESPACE}::
    FILE "${CMAKE_CURRENT_BINARY_DIR}/${config_targets_file}"
  )

  install(EXPORT ${TARGET}
    DESTINATION "${export_dest_dir}"
    NAMESPACE ${TARGET_INSTALL_LIBRARY_NAMESPACE}::
    FILE "${config_targets_file}"
  )

  configure_package_config_file(
    "${project_config_in}" "${project_config_out}"
    INSTALL_DESTINATION "${export_dest_dir}"
  )

  write_basic_package_version_file(
    "${version_config_file}"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion
  )

  install(FILES
    "${project_config_out}" "${version_config_file}"
    DESTINATION "${export_dest_dir}"
  )
endfunction()
