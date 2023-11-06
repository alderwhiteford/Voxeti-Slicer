########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(curaengine_grpc_definitions_COMPONENT_NAMES "")
list(APPEND curaengine_grpc_definitions_FIND_DEPENDENCY_NAMES protobuf Boost asio-grpc gRPC OpenSSL)
list(REMOVE_DUPLICATES curaengine_grpc_definitions_FIND_DEPENDENCY_NAMES)
set(protobuf_FIND_MODE "NO_MODULE")
set(Boost_FIND_MODE "NO_MODULE")
set(asio-grpc_FIND_MODE "NO_MODULE")
set(gRPC_FIND_MODE "NO_MODULE")
set(OpenSSL_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(curaengine_grpc_definitions_PACKAGE_FOLDER_RELEASE "/home/natesawant/.conan/data/curaengine_grpc_definitions/0.2.0-alpha+testing_7e6d14/ultimaker/testing/package/667a4ffa85fbda8017fe1715e37f2d1b77da49dc")
set(curaengine_grpc_definitions_BUILD_MODULES_PATHS_RELEASE )


set(curaengine_grpc_definitions_INCLUDE_DIRS_RELEASE "${curaengine_grpc_definitions_PACKAGE_FOLDER_RELEASE}/include")
set(curaengine_grpc_definitions_RES_DIRS_RELEASE )
set(curaengine_grpc_definitions_DEFINITIONS_RELEASE )
set(curaengine_grpc_definitions_SHARED_LINK_FLAGS_RELEASE )
set(curaengine_grpc_definitions_EXE_LINK_FLAGS_RELEASE )
set(curaengine_grpc_definitions_OBJECTS_RELEASE )
set(curaengine_grpc_definitions_COMPILE_DEFINITIONS_RELEASE )
set(curaengine_grpc_definitions_COMPILE_OPTIONS_C_RELEASE )
set(curaengine_grpc_definitions_COMPILE_OPTIONS_CXX_RELEASE )
set(curaengine_grpc_definitions_LIB_DIRS_RELEASE "${curaengine_grpc_definitions_PACKAGE_FOLDER_RELEASE}/lib")
set(curaengine_grpc_definitions_LIBS_RELEASE curaengine_grpc_definitions)
set(curaengine_grpc_definitions_SYSTEM_LIBS_RELEASE )
set(curaengine_grpc_definitions_FRAMEWORK_DIRS_RELEASE )
set(curaengine_grpc_definitions_FRAMEWORKS_RELEASE )
set(curaengine_grpc_definitions_BUILD_DIRS_RELEASE "${curaengine_grpc_definitions_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(curaengine_grpc_definitions_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${curaengine_grpc_definitions_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${curaengine_grpc_definitions_COMPILE_OPTIONS_C_RELEASE}>")
set(curaengine_grpc_definitions_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${curaengine_grpc_definitions_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${curaengine_grpc_definitions_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${curaengine_grpc_definitions_EXE_LINK_FLAGS_RELEASE}>")


set(curaengine_grpc_definitions_COMPONENTS_RELEASE )