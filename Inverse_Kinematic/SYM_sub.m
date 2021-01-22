function Tr=SYM_sub(T,varargin)

optargin = size(varargin,2);

if(mod(optargin,2)~=0) % if odd
    error('DH_sub should take even number of optional arguments')
end

Tr=T;
for i=1:2:optargin
    Tr=subs(Tr,varargin{i},varargin{i+1}); %the zero is because of a bug, check the documentation on the sub fct
end