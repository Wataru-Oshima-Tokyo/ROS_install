
sudo apt update

sudo apt install curl -y

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

sudo apt update

sudo apt install ros-melodic-desktop -y

sudo apt install ros-melodic-map-server -y

sudo apt install ros-melodic-gazebo-ros -y

sudo apt install ros-melodic-cv-bridge -y

sudo apt install ros-melodic-camera-info-manager -y

sudo apt install ros-melodic-ecl ros-melodic-perception -y

sudo apt install libudev-dev -y

sudo apt install libasio-dev -y

sudo apt install ros-melodic-navigation -y

sudo apt install ros-melodic-controller-interface  ros-melodic-gazebo-ros-control ros-melodic-joint-state-controller ros-melodic-effort-controllers ros-melodic-joint-trajectory-controller -y


source /opt/ros/melodic/setup.bash

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

source ~/.bashrc
