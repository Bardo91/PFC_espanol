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
plot(       1:nO, stationOutLog(1:nO,7),'b',...
            1:nO, stationOutLog(1:nO,8),'r');
legend('x', 'y');
title('tracked trajectory');

medTime = sum(stationOutLog(1:nO,1))/nO;
fps(1:nO) = 1/medTime;
figure(3);
plot(1:nO, 1./stationOutLog(1:nO,1), 1:nO, fps);
title('FPS');

inc = nV/nO;

figure(2);
for i = 1:nO
    errX(i) = viconData(floor(i*inc),2) - stationOutLog(i,7);
    errY(i) = viconData(floor(i*inc),3) - stationOutLog(i,8);
end
plot(       1:nO, errX, 'b',...
            1:nO, errY, 'r');
legend('Error x', 'Error y');
title('Errors');

%% 3D plots
Z1(1:nO) = 0;
Z2(1:nO) = 0;

figure(4);
plot3(      viconData(1:floor(inc):nV-16,1), viconData(1:floor(inc):nV-16,2), Z1, 'b',...
            stationOutLog(1:nO,7), stationOutLog(1:nO,8), Z2, 'r');
%         
% plot3(      quad_out_log(1:nO,1), quad_out_log(1:nO,2), Z1, 'b',...
%             station_out_log(1:testN,1), station_out_log(1:testN,2), Z2(1:testN), 'r',...
%             X_brute(1:nS, 1), X_brute(1:nS, 2), X_brute(1:nS, 3), 'g');
        
