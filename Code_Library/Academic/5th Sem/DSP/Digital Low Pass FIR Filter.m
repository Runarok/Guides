clc;
clear all;
close all;
rp=input('enter the passband ripple');
rs=input('enter the stopband ripple');
fp=input('enter the passbandfreq');
fs=input('enter the stopbandfreq');
f=input('enter the sampling freq');
wp=2*fp/f;
ws=2*fs/f;
num=-20*log10(sqrt(rp*rs))-13;
den=14.6*(fs-fp)/f;
n=ceil(num/den);
n1=n+1;
if(rem(n,2)~=0)
 n1=n;
 n=n-1;
end;
y=boxcar(n1); / y=bartlett(n1); / y=hanning(n1); / y=hamming(n1);
b=fir1(n,wp,'low',y);
[h,q]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,2,1);
plot(q/pi,m);
xlabel('normalisedfreq');
ylabel('gain in dB');
title('low pass filter using rectangular window');

%%
system input:
enter the passband ripple=0.02
enter the stopband ripple=0.01
enter the passbandfreq=1200
enter the stopbandfreq=1700
enter the sampling freq=9000        
%%
