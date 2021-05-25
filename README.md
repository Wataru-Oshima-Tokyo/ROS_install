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


For RaspberryPi 

 sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

 sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

 sudo apt update

 sudo apt install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake

 sudo rosdep init
 
 rosdep update

 mkdir -p ~/catkin_ws
 
 cd ~/catkin_ws


NO GUI (recommended)
----------------------------------

 rosinstall_generator ros_comm --rosdistro noetic --deps --wet-only --tar > noetic-ros_comm-wet.rosinstall
 
 wstool init src noetic-ros_comm-wet.rosinstall
 

-------------------------------------
 
 
 or 
 
 
 Desktop
 ---------------------------------
 
 rosinstall_generator desktop --rosdistro noetic --deps --wet-only --tar > noetic-desktop-wet.rosinstall

 wstool init src noetic-desktop-wet.rosinstall

----------------------------------


 cd ~/catkin_ws
 
 rosdep install -y --from-paths src --ignore-src --rosdistro noetic -r --os=debian:buster

 //sudo pip3 install -U catkin_tools

 sudo apt-get install python3-catkin-tools


 sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic -j2

(If your raspbeery pi crushes during the this build, try increasing the swap

 nano /etc/dphys-swapfile/
 CONF_SWAPSIZE=1024 
*1024 depends on the RAM on your raspberry pi
)

 source /opt/ros/noetic/setup.bash

 echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

 source ~/.bashrc


---------Adding Released Packages----------

 cd catkin_ws

 rosinstall_generator ros_comm ros_control joystick_drivers --rosdistro noetic --deps --wet-only --tar > noetic-  custom_ros.rosinstall

*ros_comm, ros_controll, joystick_driveres are the packages added into this workspace

---update it ----

 wstool merge -t src noetic-custom_ros.rosinstall


---resolve the new dependencies-----

 rosdep install --from-paths src --ignore-src --rosdistro noetic -y -r --os=debian:buster

 wstool update -t src


 sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic
