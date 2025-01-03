clc;
clear all;
close all;
x1=input('enter the first input sequence=');
x2=input('enter the second input sequence=');
a1=input('enter the constant a1=');
a2=input('enter the constant a2=');
l1=length(x1);
l2=length(x2);
N=max(l1,l2);
x1n=[x1,zeros(1,N-l1)];
x2n=[x2,zeros(1,N-l2)];
y=a1*x1n+a2*x2n;
yk=fft(y,N);
disp('output sequence y(k) is');
disp(yk);
x1k=fft(x1,N);
x2k=fft(x2,N);
yv=a1*x1k+a2*x2k;
if(yk==yv)
    disp('linearity property is satisfied');
    else
      disp('linearity property is not satisfied');  
end;
