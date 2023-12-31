########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(re2_COMPONENT_NAMES "")
set(re2_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(re2_PACKAGE_FOLDER_RELEASE "/Users/alderwhiteford/.conan/data/re2/20230301/_/_/package/63312d5711219c8db2043ea7a697bcde8b3d4e92")
set(re2_BUILD_MODULES_PATHS_RELEASE )


set(re2_INCLUDE_DIRS_RELEASE "${re2_PACKAGE_FOLDER_RELEASE}/include")
set(re2_RES_DIRS_RELEASE )
set(re2_DEFINITIONS_RELEASE )
set(re2_SHARED_LINK_FLAGS_RELEASE )
set(re2_EXE_LINK_FLAGS_RELEASE )
set(re2_OBJECTS_RELEASE )
set(re2_COMPILE_DEFINITIONS_RELEASE )
set(re2_COMPILE_OPTIONS_C_RELEASE )
set(re2_COMPILE_OPTIONS_CXX_RELEASE )
set(re2_LIB_DIRS_RELEASE "${re2_PACKAGE_FOLDER_RELEASE}/lib")
set(re2_LIBS_RELEASE re2)
set(re2_SYSTEM_LIBS_RELEASE )
set(re2_FRAMEWORK_DIRS_RELEASE )
set(re2_FRAMEWORKS_RELEASE )
set(re2_BUILD_DIRS_RELEASE "${re2_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(re2_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${re2_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${re2_COMPILE_OPTIONS_C_RELEASE}>")
set(re2_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${re2_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${re2_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${re2_EXE_LINK_FLAGS_RELEASE}>")


set(re2_COMPONENTS_RELEASE )