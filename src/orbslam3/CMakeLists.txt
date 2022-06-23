cmake_minimum_required(VERSION 3.0.2)
project(orbslam3)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  cv_bridge
)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)
find_package(OpenCV)
find_package(Eigen3 3.1.0 REQUIRED)
find_package(Pangolin REQUIRED)


###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
 INCLUDE_DIRS include
#  LIBRARIES orbslam3
 CATKIN_DEPENDS roscpp rospy std_msgs cv_bridge
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
  lib/
  lib/include
  lib/include/CameraModels
  ${Pangolin_INCLUDE_DIRS}
  ${EIGEN3_INCLUDE_DIRS}
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

set(LIBS
  ${OpenCV_LIBS}
  ${EIGEN3_LIBS}
  ${Pangolin_LIBRARIES}
  ${catkin_LIBRARIES}
  Thirdparty/DBoW2/lib/libDBoW2.so
  Thirdparty/g2o/lib/libg2o.so
  lib/lib/libORB_SLAM3.so
  -lboost_system
)

# Node for monocular camera
add_executable(mono_ros
  src/ros_mono.cc
)

target_link_libraries(mono_ros
${OpenCV_LIBS}
${EIGEN3_LIBS}
${Pangolin_LIBRARIES}
${catkin_LIBRARIES}
/home/catkin_ws_orbslam3/src/orbslam3/lib/Thirdparty/DBoW2/lib/libDBoW2.so
/home/catkin_ws_orbslam3/src/orbslam3/lib/Thirdparty/g2o/lib/libg2o.so
/home/catkin_ws_orbslam3/src/orbslam3/lib/lib/libORB_SLAM3.so
-lboost_system
  # LIB
)

# Node for monocular camera
add_executable(mono_imu_ros
  src/ros_mono_inertial.cc
)

target_link_libraries(mono_imu_ros
${OpenCV_LIBS}
${EIGEN3_LIBS}
${Pangolin_LIBRARIES}
${catkin_LIBRARIES}
/home/catkin_ws_orbslam3/src/orbslam3/lib/Thirdparty/DBoW2/lib/libDBoW2.so
/home/catkin_ws_orbslam3/src/orbslam3/lib/Thirdparty/g2o/lib/libg2o.so
/home/catkin_ws_orbslam3/src/orbslam3/lib/lib/libORB_SLAM3.so
-lboost_system
  # LIB
)



