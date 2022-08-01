function analiza(napiecieFFT40,napiecieFFT21,napiecieFFT85,pradFFT40,pradFFT21,pradFFT85)
%funkcja analizy
wykresyAnalizy = figure; %utworzenie okienka z wykresami

%dla napi�cia przy -40
x=napiecieFFT40;
[X,freq]=positiveFFT(x);  %funkcja kt�ra zamienia FFT w funkcji czasu na cz�stotliwo�ci i dobiera tylko pierwsz� po�ow�
subplot(6,1,1); %po�o�enie wykresu
plot(freq,abs(X));          %abs aby prawid�owo przedstawia� warto�ci na osi Y
hold on;
grid on;
xlabel('f [Hz]');
ylabel('|U(f)|');
title('Analiza FFT napi�cia wyj�ciowego przy T=-40�C');

%dla napi�cia przy 21
x=napiecieFFT21;
[X,freq]=positiveFFT(x);  %funkcja kt�ra zamienia FFT w funkcji czasu na cz�stotliwo�ci i dobiera tylko pierwsz� po�ow�
subplot(6,1,2);
plot(freq,abs(X));          %abs aby prawid�owo przedstawia� warto�ci na osi Y
hold on;
grid on;
xlabel('f [Hz]');
ylabel('|U(f)|');
title('Analiza FFT napi�cia wyj�ciowego przy T=21�C');

%dla napi�cia przy 85
x=napiecieFFT85;
[X,freq]=positiveFFT(x);  %funkcja kt�ra zamienia FFT w funkcji czasu na cz�stotliwo�ci i dobiera tylko pierwsz� po�ow�
subplot(6,1,3);
plot(freq,abs(X));          %abs aby prawid�owo przedstawia� warto�ci na osi Y
hold on;
grid on;
xlabel('f [Hz]');
ylabel('|U(f)|');
title('Analiza FFT napi�cia wyj�ciowego przy T=85�C');

%dla pr�du t-40
x=pradFFT40;
[X,freq]=positiveFFT(x);
subplot(6,1,4);
plot(freq,abs(X))
hold on;
grid on;
xlabel('f [Hz]');
ylabel('|I(f)|');
title('Analiza FFT pr�du wyj�ciowego przy T=-40�C');

%dla pr�du t21
x=pradFFT21;
[X,freq]=positiveFFT(x);
subplot(6,1,5);
plot(freq,abs(X));
hold on;
grid on;
xlabel('f [Hz]');
ylabel('|I(f)|');
title('Analiza FFT pr�du wyj�ciowego przy T=21�C');

%dla pr�du t85
x=pradFFT85;
[X,freq]=positiveFFT(x);
subplot(6,1,6);
plot(freq,abs(X));
hold on;
grid on;
xlabel('f [Hz]');
ylabel('|I(f)|');
title('Analiza FFT pr�du wyj�ciowego przy T=85�C');
return



% analiza = figure
% t=0:0.00001:0.10;
% 
% subplot(211)
% plot(t,funkcjaNapieciaT40);
% 
% Y = fft(funkcjaNapieciaT40);
% f = (0:length(Y)-1)*500/length(Y);
% %g = linspace(0,0.01,length(f));
% 
% subplot(212)
% plot(f,abs(Y));

end
