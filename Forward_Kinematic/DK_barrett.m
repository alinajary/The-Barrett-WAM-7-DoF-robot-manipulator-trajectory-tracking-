clc
clear
close all

syms t1 t2 t3 t4 t5 t6 t7 real;

% create a numerical or symbolic DH parameter
DH=[  -pi/2     0           0          t1;     %frame1
      pi/2      0           0          t2;     %frame2
      -pi/2     0.045       0.55       t3;     %frame3
       pi/2     -0.045      0          t4;     %frame4
      -pi/2     0           0.3        t5;     %frame5
      pi/2      0           0          t6;     %frame6
      0         0           0.06       t7 ];   %frame7

  
  
  
joints=[1 1 1 1 1 1 1]; % the DH parameter frames that are active joints
base=1; %the base frame


  
real_DH=SYM_sub(DH,t1,0,t2,0,t3,0,t4,0,t5,0,t6,0,t7,0); %subs each symbolic joint name with its numerical value


pos=[0 0 0];  % the x,y,z position of the base frame with respect to world coordinates
angle=[0 0 0];% the x,y,z angles of the base frame with respect to world coordinates

Twb=BuildTwb(pos,angle); %builds the transformation matrix of the base frame with respect to world coordinates

figure
axis([0 .5 0 .3 -0 1]) %set x y z axis size according to the problem
view(3)
grid
%daspect([1,1,1])
camzoom(1)
camproj orthographic
rotate3d on
RobotPlot(real_DH,joints,base,Twb); %plots the robot, 
                                    %-joints are represented with black solid spheres
                                        %with purple dotted lines indicating the joint axis
                                     %-the base frame is represented by a green circle   
                                     %-the world coordinates is represented
                                     %-by rgb lines representing xyz axis

T17=FKinematics(real_DH,1,7); %Computes the transformation matrix of frame 6 wrt frame 1
Tw7=Twb*T17; %Compute the transformation matrix of frame 6 wrt world frame

% T71=invT(T17); %same result could have been achieved using T61=FKinematics(real_DH,6,1);
