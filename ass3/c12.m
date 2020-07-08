clear
clc
gendata

arr = [];
A = H;
cond = cond(A,1);
for k = 1:6
    for j = 1:10
        c = BIGC(:,:,k);
        b = B(:,j);
        x = A\b;
        z = (A+epsilon*c)\b;
        e = norm(A,1)*norm(z-x,1)/(epsilon*norm(x,1));
        arr = [arr, e];
    end
end

% get the average, median, and maximum
average = mean(arr);
median = median(arr);
maximum = max(arr);

scatter(1:60, arr, 100, '*');
set(gca, 'YScale', 'log');
xlabel('experiment');
ylabel('Amplification');

aline = yline(cond, 'color', 'r', 'LineWidth', 3);
bline = yline(rcond(A), 'color', 'b', 'LineWidth', 3);
legend([aline, bline], {'K1(A)','1/K1(A)'});