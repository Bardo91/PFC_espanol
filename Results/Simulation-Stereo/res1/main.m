clear all;close all; clc;
station_in_log_quad_1 = load('in_log_quad1.txt','r');
station_in_log_quad_2 = load('in_log_quad2.txt','r');
station_out_log = load('out_log.txt');
quad_out_log = load('out_Log_vrep.txt');

[nO, mO] = size(quad_out_log);
[nS, mS] = size(station_out_log);

figure(1);
plot(       1:nO, quad_out_log(1:nO,1),'b',...
            1:nO, quad_out_log(1:nO,2),'r');
title('Original trajectory');
        
figure(2);
plot(       1:nS, station_out_log(1:nS,1),'b',...
            1:nS, station_out_log(1:nS,2),'r');
title('tracked trajectory');

figure(3);
plot(station_in_log_quad_1(:,3));
title('Timespan');
medTime = sum(station_in_log_quad_1(:,3))/nS;
fps = 1/medTime

%% "Brute triangulation Station info_log"
% u0 = 256/2;
% v0 = 256/2; 
% f = 300; % Aprox
% 
% X_brute = [];
% z = 0.00;
% for i = 1:nS
%     C = station_in_log(i, 4:6)';
%      R =     rotx(station_in_log(i,7)*180/pi)*...
%              roty(station_in_log(i,8)*180/pi)*...
%              rotz(station_in_log(i,9)*180/pi);
% 
%     Zk = [station_in_log(i,10)-u0, station_in_log(i,11)-v0];
%     
%     zc = (z - C(3))/(R(3,1)*Zk(1)/f + R(3,2)*Zk(2)/f + R(3,3));
%     
%     X = [C(1) ; C(2)] + R(1:2, 1:3)*[-Zk(1)/f ; Zk(2)/f;1]*zc;
%     X_brute = [X_brute ; X' , z];
% end

%% "Brute triangulation Vrep info log"
% 
% u0 = 256/2;
% v0 = 256/2; 
% f = 300; % Aprox
% 
% X_brute2 = [];
% z = 0.00;
% for i = 1:nO
%     C = quad_out_log(i, 4:6)';
%     R =     rotx(quad_out_log(i,7)*180/pi)*...
%             roty(quad_out_log(i,8)*180/pi)*...
%             rotz(quad_out_log(i,9)*180/pi);
% 
%     Zk = [quad_out_log(i,10), quad_out_log(i,11)];
%     
%     xc = (z - C(3))/(R(3,1) + Zk(1)/f*R(3,2) + Zk(2)/f*R(3,3));
%     
%     X = [C(1) ; C(2)] + R(1:2, 1:3)*[1 ; Zk(1)/f ; Zk(2)/f]*xc;
%     X_brute2 = [X_brute2 ; X' , z];
% end
% 



%% 3D plots
Z1(1:nO) = 0;
Z2(1:nS) = 0;

testN  = nS;
figure(4);
plot3(      quad_out_log(1:nO,1), quad_out_log(1:nO,2), Z1, 'b',...
            station_out_log(1:testN,1), station_out_log(1:testN,2), Z2(1:testN), 'r');
        
% plot3(      quad_out_log(1:nO,1), quad_out_log(1:nO,2), Z1, 'b',...
%             station_out_log(1:testN,1), station_out_log(1:testN,2), Z2(1:testN), 'r',...
%             X_brute(1:nS, 1), X_brute(1:nS, 2), X_brute(1:nS, 3), 'g');
% plot3(      quad_out_log(1:nO,1), quad_out_log(1:nO,2), Z1, 'b',...
%             X_brute(1:nS, 1), X_brute(1:nS, 2), X_brute(1:nS, 3), 'g');
        
        
