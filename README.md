# ROS_noetic

For ubuntu(Focca)

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

sudo apt update

sudo apt install ros-noetic-desktop

(envrionment setup)
source /opt/ros/noetic/setup.bash

(If you want to execute it every time you open the terminal)

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

source ~/.bashrc


For Debian

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update

sudo apt install ros-noetic-desktop

(envrionment setup)
source /opt/ros/noetic/setup.bash

(If you want to execute it every time you open the terminal)

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

source ~/.bashrc
