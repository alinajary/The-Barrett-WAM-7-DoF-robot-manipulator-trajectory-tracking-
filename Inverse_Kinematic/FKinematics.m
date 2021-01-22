function Tr=FKinematics(DH,varargin)


if(isempty(varargin))
    first=1;
    last=size(DH,1);
    invert=0;
else
    first=varargin{1};
    last=varargin{2};
    if(varargin{2}>=varargin{1})
        first=varargin{1};
        last=varargin{2};
        invert=0;
    else
        first=varargin{2};
        last=varargin{1};
        invert=1;
    end
end



for i=first:last
    al=DH(i,1);
    a=DH(i,2);
    d=DH(i,3);
    t=DH(i,4);

T(:,:,i) = [cos(t)   -cos(al)*sin(t)     sin(al)*sin(t)     a*cos(t)
            sin(t)   cos(al)*cos(t)     -sin(al)*cos(t)     a*sin(t)
            0               sin(al)         cos(al)             d
            0               0                   0               1];

end

Tr=eye(4);
for i=first:last
    Tr=Tr*T(:,:,i);
end

if(invert)
    Tr=invT(Tr);
end

end

        