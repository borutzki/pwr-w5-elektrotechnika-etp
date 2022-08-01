function [obliczeniaOK funkcjaNapieciaT40 funkcjaNapieciaT21 funkcjaNapieciaT85 pradT40 pradT21 pradT85 mocT40 mocT21 mocT85 napiecieFFT40 napiecieFFT21 napiecieFFT85 pradFFT40 pradFFT21 pradFFT85] = obliczenia(alfa,pojemnosc,obciazenie)
%%sieæ zasilaj¹ca 50Hz = definicja sta³ych
napiecie=230; %V
Vmax=230*sqrt(2); %v
omega = 2*pi*50;
mocMaksymalna=10000;

%rezystancja obci¹¿enia w ró¿nych temperaturach
obciazenieT40 = obciazenie*(1+alfa*(-61)); %przeliczenie rezystancji na -40C
obciazenieT21 = obciazenie; 
obciazenieT85 = obciazenie*(1+alfa*(64)); %przeliczenie rezystancji na +85C

%warunek sprawdzaj¹cy, czy moc maksymalna jest przekroczona
mocChwilowaMax = Vmax*(Vmax/obciazenieT40); %sprawdzenie maksymalnej mocy chwilowej
if mocChwilowaMax > mocMaksymalna %sprawdzenie ,czy przekroczono moc maksymaln¹
    przekroczonaMoc=errordlg('Uwaga! Przekroczono moc maksymaln¹. Obliczenia nie zosta³y wykonane. Proszê zwiêkszyæ rezystancjê odbiornika.'); %okienko ostrze¿enia o przekroczonej mocy
    disp przekroczonaMoc; %jeœli moc jest przekroczona - wszystkie argumenty wyprowadzane z funkcji s¹ wyzerowane, brak dalszej czêœci obliczeñ
    funkcjaNapieciaT40=0;
    funkcjaNapieciaT21=0;
    funkcjaNapieciaT85=0;
    pradT40=0;
    pradT21=0;
    pradT85=0;
    mocT40=0;
    mocT21=0;
    mocT85=0;
    obliczeniaOK=0; %wartoœæ zwrotna - obliczenia nie wykonaj¹ siê, bo program g³ówny obs³u¿y skrypt
    return
end

%%funkcje do narysowania

t=0:0.00001:0.10; %definicja czasu
T=length(t); % d³ugoœc wektora czasu

%%wykres przebiegu napiêcia

%funkcja dla T=-40
stanDzialania='DiodaOn'; %zale¿nie od stanu dzia³ania diody - Ÿród³em napiêcia jest zasilanie albo kondensator
for i=1:T
    napiecieSin=Vmax*sin(omega*t); %napiêcie zasilaj¹ce
    switch stanDzialania     %zaleznoœæ funkcji od tego, czy dioda dzia³a, czy nie
        case 'DiodaOn'; %dioda przepuszcza pr¹d
            funkcjaNapieciaT40(i)=napiecieSin(i); %funkcja sinusoidalna
            pradRezystancji=napiecieSin(i)/obciazenieT40; %pr¹d p³yn¹cy w danej chwili przez rezystancjê
            pradKondensatora=omega*pojemnosc*Vmax*cos(omega*t(i)); %pr¹d p³yn¹cy w danej chwili przez kondensator, i=w*C*Vmax*cos(wt) -> pochodna napiêcia po czasie razy pojemnoœæ
            sumaPradow=pradRezystancji+pradKondensatora; %suma pradów - je¿eli jest mniejsza od 0 (pr¹d kondensatora > pr¹d rezystora) dioda nie przewodzi
            if sumaPradow <= 0 %jeœli pr¹dy daj¹ wynik ujemny, dioda prze³¹cza siê w stan zaporowy
                stanDzialania='DiodaOff'; %prze³¹czenie statusu diody
                Ta=t(i); %wyznaczenie sta³ej "t1" przejœcia w roz³adowywanie kondensatora
            end
        case 'DiodaOff'; %jeœli dioda jest w stanie zaporowym, funkcja napiêcia jest wyk³adnicza 
            funkcjaNapieciaT40(i)=Vmax*sin(omega*Ta).*exp(-(t(i)-Ta)./(obciazenieT40*pojemnosc)); %funkcja z przebiegu exp
            if napiecieSin(i) >= funkcjaNapieciaT40(i); %je¿eli funkcja sinusoidalna ma wiêksz¹ wartoœæ ni¿ exp, nastêpuje powrót do przebiegu sinusoidalnego
                stanDzialania = 'DiodaOn'; %dioda znowu przewodzi 
            end
    end
end

%funkcja dla T=21, to samo co powy¿ej, tylko z uwzglêdnieniem innego obci¹¿enia
stanDzialania='DiodaOn';
for i=1:T;
    napiecieSin=Vmax*sin(omega*t);
    %zaleznoœc funkcji od tego, czy dioda dzia³a, czy nie
    switch stanDzialania 
        case 'DiodaOn';
            funkcjaNapieciaT21(i)=napiecieSin(i);
            pradRezystancji=napiecieSin(i)/obciazenieT21;
            pradKondensatora=omega*pojemnosc*Vmax*cos(omega*t(i));
            sumaPradow=pradRezystancji+pradKondensatora;
            if sumaPradow <= 0
                stanDzialania='DiodaOff';
                Ta=t(i);
            end
        case 'DiodaOff';
            funkcjaNapieciaT21(i)=Vmax*sin(omega*Ta).*exp(-(t(i)-Ta)./(obciazenieT21*pojemnosc));
            if napiecieSin(i) >= funkcjaNapieciaT21(i);
                stanDzialania = 'DiodaOn';
            end
    end
end

%funkcja dla T=85 -> jak powy¿ej, tylko kolejna wartoœæ mocy
stanDzialania='DiodaOn';
for i=1:T;
    napiecieSin=Vmax*sin(omega*t);
    %zaleznoœc funkcji od tego, czy dioda dzia³a, czy nie
    switch stanDzialania 
        case 'DiodaOn';
            funkcjaNapieciaT85(i)=napiecieSin(i);
            pradRezystancji=napiecieSin(i)/obciazenieT85;
            pradKondensatora=omega*pojemnosc*Vmax*cos(omega*t(i));
            sumaPradow=pradRezystancji+pradKondensatora;
            if sumaPradow <= 0
                stanDzialania='DiodaOff';
                Ta=t(i);
            end
        case 'DiodaOff';
            funkcjaNapieciaT85(i)=Vmax*sin(omega*Ta).*exp(-(t(i)-Ta)./(obciazenieT85*pojemnosc));
            if napiecieSin(i) >= funkcjaNapieciaT85(i);
                stanDzialania = 'DiodaOn';
            end
    end
end

%pr¹dy
for i=1:T;
    pradT40(i) = funkcjaNapieciaT40(i)/obciazenieT40; %wyznaczenie pr¹dów dla ró¿nych temperatur na podstawie napiêæ i rezystancji przy ró¿nych temperaturach
    pradT21(i) = funkcjaNapieciaT21(i)/obciazenieT21; 
    pradT85(i) = funkcjaNapieciaT85(i)/obciazenieT85;
end

%moc uk³adu
for i=1:T;
    mocT40(i) = funkcjaNapieciaT40(i)*pradT40(i); %moc dla zadanego okresu czasu - iloczyn pr¹du i napiêcia, mówimy tylko o mocy czynnej
    mocT21(i) = funkcjaNapieciaT21(i)*pradT21(i);
    mocT85(i) = funkcjaNapieciaT85(i)*pradT85(i);
end

% %wstêpne obliczenia dla analizy FFT
Ts=1/1000;      %czêstoœæ próbkowania
czasFFT=0:Ts:1-Ts;    %wektor czasu dla analizy FFT

for i=1:1:length(czasFFT) %obliczenie przebiegu napiêcia dola funkcji FFT przy ró¿nych temperaturach
    napiecieFFT40(i)=funkcjaNapieciaT40(i); %obliczenie dla obci¹¿enia 
    napiecieFFT21(i)=funkcjaNapieciaT21(i);
    napiecieFFT85(i)=funkcjaNapieciaT85(i);
end

%obliczenia pr¹dów dla analizy FFT przy ró¿nych temperaturach
pradFFT40=napiecieFFT40./obciazenieT40; 
pradFFT21=napiecieFFT21./obciazenieT21;
pradFFT85=napiecieFFT85./obciazenieT85;

obliczeniaOK=1;
