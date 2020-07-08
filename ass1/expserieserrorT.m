%EXPSERIESERROR
%
%Script to compute the estimated number of (decimal) digits lost, and the  
%  actual number of digits lost when computing exp(x) via its 
%  Mclaurin series 
%
%  Plot results
%  Uses Matlab function "expseries"
%
x = [-20:.1:20]; % test points <---
exactv = exp(x); % exact values
ys=[]; edl=[]; nn=[];  % vectors to store outputs
for j=1:length(x),
    [y,edloss,k]=expseries(x(j));
    ys=[ys y]; edl=[edl edloss]; nn=[nn k];
end
%Find the coding bug in the 2 lines below <---
relerr=abs((ys-exactv)./exactv); %relative error
digitslost = (log(relerr/eps)/log(10));
subplot(2,1,1);
plot(x,edl,'b',x,digitslost,'r');
title('Effect of Smearing in Exponential Series');
xlabel('x');
legend('estimated digits lost','actual digits lost');
grid on;
subplot(2,1,2);
%Plot of "nn" goes here  <---
plot(x,nn,'r');
xlabel('x');
ylabel('N');
title('N = Degree of Taylor polynomial');

plotpubl(2);