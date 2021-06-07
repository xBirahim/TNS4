clear all 
close all 

db = 70;

[x,nue] = audioread('signal5.wav');
soundsc(x,nue);
sgram(x,nue,db,1);

M = randi([40,50]);
fc = 2000;
wn = 2*fc/nue;
w = rectwin(M+1);

B = fir1(M,wn,w);

N = 0:M;
figure (2);
subplot(221)
stem(N,B,'r');
title('Réponse Impulsionnelle');
xlabel('indice');
ylabel('amplitude');

subplot(222)
zplane(roots(B),'m');
title('Diagramme de pôle-zéros');
xlabel('réel');
ylabel('imaginaire');

subplot(223)
fa = 2045;
[y,F] = freqz(B,1,fa,nue);
plot(F,20*log10(abs(y)),'k');
title('Gain Complexe en module');
xlabel('Fréquence(hz)');
ylabel('db');

subplot(224)
plot(F,unwrap(angle(y)),'m');
title('Gain Complexe en module');
xlabel('Fréquence(hz)');
ylabel('db');

%La fréquence de coupure est bien à 2000hz aprés avoir verifié les tracé du
%gain complex

w2 = blackman(M+1);


B1 = fir1(M,wn,w2);

figure (3);
subplot(221)
stem(N,B1,'r');
title('Réponse Impulsionnelle');
xlabel('indice');
ylabel('amplitude');

subplot(222)
zplane(roots(B1),'m');
title('Diagramme de pôle-zéros');
xlabel('réel');
ylabel('imaginaire');

subplot(223)
fa = 2045;
[y1,F1] = freqz(B1,1,fa,nue);
plot(F1,20*log10(abs(y1)),'k');
title('Gain Complexe en module');
xlabel('Fréquence(hz)');
ylabel('db');

subplot(224)
plot(F1,unwrap(angle(y1)),'m');
title('Gain Complexe en module');
xlabel('Fréquence(hz)');
ylabel('db');

% figure(5);
% signal_filtre_fenetre_black=filter(B1,1,X);
% sgram(signal_filtre_fenetre_black,nue,60,5);        
% soundsc(signal_filtre_fenetre_black,nue);


