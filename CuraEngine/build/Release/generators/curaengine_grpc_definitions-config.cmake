########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(curaengine_grpc_definitions_FIND_QUIETLY)
    set(curaengine_grpc_definitions_MESSAGE_MODE VERBOSE)
else()
    set(curaengine_grpc_definitions_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/curaengine_grpc_definitionsTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${curaengine_grpc_definitions_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(curaengine_grpc_definitions_VERSION_STRING "0.2.0-alpha+testing_7e6d14")
set(curaengine_grpc_definitions_INCLUDE_DIRS ${curaengine_grpc_definitions_INCLUDE_DIRS_RELEASE} )
set(curaengine_grpc_definitions_INCLUDE_DIR ${curaengine_grpc_definitions_INCLUDE_DIRS_RELEASE} )
set(curaengine_grpc_definitions_LIBRARIES ${curaengine_grpc_definitions_LIBRARIES_RELEASE} )
set(curaengine_grpc_definitions_DEFINITIONS ${curaengine_grpc_definitions_DEFINITIONS_RELEASE} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${curaengine_grpc_definitions_BUILD_MODULES_PATHS_RELEASE} )
    message(${curaengine_grpc_definitions_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


