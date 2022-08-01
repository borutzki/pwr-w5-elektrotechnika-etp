function [X,freq]=positiveFFT(x)
%funkcja kt�ra zamienia FFT w funkcji czasu na cz�stotliwo�ci i dobiera
%tylko pierwsz� po�ow� 
N=length(x); %dobiera liczb� punkt�w
k=0:N-1;     %tworzy wektor od 0 do N-1
T=N/1000;   %dzieli wektor na pr�bki
freq=k/T;    %dobiera zakres dla osi x (Hz)
X=fft(x)/N; % wykonuje analiz� fft i normalizuje dane

%Dobiera pierwsz� po�ow� FFT, (tylko ona jest potrzebna)
polowa = ceil(N/2); %ceil - zaokr�glenie do pe�nej warto�ci d�ugo�ci wektora
X = X(1:polowa);   %Dobiera piewrsz� po�ow� warto�ci osi X,
freq = freq(1:polowa);   %Dobiera piewrsz� po�ow� warto�ci osi Y
end