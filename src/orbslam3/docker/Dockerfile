FROM ros:melodic-ros-base

RUN sed -i s:/archive.ubuntu.com:/mirrors.tuna.tsinghua.edu.cn/ubuntu:g /etc/apt/sources.list
RUN cat /etc/apt/sources.list
RUN apt-get clean
RUN apt-get -y update --fix-missing && \
    apt-get -y upgrade

#-> Install general usage dependencies
RUN echo "Installing general usage dependencies ..." && \
    apt-get install -y apt-file && \
    apt-file update && \
    apt-get install -y nano \
    pkg-config

#-> Install OpenCV dependencies
#-? From : http://techawarey.com/programming/install-opencv-c-c-in-ubuntu-18-04-lts-step-by-step-guide/
RUN echo "Installing OpenCV dependencies ..." && \
    apt-get install -y\
    libgtk2.0-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    software-properties-common

#-> Install Pangolin dependencies
#-? From : https://cdmana.com/2021/02/20210204202321078t.html
RUN echo "Installing Pangolin dependencies ..." && \
    apt-get install -y \
    libglew-dev \
    libboost-dev \
    libboost-thread-dev \
    libboost-filesystem-dev \
    ffmpeg \
    libavutil-dev \
    libpng-dev

#-> Install Eigen 3 last version
#-? Needs to be installed BEFORE Pangolin as it also needs Eigen
#-> Linear algebra library
RUN echo "Installing Eigen 3 last version ..." && \
    apt-get install -y libeigen3-dev

#-> Install Pangolin last version
#-? 3D Vizualisation tool
#-? From : https://cdmana.com/2021/02/20210204202321078t.html
RUN echo "Installing Pangolin last version ..." && \
    cd /home/ && \
    git clone https://github.com/stevenlovegrove/Pangolin.git Pangolin

RUN cd /home/Pangolin/ && \
    mkdir build && \
    cd build/ && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -DCPP11_NO_BOOST=1 \
    /home/Pangolin/ && \
    make -j4 && \
    make install

RUN cd /home/
RUN git clone -b 3.4 https://github.com/opencv/opencv
RUN git clone -b 3.4 https://github.com/opencv/opencv_contrib.git
RUN cd /opencv/ && \
    mkdir build && \
    cd build && \
    cmake -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules .. && \
    make -j4 && \
    make install 

RUN apt install -y ros-melodic-cv-bridge

RUN cd /home/Pangolin/ && \
    git checkout v0.6 && \
    cd build/ && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -DCPP11_NO_BOOST=1 \
    /home/Pangolin/ && \
    make -j4 && \
    make install

RUN apt -y install mlocate

RUN apt-get -y install libgoogle-glog-dev libatlas-base-dev libeigen3-dev libsuitesparse-dev
RUN cd /home/ && \
    git clone https://github.com/ceres-solver/ceres-solver.git
RUN cd /home/ceres-solver/ && \
    git checkout 2.0.0 && \
    rm -rf .git/ && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4 && \
    make install

RUN apt -y install ros-melodic-tf ros-melodic-image-transport
RUN apt update && apt -y upgrade
RUN apt -y install ros-melodic-pcl-ros
RUN apt -y install ros-melodic-image-view
RUN apt -y install doxygen doxygen-doc doxygen-gui graphviz
RUN apt -y install gdb valgrind

# pip
RUN apt update && apt -y upgrade
RUN apt -y install python3-pip
RUN pip3 install pip -U
RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip3 install matplotlib opencv-python
RUN apt -y install python3-tk














