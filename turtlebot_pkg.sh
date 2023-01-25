cd $HOME
mkdir -p catkin_ws/src
cd catkin_ws/src
sudo apt install -y ros-melodic-gazebo-dev ros-melodic-gazebo-plugins ros-melodic-gazebo-ros ros-melodic-gazebo-ros-control ros-melodic-gazebo-ros-pkgs
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_gazebo_plugin.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/Wataru-Oshima-Tokyo/turtlebot3_simulations.git

