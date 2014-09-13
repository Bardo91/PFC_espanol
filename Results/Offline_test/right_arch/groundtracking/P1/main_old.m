clear all;close all; clc;
viconData = load('ViconData2.txt');
stationOutLog = load('out_log.txt');

[nV, mV] = size(viconData);
[nO, mO] = size(stationOutLog);

% nO = 200;
 nV = nO;

figure(1);
subplot(2,1,1);
plot(       1:nV, viconData(1:nV,2),'b',...
            1:nV, viconData(1:nV,3),'r');
title('Original trajectory');
subplot(2,1,2);
plot(       1:nO, stationOutLog(1:nO,7),'b',...
            1:nO, stationOutLog(1:nO,8),'r');
title('tracked trajectory');

medTime = sum(stationOutLog(1:nO,1))/nO;
fps(1:nO) = 1/medTime;
figure(3);
plot(1:nO, 1./stationOutLog(1:nO,1), 1:nO, fps);
title('FPS');

figure(2);
plot(       1:nO, viconData(1:nV,2) - stationOutLog(1:nO,7),'b',...
            1:nO, viconData(1:nV,3) - stationOutLog(1:nO,8),'r');


%% 3D plots
Z1(1:nO) = 0;
Z2(1:nV) = 0;

figure(4);
plot3(      viconData(1:nV,1), viconData(1:nV,2), Z1, 'b',...
            stationOutLog(1:nO,7), stationOutLog(1:nO,8), Z2, 'r');
%         
% plot3(      quad_out_log(1:nO,1), quad_out_log(1:nO,2), Z1, 'b',...
%             station_out_log(1:testN,1), station_out_log(1:testN,2), Z2(1:testN), 'r',...
%             X_brute(1:nS, 1), X_brute(1:nS, 2), X_brute(1:nS, 3), 'g');
        
