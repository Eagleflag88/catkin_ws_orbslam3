#!/bin/bash
###
 # @Author: Eagleflag88 yijiang.xie@foxmail.com
 # @Date: 2022-05-03 15:50:05
 # @LastEditors: Eagleflag88 yijiang.xie@foxmail.com
 # @LastEditTime: 2022-05-06 18:29:36
 # @FilePath: /docker/run.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

xhost +local:docker

docker run \
    --gpus all \
    --net=host \
    -it --privileged --rm \
    --env="NVIDIA_DRIVER_CAPABILITIES=all" \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /work/tools/catkin_ws_orbslam3:/home/catkin_ws_orbslam3 \
    -v /work/tools/catkin_ws_orbvins:/home/catkin_ws_orbvins \
    -v /work/tools/catkin_ws_hzp:/home/catkin_ws_hzp \
    -v /work/tools/catkin_ws_semloc:/home/catkin_ws_semloc \
    -v /work/DataSet:/home/data \
    ros_orbslam3:latest
    # lxzheng/orbslam3:ros-melodic
        # 
