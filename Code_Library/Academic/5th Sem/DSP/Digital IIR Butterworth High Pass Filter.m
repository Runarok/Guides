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
 [b,a]=butter(n,wn,'high');
disp('the order of hpf');
disp(n);
disp('the cut off freq of hpf');
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
xlabel('normalisedfreq');
ylabel('angle');

%%
system input:
enter the pass band ripple=3
enter the stop band ripple=60
enter the pass band frequency=150
enter the stop band frequency=300
enter the sampling frequency=1500           
%%
