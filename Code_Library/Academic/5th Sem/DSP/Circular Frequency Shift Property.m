clc;
clear all;
close all;
x=input('enter the first input sequence=');
l=input('enter the number of shifts');
N=length(x);
xk=fft(x,N);
yv=circshift(xk,[0,l]);
for n=0:N-1
    w(n+1)=exp((j*2*pi*n*l)/N);
end;
y=w.*x;
yk=fft(y);
disp(yk);
disp(yv);
if(floor(abs(yk)))==(floor(abs(yv)))
    disp('circular frequency shift property is satisfied');
    else
      disp('circular frequency shift property is not satisfied');  
end;
