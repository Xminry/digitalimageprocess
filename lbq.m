%% Parameter Interface
Frequence0          = 50;        %单位：Hz    
Frequence1          = 130;       %单位：Hz
Frequence2          = 1e3;       %单位：Hz
SampleFre           = 4e3;       %单位：Hz
SampleLen           = SampleFre; %采样点数
%% Main
%-------------------产生三路信号
t = 0:1/SampleLen:1/SampleFre*(SampleLen-1);
SignalData0 = sin(2*pi*Frequence0*t);
SignalData1 = sin(2*pi*Frequence1*t);
SignalData2 = sin(2*pi*Frequence2*t);
SignalData3 = SignalData0+SignalData1+SignalData2;
figure;hold on
plot(t(1:150),SignalData0(1:150),'b')
plot(t(1:150),SignalData1(1:150),'r')
plot(t(1:150),SignalData2(1:150),'k')
hold off
figure;plot(t(1:150),SignalData3(1:150))
title('三路信号求和')
[b a]=sos2tf(SOS,G);
dataFiltered=filter(b, a, SignalData3);
figure;plot(t(1:150),dataFiltered(1:150))