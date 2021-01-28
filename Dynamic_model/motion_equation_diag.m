clc
clear all
close all
syms q0d real
M0=10.17;
r0=[-0.015, -0.271, -0.145];
I0=[0.089, 0.142, 0.187];
Q0=[0.763, 0.64, -0.089; 0.062, 0.065, 0.996;0.643, -0.765, 0.01];
%%%%%%%%%
syms q1d real

M1=10.23;
r1=[-0.007, 0.127, -0.0];
I1=[0.085,0.107, 0.128];
Q1=[-0.004, 0.097, 0.995; 0.03, -0.995, 0.097; 0.999, 0.031, 0.001];
%%%%%%%%%
syms q2d real
M2=4.06;
r2=[-0.002, 0.031, 0.015];
I2=[0.013, 0.018, 0.021];
Q2=[0.025 0.035 0.999; 0.85 0.525 -0.039; -0.525 0.85 -0.016];
%%%%%%%%%
syms q3d real
% q3d=0;
% q2d=0;
% q1d=0;
M3=1.7;
r3=[-0.042, 0.210, 0];
I3=[0.003, 0.058, 0.058];
Q3=[-0.044, -0.99, -0.132; .999, -0.044, -0.005; 0, -0.132 0.99];
%%%%%%%%%
syms q4d real
M4=2.5;
r4=[0.003, 0, 0.138];
I4=[0.004, 0.016, 0.016];
Q4=[-0.123, -0.053, 0.991; -0.002, -0.998, -0.053; 0.992, -0.01 0.123];
%%%%%%%%%
syms q5d real
M5=.12;
r5=[0, 0.007, 0.002];
I5=[4.5, 5.4, 6.9]*1e-05;
Q5=[0.999, -0.01, -0.01; 0.01, 0.247, 0.969; 0, -0.969, 0.248];
%%%%%%%%%
syms q6d real
M6=.5;
r6=[0, -0.024, 0.028];
I6=[2.7, 5.75, 6.8]*1e-04;
Q6=[0.002, -0.006, 0.999;0.979, 0.204, 0; -0.205, 0.979, 0.007];
%%%%%%%%%
syms q7d real
M7=2.5;
r7=[0.003, 0, 0.138];
I7=[4.2, 4.21, 8.45]*1e-05;
Q7=[0.913, 0.408, 0; -0.408, 0.913, 0; 0, 0, 0.999];
%%
M=[M1,M2,M3,M4,M5,M6,M7];
r=[r1,r2,r3,r4,r5,r6,r7];
I=[I1;I2;I3;I4;I5;I6;I7]';
Q=[Q1;Q2;Q3;Q4;Q5;Q6;Q7]';
qd=[q1d,q2d,q3d,q4d,q5d,q6d,q7d];

syms g
syms q1 q2 q3 q4 q5 q6 q7 real
syms a1 a2 a3 a4 a5 a6 a7 real
syms d1 d2 d3 d4 d5 d6 d7 real
syms alpha1 alpha2 alpha3 alpha4 alpha5 alpha6 alpha7 real
alpha = [-pi/2; pi/2; -pi/2; pi/2;-pi/2; pi/2;0];
teta = [ q1 ; q2 ;q3 ; q4; q5; q6; q7];
a = [ 0 ; 0 ; 0.045; -0.045 ; 0 ; 0 ; 0];
d = [ 0 ; 0 ; 0.55; 0 ; .3 ; 0 ; .06];
DH = [alpha d a teta];
A = eye(4);
A_tot = eye(4);
R=zeros(3,21);
P=zeros(3,7);
H=sym(zeros(1,7));
u=sym(zeros(7,1));
v=zeros(3,7);
U=sym(0);
qd=sym([q1d,q2d,q3d,q4d,q5d,q6d,q7d]);
TT=0;
for i=1:7
%% fprintf('Link'),i
    A = Dir_A(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
    A_tot = A_tot*A;
    R=A_tot*[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 0];
    R=[R(1)  R(2) R(3);R(5) R(6) R(7); R(9) R(10) R(11)];
    p=A_tot*[0;0;0;1];
    H(i)=p(3);
    ri=zeros(1,3);
    j=3*(i-1)+1:3*(i-1)+3;
    ri(1:3)=r(j);
    N=R*ri';
    u(i,1)= -M(i)*g*(H(i)+N(3));
    U=U+u(i,1);
    %%
    P=[p(1);p(2);p(3)];
    pdot1=diff(p(1),q1)*q1d +diff(p(1),q2)*q2d +diff(p(1),q3)*q3d +diff(p(1),q4)*q4d +diff(p(1),q5)*q5d +diff(p(1),q6)*q6d +diff(p(1),q7)*q7d;
    pdot2=diff(p(2),q1)*q1d +diff(p(2),q2)*q2d +diff(p(2),q3)*q3d +diff(p(2),q4)*q4d +diff(p(2),q5)*q5d +diff(p(2),q6)*q6d +diff(p(2),q7)*q7d;
    pdot3=diff(p(3),q1)*q1d +diff(p(3),q2)*q2d +diff(p(3),q3)*q3d +diff(p(3),q4)*q4d +diff(p(3),q5)*q5d +diff(p(3),q6)*q6d +diff(p(3),q7)*q7d;
    vi=[pdot1;pdot2;pdot3]';
    %%
    wi=[0,0,1]*qd(i);
    vci=vpa(vi+cross(wi,round(ri,1)),3);
    q=zeros(3,3);
    j1=9*(i-1)+1:9*(i-1)+3;
    j2=9*(i-1)+4:9*(i-1)+6;
    j3=9*(i-1)+7:9*(i-1)+9;
    q(1,:)=Q(j1);q(2,:)=Q(j2);q(3,:)=Q(j3);
    Ii=zeros(1,3);
    j=3*(i-1)+1:3*(i-1)+3;
    Ii(1:3)=I(j);
    Ic=q'*diag(Ii)*q;
    TT=vpa(0.5*(M(i)*vci*vci'+wi*Ic*wi'),3);
    T(i)=TT;
end
T1=T(1);T2=T(2);T3=T(3);T4=T(4);T5=T(5);T6=T(6);T7=T(7);
T1=vpa(T1,3);T2=vpa(T2,3);T3=vpa(T3,3);T4=vpa(T4,3);T5=vpa(T5,3);T6=vpa(T6,3);T7=vpa(T7,3);
T=vpa(T1+T2+T3+T4+T5+T6+T7,3);
%% extraction of M
M=sym(zeros(7,7));
for i=1:7
    for j=1:7
       M(i,j)=vpa(diff(diff(T,qd(i)),qd(j)),3);
        if i==j
            M(i,j)=M(i,j)/2;
            MM(i,j)=M(i,j)/2;
        end
    end
end
M=vpa(MM,3);
% simplify(M)
%% extraction of C
C=sym(zeros(7,1));
for k=1:7
    for i=1:7
        for j=1:7
            C(k)=vpa(C(k)+0.5*(diff(M(k,j),teta(i))+diff(M(k,i),teta(j))-diff(M(i,j),teta(k))),3);
            
        end
    end
end
C=vpa(C,3);
% simplify(C)
%% extraction of G
G=[diff(U,q1);diff(U,q2);diff(U,q3);diff(U,q4);diff(U,q5);diff(U,q6);diff(U,q7)];
% simplify(G)