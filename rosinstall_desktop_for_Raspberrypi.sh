sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update

sudo apt install -y python3-rosdep python3-rosinstall-generator python-wstool python3-rosinstall build-essential cmake

sudo rosdep init

rosdep update

mkdir -p ~/catkin_ws

cd ~/catkin_ws

rosinstall_generator desktop --rosdistro noetic --deps --wet-only --tar > noetic-desktop-wet.rosinstall

wstool init src noetic-desktop-wet.rosinstall


cd ~/catkin_ws

rosdep install -y --from-paths src --ignore-src --rosdistro noetic -r --os=debian:buster

cd ~/catkin_ws/src

git clone https://github.com/ros/geometry2 -b noetic-devel
git clone https://github.com/ros-perception/perception_pcl -b melodic-devel
git clone https://github.com/ros-perception/pcl_msgs -b indigo-devel
git clone https://github.com/ros-planning/navigation
git clone https://github.com/stonier/ecl_core -b reecllease/0.62-noetic
git clone https://github.com/stonier/ecl_lite -b release/0.61-noetic
git clone https://github.com/stonier/ecl_tools -b release/0.61-noetic
git clone https://github.com/stonier/sophus -b release/1.1.x

git clone https://github.com/ros/joint_state_publisher.git 
git clone https://github.com/ros-controls/ros_control
git clone https://github.com/ros-controls/realtime_tools -b noetic-devel
git clone https://github.com/ros-controls/control_toolbox -b noetic-devel
git clone https://github.com/ros-drivers/four_wheel_steering_msgs
git clone https://github.com/ros-controls/urdf_geometry_parser
git clone https://github.com/ros-perception/pointcloud_to_laserscan -b lunar-devel
sudo apt install libbullet-dev libpcl-dev -y


sudo src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic -j1 -DPYTHON_EXECUTABLE=/usr/bin/python3

source /opt/ros/noetic/setup.bash

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

source ~/.bashrc
