########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(standardprojectsettings_COMPONENT_NAMES "")
set(standardprojectsettings_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(standardprojectsettings_PACKAGE_FOLDER_RELEASE "/home/natesawant/.conan/data/standardprojectsettings/0.1.1/ultimaker/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(standardprojectsettings_BUILD_MODULES_PATHS_RELEASE "${standardprojectsettings_PACKAGE_FOLDER_RELEASE}/res/cmake/StandardProjectSettings.cmake")


set(standardprojectsettings_INCLUDE_DIRS_RELEASE )
set(standardprojectsettings_RES_DIRS_RELEASE "${standardprojectsettings_PACKAGE_FOLDER_RELEASE}/res")
set(standardprojectsettings_DEFINITIONS_RELEASE )
set(standardprojectsettings_SHARED_LINK_FLAGS_RELEASE )
set(standardprojectsettings_EXE_LINK_FLAGS_RELEASE )
set(standardprojectsettings_OBJECTS_RELEASE )
set(standardprojectsettings_COMPILE_DEFINITIONS_RELEASE )
set(standardprojectsettings_COMPILE_OPTIONS_C_RELEASE )
set(standardprojectsettings_COMPILE_OPTIONS_CXX_RELEASE )
set(standardprojectsettings_LIB_DIRS_RELEASE )
set(standardprojectsettings_LIBS_RELEASE )
set(standardprojectsettings_SYSTEM_LIBS_RELEASE )
set(standardprojectsettings_FRAMEWORK_DIRS_RELEASE "${standardprojectsettings_PACKAGE_FOLDER_RELEASE}/Frameworks")
set(standardprojectsettings_FRAMEWORKS_RELEASE )
set(standardprojectsettings_BUILD_DIRS_RELEASE "${standardprojectsettings_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(standardprojectsettings_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${standardprojectsettings_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${standardprojectsettings_COMPILE_OPTIONS_C_RELEASE}>")
set(standardprojectsettings_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${standardprojectsettings_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${standardprojectsettings_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${standardprojectsettings_EXE_LINK_FLAGS_RELEASE}>")


set(standardprojectsettings_COMPONENTS_RELEASE )