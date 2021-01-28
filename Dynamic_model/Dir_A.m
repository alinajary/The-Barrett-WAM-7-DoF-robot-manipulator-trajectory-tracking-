function [A] = Dir_A(alpha,d,a,teta)

    Ax = [      1               0           0               a
                0        cos(alpha)  -sin(alpha)          0
                0        sin(alpha)  cos(alpha)           0
                0            0              0               1];
    Az = [   cos(teta)   -sin(teta)       0               0
             sin(teta)    cos(teta)       0               0
                0            0              1               d
                0            0              0               1];
    A = Az*Ax;
end