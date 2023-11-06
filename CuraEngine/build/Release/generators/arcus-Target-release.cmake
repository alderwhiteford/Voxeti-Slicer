# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(arcus_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(arcus_FRAMEWORKS_FOUND_RELEASE "${arcus_FRAMEWORKS_RELEASE}" "${arcus_FRAMEWORK_DIRS_RELEASE}")

set(arcus_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET arcus_DEPS_TARGET)
    add_library(arcus_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET arcus_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${arcus_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${arcus_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:protobuf::protobuf>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### arcus_DEPS_TARGET to all of them
conan_package_library_targets("${arcus_LIBS_RELEASE}"    # libraries
                              "${arcus_LIB_DIRS_RELEASE}" # package_libdir
                              arcus_DEPS_TARGET
                              arcus_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "arcus")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${arcus_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET arcus::arcus
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${arcus_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${arcus_LIBRARIES_TARGETS}>
                 APPEND)

    if("${arcus_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET arcus::arcus
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     arcus_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET arcus::arcus
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${arcus_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET arcus::arcus
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${arcus_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET arcus::arcus
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${arcus_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET arcus::arcus
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${arcus_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(arcus_LIBRARIES_RELEASE arcus::arcus)
