# Load the debug and release variables
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB DATA_FILES "${_DIR}/neargye-semver-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${neargye-semver_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${neargye-semver_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET neargye-semver::neargye-semver)
    add_library(neargye-semver::neargye-semver INTERFACE IMPORTED)
    message(${neargye-semver_MESSAGE_MODE} "Conan: Target declared 'neargye-semver::neargye-semver'")
endif()
# Load the debug and release library finders
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/neargye-semver-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()