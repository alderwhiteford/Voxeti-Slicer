########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(neargye-semver_FIND_QUIETLY)
    set(neargye-semver_MESSAGE_MODE VERBOSE)
else()
    set(neargye-semver_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/neargye-semverTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${neargye-semver_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(neargye-semver_VERSION_STRING "0.3.0")
set(neargye-semver_INCLUDE_DIRS ${neargye-semver_INCLUDE_DIRS_RELEASE} )
set(neargye-semver_INCLUDE_DIR ${neargye-semver_INCLUDE_DIRS_RELEASE} )
set(neargye-semver_LIBRARIES ${neargye-semver_LIBRARIES_RELEASE} )
set(neargye-semver_DEFINITIONS ${neargye-semver_DEFINITIONS_RELEASE} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${neargye-semver_BUILD_MODULES_PATHS_RELEASE} )
    message(${neargye-semver_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


