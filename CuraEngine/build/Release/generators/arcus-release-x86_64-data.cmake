########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(arcus_COMPONENT_NAMES "")
list(APPEND arcus_FIND_DEPENDENCY_NAMES protobuf)
list(REMOVE_DUPLICATES arcus_FIND_DEPENDENCY_NAMES)
set(protobuf_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(arcus_PACKAGE_FOLDER_RELEASE "/home/natesawant/.conan/data/arcus/5.3.0/_/_/package/70bf4e95c22ecef69cbd08e29ee6823982617e66")
set(arcus_BUILD_MODULES_PATHS_RELEASE )


set(arcus_INCLUDE_DIRS_RELEASE "${arcus_PACKAGE_FOLDER_RELEASE}/include")
set(arcus_RES_DIRS_RELEASE )
set(arcus_DEFINITIONS_RELEASE )
set(arcus_SHARED_LINK_FLAGS_RELEASE )
set(arcus_EXE_LINK_FLAGS_RELEASE )
set(arcus_OBJECTS_RELEASE )
set(arcus_COMPILE_DEFINITIONS_RELEASE )
set(arcus_COMPILE_OPTIONS_C_RELEASE )
set(arcus_COMPILE_OPTIONS_CXX_RELEASE )
set(arcus_LIB_DIRS_RELEASE "${arcus_PACKAGE_FOLDER_RELEASE}/lib")
set(arcus_LIBS_RELEASE Arcus)
set(arcus_SYSTEM_LIBS_RELEASE pthread)
set(arcus_FRAMEWORK_DIRS_RELEASE )
set(arcus_FRAMEWORKS_RELEASE )
set(arcus_BUILD_DIRS_RELEASE "${arcus_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(arcus_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${arcus_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${arcus_COMPILE_OPTIONS_C_RELEASE}>")
set(arcus_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${arcus_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${arcus_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${arcus_EXE_LINK_FLAGS_RELEASE}>")


set(arcus_COMPONENTS_RELEASE )