clc
clear
close all
format long

f = @(x) 1./(1 + 30*x.^2 );
N = [8, 12, 16, 20, 80, 200, 250];
error = [];
for i = 1:length(N)
    error = [error barycentric(f,-1,1,N(i))];
end
semilogy(N,error);

    
function [maxError] = barycentric(f,a,b,N)
    syms x m;
    xvalue = [];
    % x with equidistance points
    xvalue = linspace(a,b,N+1);
    
    % Chebysheve weights
    for k = 1:N+1
        weight(k) = (-1)^(k-1);
        % x with Chebysheve points
        %xvalue = [xvalue cos((k-1)*pi/N)];
    end

    weight(1) = 1/2;
    weight(N+1) = ((-1)^N)/2;
    
    xdata = f(xvalue);
    % equidistance weights
    %weight = @(k) (-1)^(k-1)*nchoosek(N,k-1);

    pa = 0;
    pb = 0;
    % calculate nominator
    for m = 1:N+1
        pa = pa + weight(m)*xdata(m)/(x-xvalue(m));
    end
    % calculate denominator
    for m = 1:N+1
        pb = pb + (weight(m)/(x-xvalue(m)));
    end
    p = pa/pb;

    p = matlabFunction(p);
    t = linspace(-1,1,321);
    fex = f(t);
    interpolation = p(t);
    for i = 1:321
        if ismember(t(i),xvalue)
            interpolation(i) = f(t(i));
        end
    end
    figure
    plot(t,fex,t,interpolation);
    maxError = max(abs(interpolation-fex));
end
