function(target_add_integration_tests TARGET)
  set(sources TESTS)
  set(additional_libraries ADDITIONAL_LIBRARIES)
  cmake_parse_arguments(TARGET_ADD_INTEGRATION_TESTS "" "" "${sources};${additional_libraries}" ${ARGN})
  message(STATUS "[${PROJECT_NAME}] adding integration tests: ${TARGET_ADD_INTEGRATION_TESTS_TESTS}")
  message(STATUS "[${PROJECT_NAME}] adding additional libraries to integration tests: ${TARGET_ADD_INTEGRATION_TESTS_ADDITIONAL_LIBRARIES}")

  find_package(GTest REQUIRED)
  enable_testing()
  add_executable(${TARGET}-test)
  target_sources(${TARGET}-test PRIVATE ${TARGET_ADD_INTEGRATION_TESTS_TESTS})
  target_link_libraries(${TARGET}-test
    PRIVATE
      ${TARGET_ADD_INTEGRATION_TESTS_ADDITIONAL_LIBRARIES}
      ${PROJECT_NAME}
      GTest::GTest
      GTest::Main
  )
  install(TARGETS ${TARGET}-test
    EXPORT ${TARGET}-test
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  )
endfunction()