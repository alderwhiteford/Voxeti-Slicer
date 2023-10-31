########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(scripta_COMPONENT_NAMES "")
set(scripta_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(scripta_PACKAGE_FOLDER_RELEASE "/Users/alderwhiteford/.conan/data/scripta/0.1.0/ultimaker/testing/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(scripta_BUILD_MODULES_PATHS_RELEASE )


set(scripta_INCLUDE_DIRS_RELEASE "${scripta_PACKAGE_FOLDER_RELEASE}/include")
set(scripta_RES_DIRS_RELEASE )
set(scripta_DEFINITIONS_RELEASE )
set(scripta_SHARED_LINK_FLAGS_RELEASE )
set(scripta_EXE_LINK_FLAGS_RELEASE )
set(scripta_OBJECTS_RELEASE )
set(scripta_COMPILE_DEFINITIONS_RELEASE )
set(scripta_COMPILE_OPTIONS_C_RELEASE )
set(scripta_COMPILE_OPTIONS_CXX_RELEASE )
set(scripta_LIB_DIRS_RELEASE )
set(scripta_LIBS_RELEASE )
set(scripta_SYSTEM_LIBS_RELEASE )
set(scripta_FRAMEWORK_DIRS_RELEASE )
set(scripta_FRAMEWORKS_RELEASE )
set(scripta_BUILD_DIRS_RELEASE "${scripta_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(scripta_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${scripta_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${scripta_COMPILE_OPTIONS_C_RELEASE}>")
set(scripta_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${scripta_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${scripta_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${scripta_EXE_LINK_FLAGS_RELEASE}>")


set(scripta_COMPONENTS_RELEASE )