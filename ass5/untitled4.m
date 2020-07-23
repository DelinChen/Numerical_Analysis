clc
clear
close all
syms x m;

f = @(x) 1./(1 + 30*x.^2 );
N = 8;
error = [];
isZero = 0;
a = -1;
b = 1;
xvalue = linspace(a,b,N+1);
x = @(k) 2*k/(N-1);
t = linspace(a,b,321);
fex = f(t);
for k = 1:N+1
    weight(k) = (-1)^(k-1);
end
weight(1) = 1/2;
weight(N+1) = ((-1)^N)/2;
for i = 0:320
    for m = 0:N
        if(t(i+1)-x(m) == 0)
            interpolation(i+1) = f(t(i+1));
            isZero = 1;
        else
            upper(m+1) = (weight(m+1)*f(x(m)))/(t(i+1)-x(m));
            lower(m+1) = weight(m+1)/(t(i+1)-x(m));
        end
    end
    if isZero == 0
        interpolation(i+1) = sum(upper)/sum(lower);
    else
        isZero = 0;
    end
end
plot(interpolation)