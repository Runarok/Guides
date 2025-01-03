clc;
clear all;
close all;
x=input('enter the first input sequence=');
m=input('enter the number of shifts');
N=length(x);
Xs=circshift(x,[0,m]);
y=fft(Xs,N);
xk=fft(x,N);
for K=0:N-1
    w(K+1)=exp((-j*2*pi*K*m)/N);
end;
Yv=w.*xk;
disp(y);
disp(Yv);
if(floor(abs(y)))==(floor(abs(Yv)))
    disp('circular time shift property is satisfied');
    else
      disp('circular time shift property is not satisfied');  
end;
