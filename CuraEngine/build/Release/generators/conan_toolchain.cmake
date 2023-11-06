

# Conan automatically generated toolchain file
# DO NOT EDIT MANUALLY, it will be overwritten

# Avoid including toolchain file several times (bad if appending to variables like
#   CMAKE_CXX_FLAGS. See https://github.com/android/ndk/issues/323
include_guard()

message(STATUS "Using Conan toolchain: ${CMAKE_CURRENT_LIST_FILE}")

if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeToolchain' generator only works with CMake >= 3.15")
endif()










string(APPEND CONAN_CXX_FLAGS " -m64")
string(APPEND CONAN_C_FLAGS " -m64")
string(APPEND CONAN_SHARED_LINKER_FLAGS " -m64")
string(APPEND CONAN_EXE_LINKER_FLAGS " -m64")

add_compile_definitions(_GLIBCXX_USE_CXX11_ABI=0)


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
list(PREPEND CMAKE_MODULE_PATH "/home/natesawant/.conan/data/protobuf/3.21.9/_/_/package/2d7fe4029ef2935cad9c11b65b2ef324eef3f738/lib/cmake/protobuf")
# The root (which is the default builddirs) path of dependencies in the host context
list(PREPEND CMAKE_MODULE_PATH "/home/natesawant/.conan/data/arcus/5.3.0/_/_/package/70bf4e95c22ecef69cbd08e29ee6823982617e66/" "/home/natesawant/.conan/data/asio-grpc/2.6.0/_/_/package/bb6442aba7a6e403c16a912f65317abff8542491/" "/home/natesawant/.conan/data/curaengine_grpc_definitions/0.2.0-alpha+testing_7e6d14/ultimaker/testing/package/667a4ffa85fbda8017fe1715e37f2d1b77da49dc/" "/home/natesawant/.conan/data/clipper/6.4.2/_/_/package/8207dddeaa0eb47d6c605b11745caca15122b044/" "/home/natesawant/.conan/data/rapidjson/1.1.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/home/natesawant/.conan/data/stb/20200203/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/home/natesawant/.conan/data/scripta/0.1.0/ultimaker/testing/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/home/natesawant/.conan/data/neargye-semver/0.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/home/natesawant/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/" "/home/natesawant/.conan/data/openssl/1.1.1l/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/" "/home/natesawant/.conan/data/re2/20230301/_/_/package/f41ad36a364e6c52f47e01592841a4f29e55a9eb/" "/home/natesawant/.conan/data/grpc-proto/cci.20220627/_/_/package/d99054a61e1e8873f76a684aed807e369c6ff22b/" "/home/natesawant/.conan/data/standardprojectsettings/0.1.1/ultimaker/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" "/home/natesawant/.conan/data/gtest/1.12.1/_/_/package/c77c76fb124ddeeed3272c8fb60d23d2f23e4404/")
# the generators folder (where conan generates files, like this toolchain)
list(PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

# Definition of CMAKE_PREFIX_PATH, CMAKE_XXXXX_PATH
# The explicitly defined "builddirs" of "host" context dependencies must be in PREFIX_PATH
list(PREPEND CMAKE_PREFIX_PATH "/home/natesawant/.conan/data/protobuf/3.21.9/_/_/package/2d7fe4029ef2935cad9c11b65b2ef324eef3f738/lib/cmake/protobuf")
# The Conan local "generators" folder, where this toolchain is saved.
list(PREPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR} )
list(PREPEND CMAKE_LIBRARY_PATH "/home/natesawant/.conan/data/arcus/5.3.0/_/_/package/70bf4e95c22ecef69cbd08e29ee6823982617e66/lib" "/home/natesawant/.conan/data/grpc/1.50.1/_/_/package/e3bea22aa8fdc1ff5b3f9bb562dbc0c9144463b1/lib" "/home/natesawant/.conan/data/curaengine_grpc_definitions/0.2.0-alpha+testing_7e6d14/ultimaker/testing/package/667a4ffa85fbda8017fe1715e37f2d1b77da49dc/lib" "/home/natesawant/.conan/data/clipper/6.4.2/_/_/package/8207dddeaa0eb47d6c605b11745caca15122b044/lib" "/home/natesawant/.conan/data/boost/1.82.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" "/home/natesawant/.conan/data/rapidjson/1.1.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" "/home/natesawant/.conan/data/stb/20200203/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" "/home/natesawant/.conan/data/spdlog/1.10.0/_/_/package/93619ca2e7a87e7c61ecba2796c9481a749417cc/lib" "/home/natesawant/.conan/data/fmt/9.0.0/_/_/package/68fc4976d3e6ccc402bc0c4977ab81a209be0e32/lib" "/home/natesawant/.conan/data/range-v3/0.12.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" "/home/natesawant/.conan/data/neargye-semver/0.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" "/home/natesawant/.conan/data/protobuf/3.21.9/_/_/package/2d7fe4029ef2935cad9c11b65b2ef324eef3f738/lib" "/home/natesawant/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib" "/home/natesawant/.conan/data/openssl/1.1.1l/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib" "/home/natesawant/.conan/data/abseil/20220623.0/_/_/package/f41ad36a364e6c52f47e01592841a4f29e55a9eb/lib" "/home/natesawant/.conan/data/c-ares/1.19.0/_/_/package/568a9f05046bc2a125b25bb11b7b1b0ed567b825/lib" "/home/natesawant/.conan/data/re2/20230301/_/_/package/f41ad36a364e6c52f47e01592841a4f29e55a9eb/lib" "/home/natesawant/.conan/data/googleapis/cci.20221108/_/_/package/f1d1cc9df74a589262f7ce8541368380114bd15a/lib" "/home/natesawant/.conan/data/grpc-proto/cci.20220627/_/_/package/d99054a61e1e8873f76a684aed807e369c6ff22b/lib" "/home/natesawant/.conan/data/gtest/1.12.1/_/_/package/c77c76fb124ddeeed3272c8fb60d23d2f23e4404/lib")
list(PREPEND CMAKE_INCLUDE_PATH "/home/natesawant/.conan/data/arcus/5.3.0/_/_/package/70bf4e95c22ecef69cbd08e29ee6823982617e66/include" "/home/natesawant/.conan/data/asio-grpc/2.6.0/_/_/package/bb6442aba7a6e403c16a912f65317abff8542491/include" "/home/natesawant/.conan/data/grpc/1.50.1/_/_/package/e3bea22aa8fdc1ff5b3f9bb562dbc0c9144463b1/include" "/home/natesawant/.conan/data/curaengine_grpc_definitions/0.2.0-alpha+testing_7e6d14/ultimaker/testing/package/667a4ffa85fbda8017fe1715e37f2d1b77da49dc/include" "/home/natesawant/.conan/data/clipper/6.4.2/_/_/package/8207dddeaa0eb47d6c605b11745caca15122b044/include" "/home/natesawant/.conan/data/boost/1.82.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/home/natesawant/.conan/data/rapidjson/1.1.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/home/natesawant/.conan/data/stb/20200203/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/home/natesawant/.conan/data/spdlog/1.10.0/_/_/package/93619ca2e7a87e7c61ecba2796c9481a749417cc/include" "/home/natesawant/.conan/data/fmt/9.0.0/_/_/package/68fc4976d3e6ccc402bc0c4977ab81a209be0e32/include" "/home/natesawant/.conan/data/range-v3/0.12.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/home/natesawant/.conan/data/scripta/0.1.0/ultimaker/testing/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/home/natesawant/.conan/data/neargye-semver/0.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" "/home/natesawant/.conan/data/protobuf/3.21.9/_/_/package/2d7fe4029ef2935cad9c11b65b2ef324eef3f738/include" "/home/natesawant/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include" "/home/natesawant/.conan/data/openssl/1.1.1l/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include" "/home/natesawant/.conan/data/abseil/20220623.0/_/_/package/f41ad36a364e6c52f47e01592841a4f29e55a9eb/include" "/home/natesawant/.conan/data/c-ares/1.19.0/_/_/package/568a9f05046bc2a125b25bb11b7b1b0ed567b825/include" "/home/natesawant/.conan/data/re2/20230301/_/_/package/f41ad36a364e6c52f47e01592841a4f29e55a9eb/include" "/home/natesawant/.conan/data/googleapis/cci.20221108/_/_/package/f1d1cc9df74a589262f7ce8541368380114bd15a/include" "/home/natesawant/.conan/data/grpc-proto/cci.20220627/_/_/package/d99054a61e1e8873f76a684aed807e369c6ff22b/include" "/home/natesawant/.conan/data/gtest/1.12.1/_/_/package/c77c76fb124ddeeed3272c8fb60d23d2f23e4404/include")



if (DEFINED ENV{PKG_CONFIG_PATH})
set(ENV{PKG_CONFIG_PATH} "/home/natesawant/Voxeti-Slicer/CuraEngine/build/Release/generators:$ENV{PKG_CONFIG_PATH}")
else()
set(ENV{PKG_CONFIG_PATH} "/home/natesawant/Voxeti-Slicer/CuraEngine/build/Release/generators:")
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
