# -*- cmake -*-
# - Find DIMJC
# Find the DIMJC includes and library
#
# This script will set the following variables:
#     DIMJC_FOUND - System has DIMJC
#     DIMJC_INCLUDE_DIRS - The DIMJC include directories
#     DIMJC_LIBRARIES - The libraries needed to use DIMJC
#
# Usage examples: 
#  find_package(DIMJC REQUIRED)
#  find_package(DIMJC)

# Initialization
INCLUDE( FindPackageHandleStandardArgs )

UNSET( DIMJC_INCLUDE_DIRS )
UNSET( DIMJC_LIBRARIES )
SET( DIMJC_FOUND FALSE )

# If DIMJC_DIR is available, set up our hints
IF( DIMJC_DIR )
    SET (DIMJC_INCLUDE_HINTS HINTS "${DIMJC_DIR}/include" "${DIMJC_DIR}")
    SET (DIMJC_LIBRARY_HINTS HINTS "${DIMJC_DIR}/lib")
ELSE()
  SET (DIMJC_INCLUDE_HINTS HINTS "/opt/dimjc" "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/dimjc")
  SET (DIMJC_LIBRARY_HINTS HINTS "/opt/dimjc" "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/dimjc")
ENDIF()

# Find DIMJC include directories
FIND_PATH(
    DIMJC_INCLUDE_DIRS DIMJCConfig.h
    PATHS ${DIMJC_INCLUDE_HINTS}
    PATH_SUFFIXES include
)

LIST(APPEND DIMJC_INCLUDE_DIRS ${DIMJC_INCLUDE_DIR} )

# Find DIMJC library
FIND_LIBRARY (
    DIMJC_LIBRARY
    NAMES libdimjc${CMAKE_SHARED_LIBRARY_SUFFIX}
    PATHS ${DIMJC_INCLUDE_HINTS}
    PATH_SUFFIXES lib
)

LIST(APPEND DIMJC_LIBRARIES ${DIMJC_LIBRARY} )

IF( DIMJC_INCLUDE_DIRS AND DIMJC_INCLUDE_DIRS )
    SET( DIMJC_FOUND TRUE )
ELSE()
    SET( DIMJC_FOUND FALSE )
ENDIF()

FIND_PACKAGE_HANDLE_STANDARD_ARGS( DIMJC DEFAULT_MSG DIMJC_LIBRARIES DIMJC_INCLUDE_DIRS)

MESSAGE( STATUS "Check for DIMJC_INCLUDE_DIRS: ${DIMJC_INCLUDE_DIRS}" )
MESSAGE( STATUS "Check for DIMJC_LIBRARIES: ${DIMJC_LIBRARIES}" )

MARK_AS_ADVANCED( DIMJC_LIBRARY DIMJC_INCLUDE_DIRS )