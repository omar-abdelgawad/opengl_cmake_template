cmake_minimum_required(VERSION 3.0.0)#default
project(OPENGL_FIRST_TIME VERSION 0.1.0 LANGUAGES C CXX)#default

# for making compile_commands.json for clangd lsp
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(CTest)#default
enable_testing()#default

add_executable(APP main.cpp)#default but can be modified
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin)#to set the executable output path in bin directory
set(CPACK_PROJECT_NAME ${PROJECT_NAME})#default
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})#default
include(CPack)#default
######################################################### extra stuff I learned
# file(COPY ${CMAKE_SOURCE_DIR}/res DESTINATION ${CMAKE_CURRENT_BINARY_DIR})#this is the only sol that worked
# set(WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
# set_property(TARGET APP PROPERTY WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
target_sources(APP PRIVATE src/log.cpp)
target_include_directories(APP PRIVATE ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(APP glfw GL GLEW)

#adding all files in src directory to be linked
#note that these two lines can be replaced by adding all src files to add_executable command.
# #####
# file(GLOB SRCS src/*.cpp)
# target_sources(second_time PRIVATE ${SRCS})
# #####
# find_package(OpenGL REQUIRED)
# Other dependencies I found that I may require in the future:
# Wall GLU glut X11 Xxf86vm Xrandr pthread Xi dl Xinerama Xcursor
