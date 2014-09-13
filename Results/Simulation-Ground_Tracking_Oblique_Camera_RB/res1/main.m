clear all;close all; clc;
station_in_logR = load('in_logR.txt','r');
station_in_logB = load('in_logB.txt','r');
station_out_logR = load('out_log0.txt');
station_out_logB = load('out_log1.txt');
quad_out_logR = load('out_Log_vrep0.txt');
quad_out_logB = load('out_Log_vrep1.txt');

[nOR, mOR] = size(quad_out_logR);
[nTR, mTR] = size(station_out_logR);
[nOB, mOB] = size(quad_out_logB);
[nTB, mTB] = size(station_out_logB);

%%----------------------------------------------------------------------------------------------------------
figure(1);
subplot(1,2,1);
plot(       1:nOR, quad_out_logR(1:nOR,1),'b',...
            1:nOR, quad_out_logR(1:nOR,2),'r');
title('Original trajectory R');
subplot(1,2,2);
plot(       1:nTR, station_out_logR(1:nTR,1),'b',...
            1:nTR, station_out_logR(1:nTR,2),'r');
title('tracked trajectory R ');

figure(2);
subplot(1,2,1);
plot(       1:nOB, quad_out_logB(1:nOB,1),'b',...
            1:nOB, quad_out_logB(1:nOB,2),'r');
title('Original trajectory B');
subplot(1,2,2);
plot(       1:nTB, station_out_logB(1:nTB,1),'b',...
            1:nTB, station_out_logB(1:nTB,2),'r');
title('tracked trajectory B ');

%%----------------------------------------------------------------------------------------------------------

% figure(3);
% plot(station_in_log(:,3));
% title('Timespan');
% medTime = sum(station_in_log(:,3))/nT;
% fps = 1/medTime

%% "Brute triangulation Station info_log"
u0 = 256/2;
v0 = 256/2; 
f = 300; % Aprox

X_bruteR = [];
z = 0.00;
for i = 1:nTR
    C = station_in_logR(i, 4:6)';
     R =     rotx(station_in_logR(i,7)*180/pi)*...
             roty(station_in_logR(i,8)*180/pi)*...
             rotz(station_in_logR(i,9)*180/pi);

    Zk = [station_in_logR(i,10)-u0, station_in_logR(i,11)-v0];
    
    zc = (z - C(3))/(R(3,1)*Zk(1)/f + R(3,2)*Zk(2)/f + R(3,3));
    
    X = [C(1) ; C(2)] + R(1:2, 1:3)*[-Zk(1)/f ; Zk(2)/f;1]*zc;
    X_bruteR = [X_bruteR ; X' , z];
end


X_bruteB = [];
z = 0.00;
for i = 1:nTB
    C = station_in_logB(i, 4:6)';
     R =     rotx(station_in_logB(i,7)*180/pi)*...
             roty(station_in_logB(i,8)*180/pi)*...
             rotz(station_in_logB(i,9)*180/pi);

    Zk = [station_in_logB(i,10)-u0, station_in_logB(i,11)-v0];
    
    zc = (z - C(3))/(R(3,1)*Zk(1)/f + R(3,2)*Zk(2)/f + R(3,3));
    
    X = [C(1) ; C(2)] + R(1:2, 1:3)*[-Zk(1)/f ; Zk(2)/f;1]*zc;
    X_bruteB = [X_bruteB ; X' , z];
end

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
Z1R(1:nOR) = 0;
Z2R(1:nTR) = 0;

testN  = nTR;
figure(3);
subplot(1,2,1);
plot3(      quad_out_logR(1:nOR,1), quad_out_logR(1:nOR,2), Z1R, 'b',...
            station_out_logR(1:testN,1), station_out_logR(1:testN,2), Z2R(1:testN), 'r');
% plot3(      quad_out_logR(1:nOR,1), quad_out_logR(1:nOR,2), Z1R, 'b',...
%             station_out_logR(1:testN,1), station_out_logR(1:testN,2), Z2R(1:testN), 'r',...
%             X_bruteR(1:nTR, 1), X_bruteR(1:nTR, 2), X_bruteR(1:nTR, 3), 'g');        
title('3D Trajectories R');
       
 %% 3D plots
Z1B(1:nOB) = 0;
Z2B(1:nTB) = 0;

testN  = nTB;
subplot(1,2,2);
plot3(      quad_out_logB(1:nOB,1), quad_out_logB(1:nOB,2), Z1B, 'b',...
            station_out_logB(1:testN,1), station_out_logB(1:testN,2), Z2B(1:testN), 'r');
% plot3(      quad_out_logB(1:nOB,1), quad_out_logB(1:nOB,2), Z1B, 'b',...
%             station_out_logB(1:testN,1), station_out_logB(1:testN,2), Z2B(1:testN), 'r',...
%             X_bruteB(1:nTB, 1), X_bruteB(1:nTB, 2), X_bruteB(1:nTB, 3), 'g');        
title('3D Trajectories B');
