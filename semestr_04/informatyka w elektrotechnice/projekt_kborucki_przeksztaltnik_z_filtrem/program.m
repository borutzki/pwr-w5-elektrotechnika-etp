%Prostownik jednopo��wkowy z wyg�adzaniem napi�cia
%Kacper Borucki 245365
%Semestr letni 2018/19

programUruchomiony=1; %warunek dzia�ania programu
while(programUruchomiony==1); %petla g��wna programu
funkcja = menu('Menu g��wne','Wprowadzanie danych','Obliczenia','Wykresy','Analiza FFT','Zapis danych','Wyj�cie'); %menu dla funkcji
switch funkcja
    case 1 %wywolanie fukncji wejscia;         
         [alfa,pojemnosc,obciazenie]=wejscie();
    
    case 2 %funkcja obliczeniowa            
        if (exist('alfa') == 0) || (exist('obciazenie')==0) || (exist('pojemnosc')==0) %je�eli brakuje danych z funkcji wywo�ywania, program wczytuje parametry domy�lne)
            load('defaults.mat') %wczytanie danych domy�lnych
            wczytanoDomyslne=warndlg('Uwaga! Wczytano dane domy�lne - materia�: platyna; pojemno��: 250uF; obci��enie: 100 Om�w'); %komunikat o wczytaniu danych domy�lnych
        end
        
        %wywolanie funkcji obliczen
        [obliczeniaOK,funkcjaNapieciaT40,funkcjaNapieciaT21,funkcjaNapieciaT85,pradT40,pradT21,pradT85,mocT40,mocT21,mocT85,napiecieFFT40,napiecieFFT21,napiecieFFT85,pradFFT40,pradFFT21,pradFFT85] = obliczenia(alfa,pojemnosc,obciazenie);
        
    case 3 %rysowanie wykres�w - o ile wykonane s� prawid�owe obliczenia
        if exist('obliczeniaOK')==0 || obliczeniaOK==0 %sprawdza, czy funkcja obliczeniowa zwr�ci�a parametr opliczeniaOK=1, je�li nie - wykresy nie zadzia�aj�, bo nie ma oblicze�
            brakObliczen=errordlg('Uwaga! Brak prawid�owych oblicze� dla wykres�w!'); %komunikat
        elseif obliczeniaOK==1 %parametr istnieje, wi�c funkcja wykres�w si� wy�wietli
            wykresy(funkcjaNapieciaT40,funkcjaNapieciaT21,funkcjaNapieciaT85,pradT40,pradT21,pradT85,mocT40,mocT21,mocT85);
        end
        
    case 4 %wywo�anie funkcji do analizy FFT
        analiza(napiecieFFT40,napiecieFFT21,napiecieFFT85,pradFFT40,pradFFT21,pradFFT85); 
        
    case 5 %funkcja zapisywania danych
        wyjscie(alfa,pojemnosc,obciazenie,funkcjaNapieciaT40,funkcjaNapieciaT21,funkcjaNapieciaT85,pradT40,pradT21,pradT85,mocT40,mocT21,mocT85);

    case 6 %wy��czanie programu
        programUruchomiony=0; %przerwanie p�tli g��wnej
end
end