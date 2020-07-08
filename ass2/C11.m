clc
clear
syms x;
myf = x.^2 - 4;
mynewton(myf,1,1e-12);

function [s,fnocon]=mynewton(myf, x0, tol)
sym x;
i = 0;
t = 1000;
while(t>tol)
    y = eval(subs(myf,x,x0));
    dy = eval(subs(diff(myf,x,x0),x,x0));
    xi = x0-y/dy;
    t = abs(x0-xi);
    i = i+1;
    s(i) = xi;
    x0 = xi;
end
fnocon = 1;
end

    