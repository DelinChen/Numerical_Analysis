clc
clear
sum = 0;
sum0 = 0;
n = 1;
while true
    sum = sum0 + 1/(n^2+1);
    if abs(sum-sum0)<10^-13
        break
    end
    n = n+1;
    sum0 = sum;
end
fprintf('Sum is %.14f\nThere are %d terms needed.\n',sum,n);