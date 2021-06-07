clear all 
close all 
%  Analyse du signal initial
db = 70;

[x,nue] = audioread('signal5.wav');
soundsc(x,nue);
sgram(x,nue,db,1);
%Synthèse d’un filtre avec une fenêtre rectangulaire
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

%Synthèse d’un filtre avec une autre fenêtre
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

%Filtrage
figure(4);
signal_filtre_fenetre_black=filter(B,1,x);
soundsc(signal_filtre_fenetre_black,nue);
sgram(signal_filtre_fenetre_black,nue,60,4);        






