# subject to change

function(generate_coverage_report __TARGET __TESTRUNNER __OUTNAME)
  message(STATUS "[${PROJECT_NAME}] trying to find gcovr...")
  find_program(GCOVR_PATH gcovr)

  if(NOT GCOVR_PATH)
    message(STATUS "[${PROJECT_NAME}] trying to find gcovr... FAILURE")
  else()
    message(STATUS "[${PROJECT_NAME}] trying to find gcovr... OK!")
    target_add_code_coverage(${__TARGET} ${__TESTRUNNER} ${__OUTNAME})
  endif()
endfunction()

function(target_add_code_coverage __TARGET __TESTRUNNER __OUTNAME)
  message(STATUS "[${PROJECT_NAME}] adding code coverage...")
  if(NOT GCOVR_PATH)
    message(FATAL_ERROR "[${PROJECT_NAME}] gcovr not found. Set GCOVR_PATH to gcovr executable path.")
  endif()

  add_custom_target(${__TARGET}
    # run tests
    ${__TESTRUNNER} ${ARGV3}

    COMMAND ${GCOVR_PATH} -x -r '${CMAKE_CURRENT_SOURCE_DIR}' -e '${CMAKE_CURRENT_SOURCE_DIR}/build/' -o ${__OUTNAME}.xml
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "generating code coverage report..."
  )

  add_custom_command(TARGET ${__TARGET} POST_BUILD
    COMMAND ;
    COMMENT "code coverage report saved to ${__OUTNAME}.xml"
  )
endfunction()