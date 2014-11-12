close all;
clear all;
clc;
load dataset;
scaledLateralAcc=scale( Lateral_Acc(2:end,:));
scaledLongitudinalAcc=scale(Longitudinal_Acc(2:end,:));
scaledVerticalAcc=scale(Vertical_Acc(2:end,:));
Accelerometer=sqrt((scaledLateralAcc).^2+(scaledLongitudinalAcc).^2+(scaledVerticalAcc).^2);

SkinTemp=Skin_Temperature__IR_Ther(2:end,:);
HeartRate=HR(2:end,:);
BreathRate=BR(2:end,:);
BreathRate(isnan(BreathRate)) = mean(BreathRate(~isnan(BreathRate)));
x=1:1:3421;
figure;
subplot(2,4,1);
plot(x,Accelerometer);
ylim([0 40]);
title('Accelerometer');
subplot(2,4,2);
[cleanAccelerometer,~] = func_denoise_wp1d(Accelerometer);
plot(x,cleanAccelerometer);
ylim([0 40]);
title('cleanAccelerometer');

subplot(2,4,3);
plot(x,SkinTemp);
ylim([0 40]);
title('SkinTemp');
subplot(2,4,4);
[cleanSkinTemp,~] = func_denoise_wp1d(SkinTemp);
plot(x,cleanSkinTemp,'b');
ylim([0 40]);
title('cleanSkinTemp');

subplot(2,4,5);
plot(x,HeartRate);
ylim([50 125]);
title('HeartRate');
subplot(2,4,6);
[cleanHeartRate,~] = func_denoise_wp1d(HeartRate);
plot(x,cleanHeartRate);
ylim([50 125]);
title('cleanHeartRate');

subplot(2,4,7);
plot(x,BreathRate);
ylim([0 40]);
title('BreathRate');
subplot(2,4,8);
[cleanBreathRate,~] = func_denoise_wp1d(BreathRate);
plot(x,cleanBreathRate);
ylim([0 40]);
title('cleanBreathRate');

