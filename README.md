# ROS_multi_autoslam
需要安装基于ubuntu18.04的ROS-melodic
#
进入工作空间后source

注意：需要设置环境变量"TURTLEBOT3_MODEL"为 waffle （这个机器人模型上面配备了激光雷达、深度相机以及相机）
#
多机导航:

roslaunch min_car multi_turtlebot3_gazebo.launch

roslaunch min_car move_base_three.launch

roslaunch min_car navigation_three.launch
#
多机建图：
roslaunch min_car multi_slam.launch
