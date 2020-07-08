clc
clear
for n = 0:20
fun = @(x,n) (x.^n)./(x+10);
q(n+1) = integral(@(x) fun(x,n),0,1);
fprintf('%.9f\n',q(n+1));
end