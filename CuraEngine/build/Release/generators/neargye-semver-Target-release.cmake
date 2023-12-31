# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(neargye-semver_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(neargye-semver_FRAMEWORKS_FOUND_RELEASE "${neargye-semver_FRAMEWORKS_RELEASE}" "${neargye-semver_FRAMEWORK_DIRS_RELEASE}")

set(neargye-semver_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET neargye-semver_DEPS_TARGET)
    add_library(neargye-semver_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET neargye-semver_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${neargye-semver_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${neargye-semver_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### neargye-semver_DEPS_TARGET to all of them
conan_package_library_targets("${neargye-semver_LIBS_RELEASE}"    # libraries
                              "${neargye-semver_LIB_DIRS_RELEASE}" # package_libdir
                              neargye-semver_DEPS_TARGET
                              neargye-semver_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "neargye-semver")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${neargye-semver_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET neargye-semver::neargye-semver
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${neargye-semver_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${neargye-semver_LIBRARIES_TARGETS}>
                 APPEND)

    if("${neargye-semver_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET neargye-semver::neargye-semver
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     neargye-semver_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET neargye-semver::neargye-semver
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${neargye-semver_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET neargye-semver::neargye-semver
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${neargye-semver_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET neargye-semver::neargye-semver
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${neargye-semver_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET neargye-semver::neargye-semver
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${neargye-semver_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(neargye-semver_LIBRARIES_RELEASE neargye-semver::neargye-semver)
