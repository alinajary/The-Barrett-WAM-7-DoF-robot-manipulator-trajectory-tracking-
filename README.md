# The-Barrett-WAM-7-DoF-robot-manipulator-trajectory-tracking-
This project represents a trajectory tracking
approach for a 7-DOF robot arm. 7 DOF robot is Barrett
WAM arm which is a highly dexterous, naturally
backdrivable manipulator.we are going to
develop a framework to command a robotic arm to
perform a trajectory task on a whiteboard. The trajectory
which is considered for this project is tracking three letters
‘kdc’. The homogeneous transformation matrix and
Denavit-Hartenberg(DH) parameters is used for
derivation of direct kinematic of the robot. For trajectory
tracking, a PD and feed-forward controller is designed to
achieve trajectory tracking control with an acceptable
accuracy. There is a Kalman filter to mitigate the effects
of noises on the controller. The effectiveness of the
Kalman filter and controlling methods are well
exemplified by conducting simulations
