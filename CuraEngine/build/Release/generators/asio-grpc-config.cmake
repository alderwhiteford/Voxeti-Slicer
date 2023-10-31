########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(asio-grpc_FIND_QUIETLY)
    set(asio-grpc_MESSAGE_MODE VERBOSE)
else()
    set(asio-grpc_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/asio-grpcTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${asio-grpc_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(asio-grpc_VERSION_STRING "2.6.0")
set(asio-grpc_INCLUDE_DIRS ${asio-grpc_INCLUDE_DIRS_RELEASE} )
set(asio-grpc_INCLUDE_DIR ${asio-grpc_INCLUDE_DIRS_RELEASE} )
set(asio-grpc_LIBRARIES ${asio-grpc_LIBRARIES_RELEASE} )
set(asio-grpc_DEFINITIONS ${asio-grpc_DEFINITIONS_RELEASE} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${asio-grpc_BUILD_MODULES_PATHS_RELEASE} )
    message(${asio-grpc_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


