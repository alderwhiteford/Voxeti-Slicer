########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(neargye-semver_COMPONENT_NAMES "")
set(neargye-semver_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(neargye-semver_PACKAGE_FOLDER_RELEASE "/Users/alderwhiteford/.conan/data/neargye-semver/0.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(neargye-semver_BUILD_MODULES_PATHS_RELEASE )


set(neargye-semver_INCLUDE_DIRS_RELEASE "${neargye-semver_PACKAGE_FOLDER_RELEASE}/include")
set(neargye-semver_RES_DIRS_RELEASE "${neargye-semver_PACKAGE_FOLDER_RELEASE}/res")
set(neargye-semver_DEFINITIONS_RELEASE )
set(neargye-semver_SHARED_LINK_FLAGS_RELEASE )
set(neargye-semver_EXE_LINK_FLAGS_RELEASE )
set(neargye-semver_OBJECTS_RELEASE )
set(neargye-semver_COMPILE_DEFINITIONS_RELEASE )
set(neargye-semver_COMPILE_OPTIONS_C_RELEASE )
set(neargye-semver_COMPILE_OPTIONS_CXX_RELEASE )
set(neargye-semver_LIB_DIRS_RELEASE "${neargye-semver_PACKAGE_FOLDER_RELEASE}/lib")
set(neargye-semver_LIBS_RELEASE )
set(neargye-semver_SYSTEM_LIBS_RELEASE )
set(neargye-semver_FRAMEWORK_DIRS_RELEASE "${neargye-semver_PACKAGE_FOLDER_RELEASE}/Frameworks")
set(neargye-semver_FRAMEWORKS_RELEASE )
set(neargye-semver_BUILD_DIRS_RELEASE "${neargye-semver_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(neargye-semver_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${neargye-semver_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${neargye-semver_COMPILE_OPTIONS_C_RELEASE}>")
set(neargye-semver_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${neargye-semver_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${neargye-semver_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${neargye-semver_EXE_LINK_FLAGS_RELEASE}>")


set(neargye-semver_COMPONENTS_RELEASE )