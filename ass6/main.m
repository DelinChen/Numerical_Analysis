clc
close all
clear
format long
par.N = 5e+6;
par.alpha = 1./5.2;
par.gamma = 1./10;
par.rzero = 3.5;

yinit = zeros(4,1);
yinit(2) = 800;
yinit(3) = 40;
yinit(4) = 0;
yinit(1) = par.N - 800 -40;
rtol = 1.e-6; atol=1.e-5;
options = odeset('AbsTol', atol,'RelTol',rtol,'MaxOrder',5);

[t,y] = ode45(@(t, y) seir(t,y, par) ,[0,180], yinit, options);
total_cases(:,1) = y(:,2) + y(:,3) + y(:,4);

% Scenario 1
% deaths
d = figure;
plot( t, y(:,4)*0.04);
xlabel('time(days)');
ylabel('Deaths');

% hospital
h = figure;
plot(t,y(:,3)*0.08);
xlabel('time(days)');
ylabel('Patients in hospital');

% ICU
i = figure;
plot(t,y(:,3)*0.01);
xlabel('time(days)');
ylabel('Patients in ICU');

% Active cases
figure;
plot(t, y(:,2) + y(:,3));
xlabel('time(days)');
ylabel('Total Active Cases: E+I');

% Exposed
figure;
plot(t, y(:,2));
xlabel('time(days)');
ylabel('E: exposed');

% Total cases
figure;
plot(t, total_cases(:,1));
xlabel('time(days)');
ylabel('Total Cases: E+I+R');

fprintf('Scenario 1:\n time (days): \t%d\n ', t(length(t))) ;
fprintf('total population:\t%d\n ',round(sum(y(length(t),:))));
fprintf('initial infected:\t%d\n ',round(yinit(3)));
fprintf('total cases (E+I+R) at t = %d: \t%d \n ',t(length(t)), round(sum(y(length(t),2:4))));
fprintf('Recovered at t= %d: \t\t\t%d \n ', t(length(t)),round(y(length(t),4)));
fprintf('Infected (infectious) at t = %d: \t%d \n ', t(length(t)),round(y(length(t),3)) );
fprintf('Exposed (non-infectious) at t = %d: \t%d \n ',t(length(t)),round(y(length(t),2)));
fprintf('Susceptable at t = %d: \t\t%d \n\n', t(length(t)), round(y(length(t),1)));

% Scernario 2
par.rzero = 0;
par.rtable = [ 1 3.5; 21 2.6; 71 1.9; 85 1.0; 91 0.55; 1001 0.5];
[t,y] = ode45(@(t, y) seir(t,y, par) ,[0,180], yinit, options);
clear total_cases
total_cases(:,1) = y(:,2) + y(:,3) + y(:,4);

% deaths
figure(d);
hold on
plot( t, y(:,4)*0.04);
xlabel('time(days)');
ylabel('Deaths');

% hospital
figure(h);
hold on
plot(t,y(:,3)*0.08);

% ICU
figure(i);
hold on
plot(t,y(:,3)*0.01);

% Active cases
figure;
plot(t, y(:,2) + y(:,3));
xlabel('time(days)');
ylabel('Total Active Cases: E+I');

% Exposed
figure;
plot(t, y(:,2));
xlabel('time(days)');
ylabel('E: exposed');

% Total cases
figure;
plot(t, total_cases(:,1));
xlabel('time(days)');
ylabel('Total Cases: E+I+R');

fprintf('Scenario 2:\n time (days): \t%d\n ', t(length(t))) ;
fprintf('total population:\t%d\n ',round(sum(y(length(t),:))));
fprintf('initial infected:\t%d\n ',round(yinit(3)));
fprintf('total cases (E+I+R) at t = %d: \t%d \n ',t(length(t)), round(sum(y(length(t),2:4))));
fprintf('Recovered at t= %d: \t\t\t%d \n ', t(length(t)),round(y(length(t),4)));
fprintf('Infected (infectious) at t = %d: \t%d \n ', t(length(t)),round(y(length(t),3)) );
fprintf('Exposed (non-infectious) at t = %d: \t%d \n ',t(length(t)),round(y(length(t),2)));
fprintf('Susceptable at t = %d: \t\t%d \n\n', t(length(t)), round(y(length(t),1)));

% Scernario 3
par.rtable = [ 1 3; 21 2.2; 71 0.7; 85 0.8; 91 1; 111 0.9; 1001 0.5];
[t,y] = ode45(@(t, y) seir(t,y, par) ,[0,180], yinit, options);
clear total_cases
total_cases(:,1) = y(:,2) + y(:,3) + y(:,4);

% deaths
figure(d);
hold on
plot( t, y(:,4)*0.04);
xlabel('time(days)');
ylabel('Deaths');

% hospital
figure(h);
hold on
plot(t,y(:,3)*0.08);

% ICU
figure(i);
hold on
plot(t,y(:,3)*0.01);

% Active cases
figure;
plot(t, y(:,2) + y(:,3));
xlabel('time(days)');
ylabel('Total Active Cases: E+I');

% Exposed
figure;
plot(t, y(:,2));
xlabel('time(days)');
ylabel('E: exposed');

% Total cases
figure;
plot(t, total_cases(:,1));
xlabel('time(days)');
ylabel('Total Cases: E+I+R');

fprintf('Scenario 3:\n time (days): \t%d\n ', t(length(t))) ;
fprintf('total population:\t%d\n ',round(sum(y(length(t),:))));
fprintf('initial infected:\t%d\n ',round(yinit(3)));
fprintf('total cases (E+I+R) at t = %d: \t%d \n ',t(length(t)), round(sum(y(length(t),2:4))));
fprintf('Recovered at t= %d: \t\t\t%d \n ', t(length(t)),round(y(length(t),4)));
fprintf('Infected (infectious) at t = %d: \t%d \n ', t(length(t)),round(y(length(t),3)) );
fprintf('Exposed (non-infectious) at t = %d: \t%d \n ',t(length(t)),round(y(length(t),2)));
fprintf('Susceptable at t = %d: \t\t%d \n\n', t(length(t)), round(y(length(t),1)));

% Scernario 4
par.rtable = [ 1 3; 21 2.2; 71 0.9; 85 2.5; 91 3.2; 111 0.85; 1001 0.5];
[t,y] = ode45(@(t, y) seir(t,y, par) ,[0,180], yinit, options);
clear total_cases
total_cases(:,1) = y(:,2) + y(:,3) + y(:,4);

% Deaths
figure(d);
hold on
plot( t, y(:,4)*0.04);
set(gca, 'YScale', 'log');
ylim([1 10^6]);
xlabel('time(days)');
ylabel('Deaths');
legend('S1','S2','S3','S4');

% hospital
figure(h);
hold on
plot(t,y(:,3)*0.08);
set(gca, 'YScale', 'log');
ylim([0 1e+5]);
yline(3500);
legend('S1','S2','S3','S4','care beds');

% ICU
figure(i);
hold on
plot(t,y(:,3)*0.01);
set(gca, 'YScale', 'log');
ylim([0 inf]);
yline(160);
legend('S1','S2','S3','S4','ICU beds');

% Active cases
figure;
plot(t, y(:,2) + y(:,3));
xlabel('time(days)');
ylabel('Total Active Cases: E+I');

% Exposed
figure;
plot(t, y(:,2));
xlabel('time(days)');
ylabel('E: exposed');

% Total cases
figure;
plot(t, total_cases(:,1));
xlabel('time(days)');
ylabel('Total Cases: E+I+R');

fprintf('Scenario 4:\n time (days): \t%d\n ', t(length(t))) ;
fprintf('total population:\t%d\n ',round(sum(y(length(t),:))));
fprintf('initial infected:\t%d\n ',round(yinit(3)));
fprintf('total cases (E+I+R) at t = %d: \t%d \n ',t(length(t)), round(sum(y(length(t),2:4))));
fprintf('Recovered at t= %d: \t\t\t%d \n ', t(length(t)),round(y(length(t),4)));
fprintf('Infected (infectious) at t = %d: \t%d \n ', t(length(t)),round(y(length(t),3)) );
fprintf('Exposed (non-infectious) at t = %d: \t%d \n ',t(length(t)),round(y(length(t),2)));
fprintf('Susceptable at t = %d: \t\t%d \n\n', t(length(t)), round(y(length(t),1)));