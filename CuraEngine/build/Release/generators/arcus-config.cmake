########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(arcus_FIND_QUIETLY)
    set(arcus_MESSAGE_MODE VERBOSE)
else()
    set(arcus_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/arcusTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${arcus_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(arcus_VERSION_STRING "5.3.0")
set(arcus_INCLUDE_DIRS ${arcus_INCLUDE_DIRS_RELEASE} )
set(arcus_INCLUDE_DIR ${arcus_INCLUDE_DIRS_RELEASE} )
set(arcus_LIBRARIES ${arcus_LIBRARIES_RELEASE} )
set(arcus_DEFINITIONS ${arcus_DEFINITIONS_RELEASE} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${arcus_BUILD_MODULES_PATHS_RELEASE} )
    message(${arcus_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


