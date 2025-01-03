clc;
clear all;
close all;
rp=input('enter the pass band ripple=');
rs=input('enter the stop band ripple=');
wp=input('enter the pass band frequency=');
ws=input('enter the stop band frequency=');
fs=input('enter the sampling frequency=');
w1=2*wp/fs;
 w2=2*ws/fs;
 [n,wn]=buttord(w1,w2,rp,rs);
 [b,a]=butter(n,wn,'low');
disp('the order of lpf');
disp(n);
disp('the cut off freq of lpf');
disp(wn);
w=0:0.01:pi;
[h]=freqz(b,a,w);
mag=20*log10(abs(h));
ang=angle(h);
subplot(2,1,1);
plot(w/pi,mag);
xlabel('normalized freq');
ylabel('magnitude');
subplot(2,1,2);
plot(w/pi,ang);
xlabel('normalised freq');
ylabel('angle');

%%
system input:
enter the passband ripple=0.02
enter the stopband ripple=0.01
enter the passbandfreq=1200
enter the stopbandfreq=1700
enter the sampling freq=9000        
%%
