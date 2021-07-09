sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update

sudo apt install -y python3-rosdep python3-rosinstall-generator python-wstool python3-rosinstall build-essential cmake

sudo rosdep init

rosdep update

mkdir -p ~/catkin_ws

cd ~/catkin_ws

rosinstall_generator desktop --rosdistro melodic --deps --wet-only --tar > melodic-desktop-wet.rosinstall

wstool init src melodic-desktop-wet.rosinstall

cd ~/catkin_ws

rosdep install -y --from-paths src --ignore-src --rosdistro melodic -r --os=debian:buster


echo "sudo /src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/melodic -j2 -DPYTHON_EXECUTABLE=/usr/bin/python3"

catkin build

source /opt/ros/melodic/setup.bash

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

source ~/.bashrc
