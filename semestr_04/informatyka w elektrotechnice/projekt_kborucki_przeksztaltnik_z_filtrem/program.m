%Prostownik jednopo³ówkowy z wyg³adzaniem napiêcia
%Kacper Borucki 245365
%Semestr letni 2018/19

programUruchomiony=1; %warunek dzia³ania programu
while(programUruchomiony==1); %petla g³ówna programu
funkcja = menu('Menu g³ówne','Wprowadzanie danych','Obliczenia','Wykresy','Analiza FFT','Zapis danych','Wyjœcie'); %menu dla funkcji
switch funkcja
    case 1 %wywolanie fukncji wejscia;         
         [alfa,pojemnosc,obciazenie]=wejscie();
    
    case 2 %funkcja obliczeniowa            
        if (exist('alfa') == 0) || (exist('obciazenie')==0) || (exist('pojemnosc')==0) %je¿eli brakuje danych z funkcji wywo³ywania, program wczytuje parametry domyœlne)
            load('defaults.mat') %wczytanie danych domyœlnych
            wczytanoDomyslne=warndlg('Uwaga! Wczytano dane domyœlne - materia³: platyna; pojemnoœæ: 250uF; obci¹¿enie: 100 Omów'); %komunikat o wczytaniu danych domyœlnych
        end
        
        %wywolanie funkcji obliczen
        [obliczeniaOK,funkcjaNapieciaT40,funkcjaNapieciaT21,funkcjaNapieciaT85,pradT40,pradT21,pradT85,mocT40,mocT21,mocT85,napiecieFFT40,napiecieFFT21,napiecieFFT85,pradFFT40,pradFFT21,pradFFT85] = obliczenia(alfa,pojemnosc,obciazenie);
        
    case 3 %rysowanie wykresów - o ile wykonane s¹ prawid³owe obliczenia
        if exist('obliczeniaOK')==0 || obliczeniaOK==0 %sprawdza, czy funkcja obliczeniowa zwróci³a parametr opliczeniaOK=1, jeœli nie - wykresy nie zadzia³aj¹, bo nie ma obliczeñ
            brakObliczen=errordlg('Uwaga! Brak prawid³owych obliczeñ dla wykresów!'); %komunikat
        elseif obliczeniaOK==1 %parametr istnieje, wiêc funkcja wykresów siê wyœwietli
            wykresy(funkcjaNapieciaT40,funkcjaNapieciaT21,funkcjaNapieciaT85,pradT40,pradT21,pradT85,mocT40,mocT21,mocT85);
        end
        
    case 4 %wywo³anie funkcji do analizy FFT
        analiza(napiecieFFT40,napiecieFFT21,napiecieFFT85,pradFFT40,pradFFT21,pradFFT85); 
        
    case 5 %funkcja zapisywania danych
        wyjscie(alfa,pojemnosc,obciazenie,funkcjaNapieciaT40,funkcjaNapieciaT21,funkcjaNapieciaT85,pradT40,pradT21,pradT85,mocT40,mocT21,mocT85);

    case 6 %wy³¹czanie programu
        programUruchomiony=0; %przerwanie pêtli g³ównej
end
end