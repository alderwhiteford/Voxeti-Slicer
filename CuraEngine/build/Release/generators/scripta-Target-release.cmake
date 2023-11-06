# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(scripta_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(scripta_FRAMEWORKS_FOUND_RELEASE "${scripta_FRAMEWORKS_RELEASE}" "${scripta_FRAMEWORK_DIRS_RELEASE}")

set(scripta_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET scripta_DEPS_TARGET)
    add_library(scripta_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET scripta_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${scripta_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${scripta_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### scripta_DEPS_TARGET to all of them
conan_package_library_targets("${scripta_LIBS_RELEASE}"    # libraries
                              "${scripta_LIB_DIRS_RELEASE}" # package_libdir
                              scripta_DEPS_TARGET
                              scripta_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "scripta")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${scripta_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET scripta::scripta
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${scripta_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${scripta_LIBRARIES_TARGETS}>
                 APPEND)

    if("${scripta_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET scripta::scripta
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     scripta_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET scripta::scripta
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${scripta_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET scripta::scripta
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${scripta_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET scripta::scripta
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${scripta_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET scripta::scripta
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${scripta_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(scripta_LIBRARIES_RELEASE scripta::scripta)
