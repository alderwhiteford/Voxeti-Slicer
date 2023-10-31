########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(scripta_FIND_QUIETLY)
    set(scripta_MESSAGE_MODE VERBOSE)
else()
    set(scripta_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/scriptaTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${scripta_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(scripta_VERSION_STRING "0.1.0")
set(scripta_INCLUDE_DIRS ${scripta_INCLUDE_DIRS_RELEASE} )
set(scripta_INCLUDE_DIR ${scripta_INCLUDE_DIRS_RELEASE} )
set(scripta_LIBRARIES ${scripta_LIBRARIES_RELEASE} )
set(scripta_DEFINITIONS ${scripta_DEFINITIONS_RELEASE} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${scripta_BUILD_MODULES_PATHS_RELEASE} )
    message(${scripta_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


