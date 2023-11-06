# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(boost_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(boost_FRAMEWORKS_FOUND_RELEASE "${boost_FRAMEWORKS_RELEASE}" "${boost_FRAMEWORK_DIRS_RELEASE}")

set(boost_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET boost_DEPS_TARGET)
    add_library(boost_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET boost_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${boost_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${boost_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:Boost::headers>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### boost_DEPS_TARGET to all of them
conan_package_library_targets("${boost_LIBS_RELEASE}"    # libraries
                              "${boost_LIB_DIRS_RELEASE}" # package_libdir
                              boost_DEPS_TARGET
                              boost_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "boost")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${boost_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Release ########################################

    ########## COMPONENT Boost::boost #############

        set(boost_Boost_boost_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(boost_Boost_boost_FRAMEWORKS_FOUND_RELEASE "${boost_Boost_boost_FRAMEWORKS_RELEASE}" "${boost_Boost_boost_FRAMEWORK_DIRS_RELEASE}")

        set(boost_Boost_boost_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET boost_Boost_boost_DEPS_TARGET)
            add_library(boost_Boost_boost_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET boost_Boost_boost_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${boost_Boost_boost_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${boost_Boost_boost_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${boost_Boost_boost_DEPENDENCIES_RELEASE}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'boost_Boost_boost_DEPS_TARGET' to all of them
        conan_package_library_targets("${boost_Boost_boost_LIBS_RELEASE}"
                                      "${boost_Boost_boost_LIB_DIRS_RELEASE}"
                                      boost_Boost_boost_DEPS_TARGET
                                      boost_Boost_boost_LIBRARIES_TARGETS
                                      "_RELEASE"
                                      "boost_Boost_boost")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Boost::boost
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${boost_Boost_boost_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${boost_Boost_boost_LIBRARIES_TARGETS}>
                     APPEND)

        if("${boost_Boost_boost_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Boost::boost
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         boost_Boost_boost_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET Boost::boost PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${boost_Boost_boost_LINKER_FLAGS_RELEASE}> APPEND)
        set_property(TARGET Boost::boost PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${boost_Boost_boost_INCLUDE_DIRS_RELEASE}> APPEND)
        set_property(TARGET Boost::boost PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${boost_Boost_boost_COMPILE_DEFINITIONS_RELEASE}> APPEND)
        set_property(TARGET Boost::boost PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${boost_Boost_boost_COMPILE_OPTIONS_RELEASE}> APPEND)

    ########## COMPONENT Boost::headers #############

        set(boost_Boost_headers_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(boost_Boost_headers_FRAMEWORKS_FOUND_RELEASE "${boost_Boost_headers_FRAMEWORKS_RELEASE}" "${boost_Boost_headers_FRAMEWORK_DIRS_RELEASE}")

        set(boost_Boost_headers_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET boost_Boost_headers_DEPS_TARGET)
            add_library(boost_Boost_headers_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET boost_Boost_headers_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${boost_Boost_headers_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${boost_Boost_headers_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${boost_Boost_headers_DEPENDENCIES_RELEASE}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'boost_Boost_headers_DEPS_TARGET' to all of them
        conan_package_library_targets("${boost_Boost_headers_LIBS_RELEASE}"
                                      "${boost_Boost_headers_LIB_DIRS_RELEASE}"
                                      boost_Boost_headers_DEPS_TARGET
                                      boost_Boost_headers_LIBRARIES_TARGETS
                                      "_RELEASE"
                                      "boost_Boost_headers")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Boost::headers
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${boost_Boost_headers_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${boost_Boost_headers_LIBRARIES_TARGETS}>
                     APPEND)

        if("${boost_Boost_headers_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Boost::headers
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         boost_Boost_headers_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET Boost::headers PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${boost_Boost_headers_LINKER_FLAGS_RELEASE}> APPEND)
        set_property(TARGET Boost::headers PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${boost_Boost_headers_INCLUDE_DIRS_RELEASE}> APPEND)
        set_property(TARGET Boost::headers PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${boost_Boost_headers_COMPILE_DEFINITIONS_RELEASE}> APPEND)
        set_property(TARGET Boost::headers PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${boost_Boost_headers_COMPILE_OPTIONS_RELEASE}> APPEND)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET boost::boost PROPERTY INTERFACE_LINK_LIBRARIES Boost::boost APPEND)
    set_property(TARGET boost::boost PROPERTY INTERFACE_LINK_LIBRARIES Boost::headers APPEND)

########## For the modules (FindXXX)
set(boost_LIBRARIES_RELEASE boost::boost)
