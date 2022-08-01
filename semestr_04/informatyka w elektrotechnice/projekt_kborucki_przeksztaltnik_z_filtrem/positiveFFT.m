function [X,freq]=positiveFFT(x)
%funkcja która zamienia FFT w funkcji czasu na czêstotliwoœci i dobiera
%tylko pierwsz¹ po³owê 
N=length(x); %dobiera liczbê punktów
k=0:N-1;     %tworzy wektor od 0 do N-1
T=N/1000;   %dzieli wektor na próbki
freq=k/T;    %dobiera zakres dla osi x (Hz)
X=fft(x)/N; % wykonuje analizê fft i normalizuje dane

%Dobiera pierwsz¹ po³owê FFT, (tylko ona jest potrzebna)
polowa = ceil(N/2); %ceil - zaokr¹glenie do pe³nej wartoœci d³ugoœci wektora
X = X(1:polowa);   %Dobiera piewrsz¹ po³owê wartoœci osi X,
freq = freq(1:polowa);   %Dobiera piewrsz¹ po³owê wartoœci osi Y
end