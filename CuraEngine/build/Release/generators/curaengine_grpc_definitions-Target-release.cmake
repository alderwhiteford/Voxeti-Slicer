# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(curaengine_grpc_definitions_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(curaengine_grpc_definitions_FRAMEWORKS_FOUND_RELEASE "${curaengine_grpc_definitions_FRAMEWORKS_RELEASE}" "${curaengine_grpc_definitions_FRAMEWORK_DIRS_RELEASE}")

set(curaengine_grpc_definitions_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET curaengine_grpc_definitions_DEPS_TARGET)
    add_library(curaengine_grpc_definitions_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET curaengine_grpc_definitions_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${curaengine_grpc_definitions_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${curaengine_grpc_definitions_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:protobuf::protobuf;boost::boost;asio-grpc::asio-grpc;grpc::grpc;openssl::openssl>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### curaengine_grpc_definitions_DEPS_TARGET to all of them
conan_package_library_targets("${curaengine_grpc_definitions_LIBS_RELEASE}"    # libraries
                              "${curaengine_grpc_definitions_LIB_DIRS_RELEASE}" # package_libdir
                              curaengine_grpc_definitions_DEPS_TARGET
                              curaengine_grpc_definitions_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "curaengine_grpc_definitions")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${curaengine_grpc_definitions_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET curaengine_grpc_definitions::curaengine_grpc_definitions
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${curaengine_grpc_definitions_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${curaengine_grpc_definitions_LIBRARIES_TARGETS}>
                 APPEND)

    if("${curaengine_grpc_definitions_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET curaengine_grpc_definitions::curaengine_grpc_definitions
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     curaengine_grpc_definitions_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET curaengine_grpc_definitions::curaengine_grpc_definitions
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${curaengine_grpc_definitions_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET curaengine_grpc_definitions::curaengine_grpc_definitions
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${curaengine_grpc_definitions_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET curaengine_grpc_definitions::curaengine_grpc_definitions
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${curaengine_grpc_definitions_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET curaengine_grpc_definitions::curaengine_grpc_definitions
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${curaengine_grpc_definitions_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(curaengine_grpc_definitions_LIBRARIES_RELEASE curaengine_grpc_definitions::curaengine_grpc_definitions)
