########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(standardprojectsettings_FIND_QUIETLY)
    set(standardprojectsettings_MESSAGE_MODE VERBOSE)
else()
    set(standardprojectsettings_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/standardprojectsettingsTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${standardprojectsettings_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(standardprojectsettings_VERSION_STRING "0.1.1")
set(standardprojectsettings_INCLUDE_DIRS ${standardprojectsettings_INCLUDE_DIRS_RELEASE} )
set(standardprojectsettings_INCLUDE_DIR ${standardprojectsettings_INCLUDE_DIRS_RELEASE} )
set(standardprojectsettings_LIBRARIES ${standardprojectsettings_LIBRARIES_RELEASE} )
set(standardprojectsettings_DEFINITIONS ${standardprojectsettings_DEFINITIONS_RELEASE} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${standardprojectsettings_BUILD_MODULES_PATHS_RELEASE} )
    message(${standardprojectsettings_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


