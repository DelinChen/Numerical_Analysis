clear
clc
gendata

arr = [];
A = H;

for j = 1:10
    for k =1:10
        b = B(:,j);
        d = D(:,k);
        x = A\b;
        y = A\(b+epsilon*d);
        e = norm((y-x),1)/(epsilon*norm(x,1));
        arr = [arr, e];
    end
end

% get the average, median, and maximum
average = mean(arr);
median = median(arr);
maximum = max(arr);

scatter(linspace(1,100), arr, 100, 'b*');
set(gca, 'YScale', 'log');
xlabel('experiment');
ylabel('Amplification');

aline = yline(cond(A,1), 'color', 'r', 'LineWidth', 3);
bline = yline(rcond(A), 'color', 'b', 'LineWidth', 3);
legend([aline, bline], {'K1(A)','1/K1(A)'});