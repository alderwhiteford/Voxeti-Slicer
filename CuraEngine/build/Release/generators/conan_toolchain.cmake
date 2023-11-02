

# Conan automatically generated toolchain file
# DO NOT EDIT MANUALLY, it will be overwritten

# Avoid including toolchain file several times (bad if appending to variables like
#   CMAKE_CXX_FLAGS. See https://github.com/android/ndk/issues/323
include_guard()

message(STATUS "Using Conan toolchain: ${CMAKE_CURRENT_LIST_FILE}")

if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeToolchain' generator only works with CMake >= 3.15")
endif()










# Set the architectures for which to build.
set(CMAKE_OSX_ARCHITECTURES arm64 CACHE STRING "" FORCE)
# Setting CMAKE_OSX_SYSROOT SDK, when using Xcode generator the name is enough
# but full path is necessary for others
set(CMAKE_OSX_SYSROOT macosx CACHE STRING "" FORCE)
set(BITCODE "")
set(FOBJC_ARC "")
set(VISIBILITY "")
#Check if Xcode generator is used, since that will handle these flags automagically
if(CMAKE_GENERATOR MATCHES "Xcode")
  message(DEBUG "Not setting any manual command-line buildflags, since Xcode is selected as generator.")
else()
    string(APPEND CONAN_C_FLAGS " ${BITCODE} ${FOBJC_ARC}")
    string(APPEND CONAN_CXX_FLAGS " ${BITCODE} ${VISIBILITY} ${FOBJC_ARC}")
endif()

string(APPEND CONAN_CXX_FLAGS " -stdlib=libc++")


message(STATUS "Conan toolchain: C++ Standard 20 with extensions OFF")
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Extra c, cxx, linkflags and defines


if(DEFINED CONAN_CXX_FLAGS)
  string(APPEND CMAKE_CXX_FLAGS_INIT " ${CONAN_CXX_FLAGS}")
endif()
if(DEFINED CONAN_C_FLAGS)
  string(APPEND CMAKE_C_FLAGS_INIT " ${CONAN_C_FLAGS}")
endif()
if(DEFINED CONAN_SHARED_LINKER_FLAGS)
  string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT " ${CONAN_SHARED_LINKER_FLAGS}")
endif()
if(DEFINED CONAN_EXE_LINKER_FLAGS)
  string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT " ${CONAN_EXE_LINKER_FLAGS}")
endif()

get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(_CMAKE_IN_TRY_COMPILE)
    message(STATUS "Running toolchain IN_TRY_COMPILE")
    return()
endif()

set(CMAKE_FIND_PACKAGE_PREFER_CONFIG ON)

# Definition of CMAKE_MODULE_PATH
# Explicitly defined "builddirs" of "host" dependencies
list(PREPEND CMAKE_MODULE_PATH "/Users/alderwhiteford/.conan/data/protobuf/3.21.9/_/_/package/fcefee49019fc94b52f2f9aaf0e81c1fe3a1ebb1/lib/cmake/protobuf")
# The root (which is the default builddirs) path of dependencies in the host context
list(PREPEND CMAKE_MODULE_PATH "/Users/alderwhiteford/.conan/data/arcus/5.3.0/_/_/package/1661683f567caf4f75105ad7e6c3e38089cad2f4/" "/Users/alderwhiteford/.conan/data/asio-grpc/2.6.0/_/_/package/bb6442aba7a6e403c16a912f65317abff8542491/" "/Users/alderwhiteford/.conan/data/curaengine_grpc_definitions/0.2.0-alpha+testing_7e6d14/ultimaker/testing/package/4d644e0fa22864e98f65a8017f5f81c286f655b8/" "/Users/alderwhiteford/.conan/data/clipper/6.4.2/_/_/package/735ba49d802a2fe573d275d029d112fb220a37f5/" "/Users/alderwhiteford/.conan/data/rapidjson/1.1.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/Users/alderwhiteford/.conan/data/stb/20200203/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/Users/alderwhiteford/.conan/data/spdlog/1.10.0/_/_/package/13ddee9a0d9f23358fa518ac489e4ef34af417f5/" "/Users/alderwhiteford/.conan/data/range-v3/0.12.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/Users/alderwhiteford/.conan/data/scripta/0.1.0/ultimaker/testing/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/Users/alderwhiteford/.conan/data/neargye-semver/0.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/Users/alderwhiteford/.conan/data/zlib/1.2.12/_/_/package/240c2182163325b213ca6886a7614c8ed2bf1738/" "/Users/alderwhiteford/.conan/data/openssl/1.1.1l/_/_/package/240c2182163325b213ca6886a7614c8ed2bf1738/" "/Users/alderwhiteford/.conan/data/re2/20230301/_/_/package/63312d5711219c8db2043ea7a697bcde8b3d4e92/" "/Users/alderwhiteford/.conan/data/grpc-proto/cci.20220627/_/_/package/99fe85f7410a6280253394281eb30fd88a924f91/" "/Users/alderwhiteford/.conan/data/standardprojectsettings/0.1.1/ultimaker/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/Users/alderwhiteford/.conan/data/gtest/1.12.1/_/_/package/6716176df8b1e3fda5ddb8e2249c740dc81b1886/")
# the generators folder (where conan generates files, like this toolchain)
list(PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

# Definition of CMAKE_PREFIX_PATH, CMAKE_XXXXX_PATH
# The explicitly defined "builddirs" of "host" context dependencies must be in PREFIX_PATH
list(PREPEND CMAKE_PREFIX_PATH "/Users/alderwhiteford/.conan/data/protobuf/3.21.9/_/_/package/fcefee49019fc94b52f2f9aaf0e81c1fe3a1ebb1/lib/cmake/protobuf")
# The Conan local "generators" folder, where this toolchain is saved.
list(PREPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR} )
list(PREPEND CMAKE_LIBRARY_PATH "/Users/alderwhiteford/.conan/data/arcus/5.3.0/_/_/package/1661683f567caf4f75105ad7e6c3e38089cad2f4/lib" "/Users/alderwhiteford/.conan/data/grpc/1.50.1/_/_/package/a8a61ca8f721607b9c581b3ee390ea9d1dbafa12/lib" "/Users/alderwhiteford/.conan/data/curaengine_grpc_definitions/0.2.0-alpha+testing_7e6d14/ultimaker/testing/package/4d644e0fa22864e98f65a8017f5f81c286f655b8/lib" "/Users/alderwhiteford/.conan/data/clipper/6.4.2/_/_/package/735ba49d802a2fe573d275d029d112fb220a37f5/lib" "/Users/alderwhiteford/.conan/data/boost/1.82.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" "/Users/alderwhiteford/.conan/data/rapidjson/1.1.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" "/Users/alderwhiteford/.conan/data/stb/20200203/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" "/Users/alderwhiteford/.conan/data/spdlog/1.10.0/_/_/package/13ddee9a0d9f23358fa518ac489e4ef34af417f5/lib" "/Users/alderwhiteford/.conan/data/fmt/9.0.0/_/_/package/2ac80ce7226bd1f5543449677eabdf97042a492d/lib" "/Users/alderwhiteford/.conan/data/range-v3/0.12.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" "/Users/alderwhiteford/.conan/data/neargye-semver/0.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" "/Users/alderwhiteford/.conan/data/protobuf/3.21.9/_/_/package/fcefee49019fc94b52f2f9aaf0e81c1fe3a1ebb1/lib" "/Users/alderwhiteford/.conan/data/zlib/1.2.12/_/_/package/240c2182163325b213ca6886a7614c8ed2bf1738/lib" "/Users/alderwhiteford/.conan/data/openssl/1.1.1l/_/_/package/240c2182163325b213ca6886a7614c8ed2bf1738/lib" "/Users/alderwhiteford/.conan/data/abseil/20220623.0/_/_/package/63312d5711219c8db2043ea7a697bcde8b3d4e92/lib" "/Users/alderwhiteford/.conan/data/c-ares/1.19.0/_/_/package/9064e69ec9435980c5beff445cf01756b9852e7d/lib" "/Users/alderwhiteford/.conan/data/re2/20230301/_/_/package/63312d5711219c8db2043ea7a697bcde8b3d4e92/lib" "/Users/alderwhiteford/.conan/data/googleapis/cci.20221108/_/_/package/b3f9590705df56b74b206ad64cd7c617ff79b63d/lib" "/Users/alderwhiteford/.conan/data/grpc-proto/cci.20220627/_/_/package/99fe85f7410a6280253394281eb30fd88a924f91/lib" "/Users/alderwhiteford/.conan/data/gtest/1.12.1/_/_/package/6716176df8b1e3fda5ddb8e2249c740dc81b1886/lib")
list(PREPEND CMAKE_FRAMEWORK_PATH "/Users/alderwhiteford/.conan/data/clipper/6.4.2/_/_/package/735ba49d802a2fe573d275d029d112fb220a37f5/Frameworks" "/Users/alderwhiteford/.conan/data/stb/20200203/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/Frameworks" "/Users/alderwhiteford/.conan/data/spdlog/1.10.0/_/_/package/13ddee9a0d9f23358fa518ac489e4ef34af417f5/Frameworks" "/Users/alderwhiteford/.conan/data/range-v3/0.12.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/Frameworks" "/Users/alderwhiteford/.conan/data/neargye-semver/0.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/Frameworks" "/Users/alderwhiteford/.conan/data/zlib/1.2.12/_/_/package/240c2182163325b213ca6886a7614c8ed2bf1738/Frameworks" "/Users/alderwhiteford/.conan/data/openssl/1.1.1l/_/_/package/240c2182163325b213ca6886a7614c8ed2bf1738/Frameworks" "/Users/alderwhiteford/.conan/data/standardprojectsettings/0.1.1/ultimaker/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/Frameworks" "/Users/alderwhiteford/.conan/data/gtest/1.12.1/_/_/package/6716176df8b1e3fda5ddb8e2249c740dc81b1886/Frameworks")
list(PREPEND CMAKE_INCLUDE_PATH "/Users/alderwhiteford/.conan/data/arcus/5.3.0/_/_/package/1661683f567caf4f75105ad7e6c3e38089cad2f4/include" "/Users/alderwhiteford/.conan/data/asio-grpc/2.6.0/_/_/package/bb6442aba7a6e403c16a912f65317abff8542491/include" "/Users/alderwhiteford/.conan/data/grpc/1.50.1/_/_/package/a8a61ca8f721607b9c581b3ee390ea9d1dbafa12/include" "/Users/alderwhiteford/.conan/data/curaengine_grpc_definitions/0.2.0-alpha+testing_7e6d14/ultimaker/testing/package/4d644e0fa22864e98f65a8017f5f81c286f655b8/include" "/Users/alderwhiteford/.conan/data/clipper/6.4.2/_/_/package/735ba49d802a2fe573d275d029d112fb220a37f5/include" "/Users/alderwhiteford/.conan/data/boost/1.82.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/Users/alderwhiteford/.conan/data/rapidjson/1.1.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/Users/alderwhiteford/.conan/data/stb/20200203/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/Users/alderwhiteford/.conan/data/spdlog/1.10.0/_/_/package/13ddee9a0d9f23358fa518ac489e4ef34af417f5/include" "/Users/alderwhiteford/.conan/data/fmt/9.0.0/_/_/package/2ac80ce7226bd1f5543449677eabdf97042a492d/include" "/Users/alderwhiteford/.conan/data/range-v3/0.12.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/Users/alderwhiteford/.conan/data/scripta/0.1.0/ultimaker/testing/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/Users/alderwhiteford/.conan/data/neargye-semver/0.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/Users/alderwhiteford/.conan/data/protobuf/3.21.9/_/_/package/fcefee49019fc94b52f2f9aaf0e81c1fe3a1ebb1/include" "/Users/alderwhiteford/.conan/data/zlib/1.2.12/_/_/package/240c2182163325b213ca6886a7614c8ed2bf1738/include" "/Users/alderwhiteford/.conan/data/openssl/1.1.1l/_/_/package/240c2182163325b213ca6886a7614c8ed2bf1738/include" "/Users/alderwhiteford/.conan/data/abseil/20220623.0/_/_/package/63312d5711219c8db2043ea7a697bcde8b3d4e92/include" "/Users/alderwhiteford/.conan/data/c-ares/1.19.0/_/_/package/9064e69ec9435980c5beff445cf01756b9852e7d/include" "/Users/alderwhiteford/.conan/data/re2/20230301/_/_/package/63312d5711219c8db2043ea7a697bcde8b3d4e92/include" "/Users/alderwhiteford/.conan/data/googleapis/cci.20221108/_/_/package/b3f9590705df56b74b206ad64cd7c617ff79b63d/include" "/Users/alderwhiteford/.conan/data/grpc-proto/cci.20220627/_/_/package/99fe85f7410a6280253394281eb30fd88a924f91/include" "/Users/alderwhiteford/.conan/data/gtest/1.12.1/_/_/package/6716176df8b1e3fda5ddb8e2249c740dc81b1886/include")



if (DEFINED ENV{PKG_CONFIG_PATH})
set(ENV{PKG_CONFIG_PATH} "/Users/alderwhiteford/Code Projects/Voxeti Slicer/CuraEngine/build/Release/generators:$ENV{PKG_CONFIG_PATH}")
else()
set(ENV{PKG_CONFIG_PATH} "/Users/alderwhiteford/Code Projects/Voxeti Slicer/CuraEngine/build/Release/generators:")
endif()




# Variables
set(CURA_ENGINE_VERSION "5.6.0-alpha" CACHE STRING "Variable CURA_ENGINE_VERSION conan-toolchain defined")
set(ENABLE_ARCUS "True" CACHE STRING "Variable ENABLE_ARCUS conan-toolchain defined")
set(ENABLE_TESTING ON CACHE BOOL "Variable ENABLE_TESTING conan-toolchain defined")
set(ENABLE_BENCHMARKS "False" CACHE STRING "Variable ENABLE_BENCHMARKS conan-toolchain defined")
set(EXTENSIVE_WARNINGS "False" CACHE STRING "Variable EXTENSIVE_WARNINGS conan-toolchain defined")
set(OLDER_APPLE_CLANG OFF CACHE BOOL "Variable OLDER_APPLE_CLANG conan-toolchain defined")
set(ENABLE_PLUGINS ON CACHE BOOL "Variable ENABLE_PLUGINS conan-toolchain defined")
set(ENABLE_REMOTE_PLUGINS "False" CACHE STRING "Variable ENABLE_REMOTE_PLUGINS conan-toolchain defined")
# Variables  per configuration


# Preprocessor definitions
# Preprocessor definitions per configuration
