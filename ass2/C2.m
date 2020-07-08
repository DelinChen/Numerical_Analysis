clc
clear
syms x
R = 100;
r = 20;
L = 700;
myf = 2*x*cos(asin((R-r)/x))+(R+r)*pi+2*(asin((R-r)/x))*(R-r)-L;
x0 = 135;
tol = 1.e-12;

[s,f]=mynewton(myf,x0,tol);

for i = 1:length(s)
    fprintf('x%d is %.14f\n',i,s(i));
end

function [s,fnocon]=mynewton(myf, x0, tol)
syms x;
i = 1;  % index of s
g = diff(myf);
s(i) = x0;
t = Inf;  % initialize the error
fnocon = 1;
while (t>tol)
    s(i+1) = s(i) - eval(subs(myf,x,s(i)))/eval(subs(g,x,s(i)));
    if((abs(s(i+1)-s(i)))<t)
        fnocon = 0;
    end
    t = abs(s(i+1)-s(i));
    i = i+1;
end
end
