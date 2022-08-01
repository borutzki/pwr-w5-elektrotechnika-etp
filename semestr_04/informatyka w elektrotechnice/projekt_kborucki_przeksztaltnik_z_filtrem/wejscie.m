function [alfa,pojemnosc,obciazenie] = wejscie()
%WEJSCIEWYJSCIE okreœlenie wsp. temp. rezyst. na podstawie wybranego materia³u
%   Wybór materia³u dla rezystora
% platyna: alfa = 3,9*10^-3
% konstantan: alfa = 2*10^-5
wczytywanieDanych = menu('Wczytaæ dane z pliku czy wprowadziæ rêcznie?','Z pliku','Rêcznie'); %menu wyboru wprowadzania danych
switch wczytywanieDanych;
    case 1 %wczytywanie danych z pliku
        uiopen('*.mat*'); %funkcja pozwalaj¹ca na wybór pliku
        if exist('alfa')==1 || exist('pojemnosc')==1 || exist('obciazenie')==1 %sprawdzenie, czy plik zawiera wymagane parametry
            waitfor(msgbox('Wczytano!')); %komunikat
        else
            load('defaults.mat'); %je¿eli plik nie zawiera ¿¹danych parametrów, wczytywany jest plik z danymi domyœlnymi
            errordlg('Plik niekompatybilny. Wczytano dane domyœlne'); 
        end
    case 2 %wczytanie danych z rêki
        rezystor = menu('Wybierz materia³ rezystora:', 'Platyna','Konstantan'); %menu wyboru rezystora
        switch rezystor %prze³¹cznik - wartoœæ zale¿na od wybranego rezystora
            case 0
                waitfor(warndlg('Nie wybrano materia³u! Wczytano ustawienie domyœlne (platyna)')); %jeœli materia³ rezystora nie zosta³ wybrany, wyœwietla siê komunikat i wcztuj¹ siê dane domyœlne
                load('defaults.mat','alfa'); %wczytanie danych domyœlnych
            case 1 %platyna
                alfa=3.9*10^-3; %ustawienie alfy
            case 2 %konstantan
                alfa=2*10^-5;
        end

        kondensator = menu('Wybierz pojemnoœæ kondensatora:', '250uF', '3mF'); % Wybór pojemnoœci kondensatora
        switch kondensator %prze³¹cznik analogiczny do tego w rezystorze
            case 0
                waitfor(warndlg('Nie wybrano pojemnoœci! Wczytano pojemnoœæ domyœln¹ 250uF'));
                load('defaults.mat','pojemnosc');
            case 1
                pojemnosc = 250*10^-6;
            case 2
                pojemnosc = 3*10^-3;
        end
        
        % okreslenie rezystancji obci¹¿enia
        komunikatObc = ('Podaj wartoœæ rezystancji obci¹¿enia w omach:'); %okienko wprowadzania danych dot. obcia¿enia- komunikat
        dlgtitle = 'Obciazenie'; %nazwa okienka
        obciazenieIn = inputdlg(komunikatObc,dlgtitle,1); %funkcja wyswietlaj¹ca okienko
        if isempty(obciazenieIn)==0 %je¿eli obci¹¿enie jest funkcj¹ niepust¹, wszystko jest ok, 
            obciazenie = str2double(obciazenieIn{1}); %obcia¿enie to tak naprawdê macierz po wczytaniu z okienka, ta funkcja przerabia je na wartoœæ
        else
            waitfor(warndlg('Nie podano rezystancji obci¹¿enia! Wczytano dane domyœlne!')); %komunikat jeœli dane nie zostan¹ podane 
            load('defaults.mat','obciazenie'); %wczytanie danych domyœlnych obci¹zenia
        end
       
end

