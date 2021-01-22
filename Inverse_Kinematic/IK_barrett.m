clc
clear
close all
%% parameter definition
syms t1 t2 t3 t4 t5 t6 t7 real;
syms S1
% create a numerical or symbolic DH parameter
real_DH=[  -pi/2      0           0          t1;     %frame1
            pi/2      0           0          t2;     %frame2
            -pi/2     0.045       0.55       t3;     %frame3
            pi/2     -0.045       0          t4;     %frame4
            -pi/2     0           0.3        t5;     %frame5
            pi/2      0           0          t6;     %frame6
            0         0           0.06       t7 ];   %frame7

joints=[1 1 1 1 1 1 1]; % the DH parameter frames that are active joints
base=1; %the base frame
pos=[0 0 0];  % the x,y,z position of the base frame with respect to world coordinates
angle=[0 0 0];% the x,y,z angles of the base frame with respect to world coordinates

Twb=BuildTwb(pos,angle); %builds the transformation matrix of the base frame with respect to world coordinates


%% f(q) calculation
T17=FKinematics(real_DH,1,7); %Computes the transformation matrix of frame 6 wrt frame 1
Tw7=Twb*T17; %Compute the transformation matrix of frame 6 wrt world frame
T17_abb = abbrevian_fun(T17);
T17_abb = subs(T17_abb,sin(t1),S1);
simplify(T17_abb);
f_q = T17*[0 0 0 1]';
f_q_abb = abbrevian_fun(f_q);
subs(f_q_abb,sin(t1),S1);
% T71=invT(T17); %same result could have been achieved using T61=FKinematics(real_DH,6,1);

%% jacobian calculation
J_fq = jacobian(f_q,[t1,t2,t3,t4,t5,t6,t7]);
disp(J_fq);

%% inverse calculation
q = zeros(7,1);
r_d = [0.4;0.4;0.5;1];
for i = 1:100
    J_fq_n = SYM_sub(J_fq,t1,q(1),t2,q(2),t3,q(3),t4,q(4),t5,q(5),t6,q(6),t7,q(7));
    T17_n = SYM_sub(T17,t1,q(1),t2,q(2),t3,q(3),t4,q(4),t5,q(5),t6,q(6),t7,q(7));
    fr_q = T17_n*[0;0;0;1];
    q = vpa(q+pinv(J_fq_n)*(r_d-fr_q),9);
    error(i) = vpa(norm(r_d-fr_q),9);
    if error<1e-3
        disp('done');
        break
    end
end
plot(error)

