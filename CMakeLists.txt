# set the minimum version request for cmake
cmake_minimum_required(VERSION 3.22)

# set the LANGUAGE
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_CUDA_COMPILER /usr/local/cuda/bin/nvcc)
set(CUDA_TOOLKIT_ROOT_DIR /usr/local/cuda-11.7)

project(hello
LANGUAGES C CXX CUDA
)

set(HELLO_VERSION 1.0.0)

# add the cmake submodule for convenience
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake;${CMAKE_MODULE_PATH}")
include(message_type)
include(add_dependency)

# be careful about the option
#set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_BUILD_TYPE Release)

add_subdirectory(examples)

########################################################################################
####  comment above code to make the library as a submodule of your project  ###########
########################################################################################

file(GLOB_RECURSE srcs CONFIGURE_DEPENDS src/*.cpp include/*.h)
add_library(hello ${srcs})
target_include_directories(hello PUBLIC include)
message_info("add library hello: version ${HELLO_VERSION}")

# add the dependencies of the library
