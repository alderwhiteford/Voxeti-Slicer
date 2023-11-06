########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(clipper_COMPONENT_NAMES "")
set(clipper_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(clipper_PACKAGE_FOLDER_RELEASE "/home/natesawant/.conan/data/clipper/6.4.2/_/_/package/8207dddeaa0eb47d6c605b11745caca15122b044")
set(clipper_BUILD_MODULES_PATHS_RELEASE )


set(clipper_INCLUDE_DIRS_RELEASE "${clipper_PACKAGE_FOLDER_RELEASE}/include")
set(clipper_RES_DIRS_RELEASE "${clipper_PACKAGE_FOLDER_RELEASE}/res")
set(clipper_DEFINITIONS_RELEASE )
set(clipper_SHARED_LINK_FLAGS_RELEASE )
set(clipper_EXE_LINK_FLAGS_RELEASE )
set(clipper_OBJECTS_RELEASE )
set(clipper_COMPILE_DEFINITIONS_RELEASE )
set(clipper_COMPILE_OPTIONS_C_RELEASE )
set(clipper_COMPILE_OPTIONS_CXX_RELEASE )
set(clipper_LIB_DIRS_RELEASE "${clipper_PACKAGE_FOLDER_RELEASE}/lib")
set(clipper_LIBS_RELEASE polyclipping)
set(clipper_SYSTEM_LIBS_RELEASE )
set(clipper_FRAMEWORK_DIRS_RELEASE "${clipper_PACKAGE_FOLDER_RELEASE}/Frameworks")
set(clipper_FRAMEWORKS_RELEASE )
set(clipper_BUILD_DIRS_RELEASE "${clipper_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(clipper_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${clipper_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${clipper_COMPILE_OPTIONS_C_RELEASE}>")
set(clipper_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${clipper_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${clipper_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${clipper_EXE_LINK_FLAGS_RELEASE}>")


set(clipper_COMPONENTS_RELEASE )