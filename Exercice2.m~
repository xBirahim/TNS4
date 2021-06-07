clear all
close all 

[X,nue] = audioread('signal5.wav');
soundsc(X,nue);

fc=2000; 
wn=fc*2/nue;
N=120; 
w1=rectwin(N+1); 
A=fir1(N,wn,w1);
 %Conception du filtre analogique
Rp=1; 
Rs=20;
fc=2900;
M=512;
n=2048;
N=7; 
wp=2*pi*fc;
w=2*pi*[0:M-1]/M*nue; 
 
%filtre analogique
[A,B]=ellip(N,Rp,Rs,wp,'s');
 
figure(1)

subplot(2,1,1); 
H=freqs(A,B,w); %gain complexe
plot(w/(2*pi),20*log10(abs(H)));
title('gain complexe en module')

xlabel('en frequence');
ylabel('dB');
 
subplot(2,1,2); 
plot(w/(2*pi),unwrap(angle(H)));
title('Phase');
xlabel('frequence');
ylabel('angle');

%Filtre Numerique
figure(2);
[y,d]= bilinear(A,B,nue,fc);
[h,t] = impz(y,d,nue);
[Gain_complexe_numerique,F ] = freqz(y,d,N,nue); 


