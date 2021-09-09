sudo apt update

sudo apt install curl

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

sudo apt update

sudo apt install ros-noetic-desktop -y

sudo apt install ros-noetic-map-server -y

sudo apt install ros-noetic-gazebo-ros -y

sudo apt install ros-noetic-cv-bridge -y

sudo apt install ros-noetic-camera-info-manager -y

sudo apt install ros-noetic-ecl ros-noetic-perception -y

sudo apt install libudev-dev -y

sudo apt install libasio-dev -y

sudo apt install ros-noetic-navigation -y

sudo apt install ros-noetic-controller-interface  ros-noetic-gazebo-ros-control ros-noetic-joint-state-controller ros-noetic-effort-controllers ros-noetic-joint-trajectory-controller -y
source /opt/ros/noetic/setup.bash

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

source ~/.bashrc
