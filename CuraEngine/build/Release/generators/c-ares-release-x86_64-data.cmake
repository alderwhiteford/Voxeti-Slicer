########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND c-ares_COMPONENT_NAMES c-ares::cares)
list(REMOVE_DUPLICATES c-ares_COMPONENT_NAMES)
set(c-ares_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(c-ares_PACKAGE_FOLDER_RELEASE "/home/natesawant/.conan/data/c-ares/1.19.0/_/_/package/568a9f05046bc2a125b25bb11b7b1b0ed567b825")
set(c-ares_BUILD_MODULES_PATHS_RELEASE )


set(c-ares_INCLUDE_DIRS_RELEASE "${c-ares_PACKAGE_FOLDER_RELEASE}/include")
set(c-ares_RES_DIRS_RELEASE )
set(c-ares_DEFINITIONS_RELEASE "-DCARES_STATICLIB")
set(c-ares_SHARED_LINK_FLAGS_RELEASE )
set(c-ares_EXE_LINK_FLAGS_RELEASE )
set(c-ares_OBJECTS_RELEASE )
set(c-ares_COMPILE_DEFINITIONS_RELEASE "CARES_STATICLIB")
set(c-ares_COMPILE_OPTIONS_C_RELEASE )
set(c-ares_COMPILE_OPTIONS_CXX_RELEASE )
set(c-ares_LIB_DIRS_RELEASE "${c-ares_PACKAGE_FOLDER_RELEASE}/lib")
set(c-ares_LIBS_RELEASE cares)
set(c-ares_SYSTEM_LIBS_RELEASE rt)
set(c-ares_FRAMEWORK_DIRS_RELEASE )
set(c-ares_FRAMEWORKS_RELEASE )
set(c-ares_BUILD_DIRS_RELEASE )

# COMPOUND VARIABLES
set(c-ares_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${c-ares_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${c-ares_COMPILE_OPTIONS_C_RELEASE}>")
set(c-ares_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${c-ares_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${c-ares_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${c-ares_EXE_LINK_FLAGS_RELEASE}>")


set(c-ares_COMPONENTS_RELEASE c-ares::cares)
########### COMPONENT c-ares::cares VARIABLES ############################################

set(c-ares_c-ares_cares_INCLUDE_DIRS_RELEASE "${c-ares_PACKAGE_FOLDER_RELEASE}/include")
set(c-ares_c-ares_cares_LIB_DIRS_RELEASE "${c-ares_PACKAGE_FOLDER_RELEASE}/lib")
set(c-ares_c-ares_cares_RES_DIRS_RELEASE )
set(c-ares_c-ares_cares_DEFINITIONS_RELEASE "-DCARES_STATICLIB")
set(c-ares_c-ares_cares_OBJECTS_RELEASE )
set(c-ares_c-ares_cares_COMPILE_DEFINITIONS_RELEASE "CARES_STATICLIB")
set(c-ares_c-ares_cares_COMPILE_OPTIONS_C_RELEASE "")
set(c-ares_c-ares_cares_COMPILE_OPTIONS_CXX_RELEASE "")
set(c-ares_c-ares_cares_LIBS_RELEASE cares)
set(c-ares_c-ares_cares_SYSTEM_LIBS_RELEASE rt)
set(c-ares_c-ares_cares_FRAMEWORK_DIRS_RELEASE )
set(c-ares_c-ares_cares_FRAMEWORKS_RELEASE )
set(c-ares_c-ares_cares_DEPENDENCIES_RELEASE )
set(c-ares_c-ares_cares_SHARED_LINK_FLAGS_RELEASE )
set(c-ares_c-ares_cares_EXE_LINK_FLAGS_RELEASE )
# COMPOUND VARIABLES
set(c-ares_c-ares_cares_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${c-ares_c-ares_cares_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${c-ares_c-ares_cares_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${c-ares_c-ares_cares_EXE_LINK_FLAGS_RELEASE}>
)
set(c-ares_c-ares_cares_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${c-ares_c-ares_cares_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${c-ares_c-ares_cares_COMPILE_OPTIONS_C_RELEASE}>")