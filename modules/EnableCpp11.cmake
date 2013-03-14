
# EnableCpp11.cmake
#
# Enable C++11 support for various compilers and build systems.
# Currently supported: 
#	- GNU C++ Compiler (g++)
#	- Clang compiler (LLVM frontend)
#	- Appple Xcode
#
# author: Ruslan Mullakhmetov
# date	: 6 Mar 2013
# 

set( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake_stuff )

if ( "${CMAKE_GENERATOR}" STREQUAL "Xcode" )
	message( STATUS "Setting Xcode attributes")
	set(CMAKE_XCODE_ATTRIBUTE_GCC_VERSION "com.apple.compilers.llvm.clang.1_0")
	set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "c++11")
	set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
	set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -std=c++11 -stdlib=libc++ -g -Wall")
endif()

message( STATUS "COMPILER: " ${CMAKE_CXX_COMPILER_ID})

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
	message( STATUS "Configuring for clang")
	set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -stdlib=libc++")
endif()

if( CMAKE_COMPILER_IS_GNUCC AND (NOT ("${CMAKE_GENERATOR}" STREQUAL "Xcode") AND ${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU") )

        include(CheckCompiler)

        if( ${CMAKE_CXX_COMPILER_PATCH} VERSION_LESS "4.7" )
                message ( FATAL_ERROR "GCC version 4.7 or greater is required" )
        endif()

	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

endif()
