sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update

sudo apt install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake

sudo rosdep init

rosdep update

mkdir -p ~/catkin_ws

cd ~/catkin_ws

rosinstall_generator desktop --rosdistro melodic --deps --wet-only --tar > melodic-desktop-wet.rosinstall

wstool init src melodic-desktop-wet.rosinstall

cd ~/catkin_ws/src

git clone https://github.com/ros-perception/image_pipeline 
sudo rm -r vision_opencv
git clone https://github.com/ros-perception/vision_opencv -b melodic
git clone https://github.com/ros/geometry2 -b melodic
git clone https://github.com/ros-perception/perception_pcl -b melodic-devel
git clone https://github.com/ros-planning/navigation
git clone https://github.com/stonier/ecl_core -b release/0.62-melodic
git clone https://github.com/stonier/ecl_lite -b release/0.61-melodic
git clone https://github.com/stonier/ecl_tools -b release/0.61-melodic
git clone https://github.com/stonier/sophus -b release/1.1.x
sudo rm -r image_common
git clone https://github.com/ros-perception/image_common -b hydro-devel
sudo rm -r navigation_msgs
git clone https://github.com/ros-planning/navigation_msgs -b ros1
git clone https://github.com/ros/joint_state_publisher.git 
git clone https://github.com/cyberbotics/webots_ros -b melodic
git clone https://github.com/ros-controls/ros_control
git clone https://github.com/ros-controls/realtime_tools -b melodic-devel
git clone https://github.com/ros-controls/control_toolbox -b melodic-devel
git clone https://github.com/ros-drivers/four_wheel_steering_msgs
git clone https://github.com/ros-controls/urdf_geometry_parser



cd ~/catkin_Ws

rosdep install -y --from-paths src --ignore-src --rosdistro melodic -r --os=debian:buster


sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/melodic -j2 -DPYTHON_EXECUTABLE=/usr/bin/python


source /opt/ros/melodic/setup.bash

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

source ~/.bashrc

echo "If you cannot build it properly, you need to upgrde the gcc. pls check this http://suka4.blogspot.com/2016/12/raspberry-pi-3-gcc6.html"
