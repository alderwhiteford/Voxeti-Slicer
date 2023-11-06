# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(asio-grpc_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(asio-grpc_FRAMEWORKS_FOUND_RELEASE "${asio-grpc_FRAMEWORKS_RELEASE}" "${asio-grpc_FRAMEWORK_DIRS_RELEASE}")

set(asio-grpc_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET asio-grpc_DEPS_TARGET)
    add_library(asio-grpc_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET asio-grpc_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${asio-grpc_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${asio-grpc_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:gRPC::grpc++_unsecure;Boost::headers>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### asio-grpc_DEPS_TARGET to all of them
conan_package_library_targets("${asio-grpc_LIBS_RELEASE}"    # libraries
                              "${asio-grpc_LIB_DIRS_RELEASE}" # package_libdir
                              asio-grpc_DEPS_TARGET
                              asio-grpc_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "asio-grpc")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${asio-grpc_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET asio-grpc::asio-grpc
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${asio-grpc_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${asio-grpc_LIBRARIES_TARGETS}>
                 APPEND)

    if("${asio-grpc_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET asio-grpc::asio-grpc
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     asio-grpc_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET asio-grpc::asio-grpc
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${asio-grpc_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET asio-grpc::asio-grpc
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${asio-grpc_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET asio-grpc::asio-grpc
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${asio-grpc_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET asio-grpc::asio-grpc
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${asio-grpc_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(asio-grpc_LIBRARIES_RELEASE asio-grpc::asio-grpc)
