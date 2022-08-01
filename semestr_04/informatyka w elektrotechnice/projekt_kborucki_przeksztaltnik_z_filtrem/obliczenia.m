function [obliczeniaOK funkcjaNapieciaT40 funkcjaNapieciaT21 funkcjaNapieciaT85 pradT40 pradT21 pradT85 mocT40 mocT21 mocT85 napiecieFFT40 napiecieFFT21 napiecieFFT85 pradFFT40 pradFFT21 pradFFT85] = obliczenia(alfa,pojemnosc,obciazenie)
%%sie� zasilaj�ca 50Hz = definicja sta�ych
napiecie=230; %V
Vmax=230*sqrt(2); %v
omega = 2*pi*50;
mocMaksymalna=10000;

%rezystancja obci��enia w r�nych temperaturach
obciazenieT40 = obciazenie*(1+alfa*(-61)); %przeliczenie rezystancji na -40C
obciazenieT21 = obciazenie; 
obciazenieT85 = obciazenie*(1+alfa*(64)); %przeliczenie rezystancji na +85C

%warunek sprawdzaj�cy, czy moc maksymalna jest przekroczona
mocChwilowaMax = Vmax*(Vmax/obciazenieT40); %sprawdzenie maksymalnej mocy chwilowej
if mocChwilowaMax > mocMaksymalna %sprawdzenie ,czy przekroczono moc maksymaln�
    przekroczonaMoc=errordlg('Uwaga! Przekroczono moc maksymaln�. Obliczenia nie zosta�y wykonane. Prosz� zwi�kszy� rezystancj� odbiornika.'); %okienko ostrze�enia o przekroczonej mocy
    disp przekroczonaMoc; %je�li moc jest przekroczona - wszystkie argumenty wyprowadzane z funkcji s� wyzerowane, brak dalszej cz�ci oblicze�
    funkcjaNapieciaT40=0;
    funkcjaNapieciaT21=0;
    funkcjaNapieciaT85=0;
    pradT40=0;
    pradT21=0;
    pradT85=0;
    mocT40=0;
    mocT21=0;
    mocT85=0;
    obliczeniaOK=0; %warto�� zwrotna - obliczenia nie wykonaj� si�, bo program g��wny obs�u�y skrypt
    return
end

%%funkcje do narysowania

t=0:0.00001:0.10; %definicja czasu
T=length(t); % d�ugo�c wektora czasu

%%wykres przebiegu napi�cia

%funkcja dla T=-40
stanDzialania='DiodaOn'; %zale�nie od stanu dzia�ania diody - �r�d�em napi�cia jest zasilanie albo kondensator
for i=1:T
    napiecieSin=Vmax*sin(omega*t); %napi�cie zasilaj�ce
    switch stanDzialania     %zalezno�� funkcji od tego, czy dioda dzia�a, czy nie
        case 'DiodaOn'; %dioda przepuszcza pr�d
            funkcjaNapieciaT40(i)=napiecieSin(i); %funkcja sinusoidalna
            pradRezystancji=napiecieSin(i)/obciazenieT40; %pr�d p�yn�cy w danej chwili przez rezystancj�
            pradKondensatora=omega*pojemnosc*Vmax*cos(omega*t(i)); %pr�d p�yn�cy w danej chwili przez kondensator, i=w*C*Vmax*cos(wt) -> pochodna napi�cia po czasie razy pojemno��
            sumaPradow=pradRezystancji+pradKondensatora; %suma prad�w - je�eli jest mniejsza od 0 (pr�d kondensatora > pr�d rezystora) dioda nie przewodzi
            if sumaPradow <= 0 %je�li pr�dy daj� wynik ujemny, dioda prze��cza si� w stan zaporowy
                stanDzialania='DiodaOff'; %prze��czenie statusu diody
                Ta=t(i); %wyznaczenie sta�ej "t1" przej�cia w roz�adowywanie kondensatora
            end
        case 'DiodaOff'; %je�li dioda jest w stanie zaporowym, funkcja napi�cia jest wyk�adnicza 
            funkcjaNapieciaT40(i)=Vmax*sin(omega*Ta).*exp(-(t(i)-Ta)./(obciazenieT40*pojemnosc)); %funkcja z przebiegu exp
            if napiecieSin(i) >= funkcjaNapieciaT40(i); %je�eli funkcja sinusoidalna ma wi�ksz� warto�� ni� exp, nast�puje powr�t do przebiegu sinusoidalnego
                stanDzialania = 'DiodaOn'; %dioda znowu przewodzi 
            end
    end
end

%funkcja dla T=21, to samo co powy�ej, tylko z uwzgl�dnieniem innego obci��enia
stanDzialania='DiodaOn';
for i=1:T;
    napiecieSin=Vmax*sin(omega*t);
    %zalezno�c funkcji od tego, czy dioda dzia�a, czy nie
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

%funkcja dla T=85 -> jak powy�ej, tylko kolejna warto�� mocy
stanDzialania='DiodaOn';
for i=1:T;
    napiecieSin=Vmax*sin(omega*t);
    %zalezno�c funkcji od tego, czy dioda dzia�a, czy nie
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

%pr�dy
for i=1:T;
    pradT40(i) = funkcjaNapieciaT40(i)/obciazenieT40; %wyznaczenie pr�d�w dla r�nych temperatur na podstawie napi�� i rezystancji przy r�nych temperaturach
    pradT21(i) = funkcjaNapieciaT21(i)/obciazenieT21; 
    pradT85(i) = funkcjaNapieciaT85(i)/obciazenieT85;
end

%moc uk�adu
for i=1:T;
    mocT40(i) = funkcjaNapieciaT40(i)*pradT40(i); %moc dla zadanego okresu czasu - iloczyn pr�du i napi�cia, m�wimy tylko o mocy czynnej
    mocT21(i) = funkcjaNapieciaT21(i)*pradT21(i);
    mocT85(i) = funkcjaNapieciaT85(i)*pradT85(i);
end

% %wst�pne obliczenia dla analizy FFT
Ts=1/1000;      %cz�sto�� pr�bkowania
czasFFT=0:Ts:1-Ts;    %wektor czasu dla analizy FFT

for i=1:1:length(czasFFT) %obliczenie przebiegu napi�cia dola funkcji FFT przy r�nych temperaturach
    napiecieFFT40(i)=funkcjaNapieciaT40(i); %obliczenie dla obci��enia 
    napiecieFFT21(i)=funkcjaNapieciaT21(i);
    napiecieFFT85(i)=funkcjaNapieciaT85(i);
end

%obliczenia pr�d�w dla analizy FFT przy r�nych temperaturach
pradFFT40=napiecieFFT40./obciazenieT40; 
pradFFT21=napiecieFFT21./obciazenieT21;
pradFFT85=napiecieFFT85./obciazenieT85;

obliczeniaOK=1;
