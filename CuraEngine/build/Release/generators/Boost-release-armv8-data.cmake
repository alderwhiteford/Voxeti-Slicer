########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND boost_COMPONENT_NAMES Boost::headers Boost::boost)
list(REMOVE_DUPLICATES boost_COMPONENT_NAMES)
set(boost_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(boost_PACKAGE_FOLDER_RELEASE "/Users/alderwhiteford/.conan/data/boost/1.82.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(boost_BUILD_MODULES_PATHS_RELEASE )


set(boost_INCLUDE_DIRS_RELEASE "${boost_PACKAGE_FOLDER_RELEASE}/include")
set(boost_RES_DIRS_RELEASE )
set(boost_DEFINITIONS_RELEASE )
set(boost_SHARED_LINK_FLAGS_RELEASE )
set(boost_EXE_LINK_FLAGS_RELEASE )
set(boost_OBJECTS_RELEASE )
set(boost_COMPILE_DEFINITIONS_RELEASE )
set(boost_COMPILE_OPTIONS_C_RELEASE )
set(boost_COMPILE_OPTIONS_CXX_RELEASE )
set(boost_LIB_DIRS_RELEASE "${boost_PACKAGE_FOLDER_RELEASE}/lib")
set(boost_LIBS_RELEASE )
set(boost_SYSTEM_LIBS_RELEASE )
set(boost_FRAMEWORK_DIRS_RELEASE )
set(boost_FRAMEWORKS_RELEASE )
set(boost_BUILD_DIRS_RELEASE )

# COMPOUND VARIABLES
set(boost_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${boost_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${boost_COMPILE_OPTIONS_C_RELEASE}>")
set(boost_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${boost_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${boost_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${boost_EXE_LINK_FLAGS_RELEASE}>")


set(boost_COMPONENTS_RELEASE Boost::headers Boost::boost)
########### COMPONENT Boost::boost VARIABLES ############################################

set(boost_Boost_boost_INCLUDE_DIRS_RELEASE "${boost_PACKAGE_FOLDER_RELEASE}/include")
set(boost_Boost_boost_LIB_DIRS_RELEASE "${boost_PACKAGE_FOLDER_RELEASE}/lib")
set(boost_Boost_boost_RES_DIRS_RELEASE )
set(boost_Boost_boost_DEFINITIONS_RELEASE )
set(boost_Boost_boost_OBJECTS_RELEASE )
set(boost_Boost_boost_COMPILE_DEFINITIONS_RELEASE )
set(boost_Boost_boost_COMPILE_OPTIONS_C_RELEASE "")
set(boost_Boost_boost_COMPILE_OPTIONS_CXX_RELEASE "")
set(boost_Boost_boost_LIBS_RELEASE )
set(boost_Boost_boost_SYSTEM_LIBS_RELEASE )
set(boost_Boost_boost_FRAMEWORK_DIRS_RELEASE )
set(boost_Boost_boost_FRAMEWORKS_RELEASE )
set(boost_Boost_boost_DEPENDENCIES_RELEASE Boost::headers)
set(boost_Boost_boost_SHARED_LINK_FLAGS_RELEASE )
set(boost_Boost_boost_EXE_LINK_FLAGS_RELEASE )
# COMPOUND VARIABLES
set(boost_Boost_boost_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${boost_Boost_boost_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${boost_Boost_boost_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${boost_Boost_boost_EXE_LINK_FLAGS_RELEASE}>
)
set(boost_Boost_boost_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${boost_Boost_boost_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${boost_Boost_boost_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Boost::headers VARIABLES ############################################

set(boost_Boost_headers_INCLUDE_DIRS_RELEASE "${boost_PACKAGE_FOLDER_RELEASE}/include")
set(boost_Boost_headers_LIB_DIRS_RELEASE "${boost_PACKAGE_FOLDER_RELEASE}/lib")
set(boost_Boost_headers_RES_DIRS_RELEASE )
set(boost_Boost_headers_DEFINITIONS_RELEASE )
set(boost_Boost_headers_OBJECTS_RELEASE )
set(boost_Boost_headers_COMPILE_DEFINITIONS_RELEASE )
set(boost_Boost_headers_COMPILE_OPTIONS_C_RELEASE "")
set(boost_Boost_headers_COMPILE_OPTIONS_CXX_RELEASE "")
set(boost_Boost_headers_LIBS_RELEASE )
set(boost_Boost_headers_SYSTEM_LIBS_RELEASE )
set(boost_Boost_headers_FRAMEWORK_DIRS_RELEASE )
set(boost_Boost_headers_FRAMEWORKS_RELEASE )
set(boost_Boost_headers_DEPENDENCIES_RELEASE )
set(boost_Boost_headers_SHARED_LINK_FLAGS_RELEASE )
set(boost_Boost_headers_EXE_LINK_FLAGS_RELEASE )
# COMPOUND VARIABLES
set(boost_Boost_headers_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${boost_Boost_headers_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${boost_Boost_headers_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${boost_Boost_headers_EXE_LINK_FLAGS_RELEASE}>
)
set(boost_Boost_headers_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${boost_Boost_headers_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${boost_Boost_headers_COMPILE_OPTIONS_C_RELEASE}>")