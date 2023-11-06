# Load the debug and release variables
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB DATA_FILES "${_DIR}/curaengine_grpc_definitions-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${curaengine_grpc_definitions_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${curaengine_grpc_definitions_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET curaengine_grpc_definitions::curaengine_grpc_definitions)
    add_library(curaengine_grpc_definitions::curaengine_grpc_definitions INTERFACE IMPORTED)
    message(${curaengine_grpc_definitions_MESSAGE_MODE} "Conan: Target declared 'curaengine_grpc_definitions::curaengine_grpc_definitions'")
endif()
# Load the debug and release library finders
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/curaengine_grpc_definitions-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()