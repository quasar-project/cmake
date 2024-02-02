# Correctly find and set CMAKE_THREAD_PREFER_PTHREAD and THREADS_PREFER_PTHREAD_FLAG flags.
# Usage: find_threads()
macro(find_threads)
  message(STATUS "[${PROJECT_NAME}] looking for threads...")
  find_package(Threads REQUIRED)

  if(Threads_FOUND)
    set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
    set(THREADS_PREFER_PTHREAD_FLAG TRUE)
    message(STATUS "[${PROJECT_NAME}] looking for threads... OK!")
  else()
    message(FATAL_ERROR "[${PROJECT_NAME}] looking for threads... FAILURE")
  endif()
endmacro()