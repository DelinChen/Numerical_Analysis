clc 
clear
s=0;
n=1;
s0=0;
while(1)
s=s0+1/(n^2+1)-1/n^2+1/n^4;
if(abs(s-s0)<1e-13)
break;
end
n=n+1;
s0=s;
end
s=s+ pi.^2/6 - pi.^4/90;
fprintf('%.14f\n %d\n',s,n);