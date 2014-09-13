clear all;close all; clc;
station_out_log = load('outputFile_GroundTracking.txt');
real_log = load('ViconData2.txt');

[nO, mO] = size(real_log);
[nS, mS] = size(station_out_log);

nS = 200;
nO=nS;

figure(1);
subplot(2,1,1);
plot(       1:nO, real_log(1:nO,2),'r',...
            1:nO, real_log(1:nO,3),'g',...
            1:nO, real_log(1:nO,4),'b');
title('Original trajectory');
legend('x','y','z');
subplot(2,1,2);
plot(       1:nS, station_out_log(1:nS,2),'r',...
            1:nS, station_out_log(1:nS,3),'g',...
            1:nS, station_out_log(1:nS,4),'b');
title('tracked trajectory');
legend('x','y','z');

figure(2);
errorX = real_log(1:nO, 2) - station_out_log(1:nS, 2);
errorY = real_log(1:nO, 3) - station_out_log(1:nS, 3);
errorZ = real_log(1:nO, 4) - station_out_log(1:nS, 4);

midErrorX(1:nS) = sum(real_log(1:nO, 2) - station_out_log(1:nS, 2))/nS;
midErrorY(1:nS) = sum(real_log(1:nO, 3) - station_out_log(1:nS, 3))/nS;
midErrorZ(1:nS) = sum(real_log(1:nO, 4) - station_out_log(1:nS, 4))/nS;

plot(       1:nS, errorX,'r',...
            1:nS, midErrorX,'r',...
            1:nS, errorY,'g',...
            1:nS, midErrorY,'g',...
            1:nS, errorZ,'b',...
            1:nS, midErrorZ,'b');
title('Error');
legend('errorX', 'midErrorX', 'errorY', 'midErrorY', 'errorZ', 'midErrorZ');

figure(3);
plot3(      real_log(1:nO,2), real_log(1:nO,3), real_log(1:nO,4), 'b',...
            station_out_log(1:nS,2), station_out_log(1:nS,3), station_out_log(1:nS,4), 'r');

figure(4);
midFPS1 = sum(station_out_log(1:nS,7))/nS;
midFPS2 = sum(station_out_log(1:nS,8))/nS;

midFPS1(1:nS) = midFPS1;
midFPS2(1:nS) = midFPS2;

subplot(2,1,1);
plot(1:nS, station_out_log(1:nS,7), 'r', 1:nS, midFPS1, 'k');
title('Segmentation FPS')
subplot(2,1,2);
plot(1:nS, station_out_log(1:nS,8), 'b', 1:nS, midFPS2, 'k');
title('Tracking FPS')
