sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update

sudo apt install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake

sudo rosdep init

rosdep update

mkdir -p ~/catkin_ws

cd ~/catkin_ws

rosinstall_generator desktop --rosdistro kinetic --deps --wet-only --tar > kinetic-desktop-wet.rosinstall

wstool init src kinetic-desktop-wet.rosinstall

sudo rm -r src/opencv3

cd ~/catkin_ws

rosdep install -y --from-paths src --ignore-src --rosdistro kinetic -r --os=debian:buster

sudo apt remove libboost1.67-dev

sudo apt autoremove

sudo apt install -y libboost1.58-dev libboost1.58-all-dev

sudo apt install -y g++-5 gcc-5

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30

sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30

sudo update-alternatives --set c++ /usr/bin/g++

sudo src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/kinetic -j2 -DPYTHON_EXECUTABLE=/usr/bin/python

source /opt/ros/kinetic/setup.bash

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

source ~/.bashrc
