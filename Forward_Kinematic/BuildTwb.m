function Tws=BuildTwb(pos,angle)
z=angle(3);
x=angle(1);
y=angle(2);

rotz=[cos(z)    -sin(z)     0
    sin(z)    cos(z)      0
    0         0           1];

roty=[cos(y)    0           sin(y)
    0         1           0
    -sin(y)   0            cos(y)];

rotx=[1         0           0
    0         cos(x)      -sin(x)
    0         sin(x)      cos(x)];

rot=rotz*roty*rotx;



Tws=[rot pos';0 0 0 1];