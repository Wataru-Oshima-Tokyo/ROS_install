locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  libbullet-dev \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-pip \
  python3-pytest-cov \
  python3-rosdistro\
  python3-rospkg \
  python3-rosdep-modules \  
  python3-setuptools \
  python3-vcstool \
  python3-catkin-pkg \
  python3-rosdep \
  wget
# install some pip packages needed for testing
python3 -m pip install -U \
  argcomplete \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest
# install Fast-RTPS dependencies
sudo apt install --no-install-recommends -y \
  libasio-dev \
  libtinyxml2-dev
# install Cyclone DDS dependencies
sudo apt install --no-install-recommends -y \
  libcunit1-dev

mkdir -p ~/ros2_foxy/src
cd ~/ros2_foxy
wget https://raw.githubusercontent.com/ros2/ros2/foxy/ros2.repos
vcs import src < ros2.repos

sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-5.3.1 urdfdom_headers"

cd ~/ros2_foxy/
#touch src/ros2/rviz/AMENT_IGNORE
#touch src/ros-visualization/AMENT_IGNORE
#touch src/ros2/system_tests/AMENT_IGNORE

mkdir ~/.colcon
touch ~/.colcon/defaults.yaml
echo "build:
  cmake-args:
    - -DCMAKE_SHARED_LINKER_FLAGS='-latomic -lpython3.7m'
    - -DCMAKE_EXE_LINKER_FLAGS='-latomic -lpython3.7m'
    - -DCMAKE_BUILD_TYPE=RelWithDebInfo" >> ~/.colcon/defaults.yaml
colcon build --symlink-install --packages-skip ros1_bridge

echo "~/ros2_foxy/install/local_setup.bash" >> ~/.bashrc
