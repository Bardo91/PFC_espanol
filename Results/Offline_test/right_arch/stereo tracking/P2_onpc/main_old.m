clear all;close all; clc;
viconData = load('ViconData2.txt');
stationOutLog = load('out_log.txt');

[nV, mV] = size(viconData);
[nO, mO] = size(stationOutLog);

figure(1);
subplot(2,1,1);
plot(       1:nV, viconData(1:nV,2),'b',...
            1:nV, viconData(1:nV,3),'r');
legend('x', 'y');
title('Original trajectory');
subplot(2,1,2);
plot(       1:nO, stationOutLog(1:nO,6),'b',...
            1:nO, stationOutLog(1:nO,7),'r');
legend('x', 'y');
title('tracked trajectory');

errMedX = abs(sum(viconData(1:nV,2))/nV - sum(stationOutLog(1:nO,6))/nO)
errMedY = abs(sum(viconData(1:nV,3))/nV - sum(stationOutLog(1:nO,7))/nO)

%% 3D plots
Z1(1:nV) = 0;
Z2(1:nO) = 0;

figure(4);
plot3(      viconData(1:nV,2), viconData(1:nV,3), Z1, 'b',...
            stationOutLog(1:nO,6), stationOutLog(1:nO,7), Z2, 'r');
%         
% plot3(      quad_out_log(1:nO,1), quad_out_log(1:nO,2), Z1, 'b',...
%             station_out_log(1:testN,1), station_out_log(1:testN,2), Z2(1:testN), 'r',...
%             X_brute(1:nS, 1), X_brute(1:nS, 2), X_brute(1:nS, 3), 'g');
        
