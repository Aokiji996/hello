macro(add_yaml target)
    find_package(yaml-cpp REQUIRED)
    target_link_libraries(${target} PRIVATE yaml-cpp)
endmacro()

macro(add_thread target)
    find_package(Threads REQUIRED)
    target_link_libraries(${target} PRIVATE Threads::Threads)
endmacro()

macro(add_opencv target)
    find_package(OpenCV REQUIRED)
    target_link_libraries(${target} PRIVATE ${OpenCV_LIBS})
endmacro()

macro(add_pcl target)
    target_compile_options(${target} PRIVATE -Wno-dev)
    find_package(PCL REQUIRED)
    target_link_libraries(${target} PRIVATE ${PCL_LIBRARIES})
endmacro()

macro(add_zed target)
    find_package(ZED REQUIRED)
    target_link_libraries(${target} PRIVATE ${ZED_LIBRARIES})
    target_include_directories(${target} PRIVATE ${ZED_INCLUDE_DIRS})
endmacro()

macro(add_k4a target)
    find_package(k4a REQUIRED)
    target_link_libraries(${target} PRIVATE k4a)
endmacro()