########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(asio-grpc_COMPONENT_NAMES "")
list(APPEND asio-grpc_FIND_DEPENDENCY_NAMES gRPC Boost)
list(REMOVE_DUPLICATES asio-grpc_FIND_DEPENDENCY_NAMES)
set(gRPC_FIND_MODE "NO_MODULE")
set(Boost_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(asio-grpc_PACKAGE_FOLDER_RELEASE "/Users/alderwhiteford/.conan/data/asio-grpc/2.6.0/_/_/package/bb6442aba7a6e403c16a912f65317abff8542491")
set(asio-grpc_BUILD_MODULES_PATHS_RELEASE "${asio-grpc_PACKAGE_FOLDER_RELEASE}/lib/cmake/asio-grpc/AsioGrpcProtobufGenerator.cmake")


set(asio-grpc_INCLUDE_DIRS_RELEASE "${asio-grpc_PACKAGE_FOLDER_RELEASE}/include")
set(asio-grpc_RES_DIRS_RELEASE )
set(asio-grpc_DEFINITIONS_RELEASE "-DAGRPC_BOOST_ASIO")
set(asio-grpc_SHARED_LINK_FLAGS_RELEASE )
set(asio-grpc_EXE_LINK_FLAGS_RELEASE )
set(asio-grpc_OBJECTS_RELEASE )
set(asio-grpc_COMPILE_DEFINITIONS_RELEASE "AGRPC_BOOST_ASIO")
set(asio-grpc_COMPILE_OPTIONS_C_RELEASE )
set(asio-grpc_COMPILE_OPTIONS_CXX_RELEASE )
set(asio-grpc_LIB_DIRS_RELEASE )
set(asio-grpc_LIBS_RELEASE )
set(asio-grpc_SYSTEM_LIBS_RELEASE )
set(asio-grpc_FRAMEWORK_DIRS_RELEASE )
set(asio-grpc_FRAMEWORKS_RELEASE )
set(asio-grpc_BUILD_DIRS_RELEASE "${asio-grpc_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(asio-grpc_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${asio-grpc_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${asio-grpc_COMPILE_OPTIONS_C_RELEASE}>")
set(asio-grpc_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${asio-grpc_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${asio-grpc_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${asio-grpc_EXE_LINK_FLAGS_RELEASE}>")


set(asio-grpc_COMPONENTS_RELEASE )