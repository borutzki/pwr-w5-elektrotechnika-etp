function [alfa,pojemnosc,obciazenie] = wejscie()
%WEJSCIEWYJSCIE okre�lenie wsp. temp. rezyst. na podstawie wybranego materia�u
%   Wyb�r materia�u dla rezystora
% platyna: alfa = 3,9*10^-3
% konstantan: alfa = 2*10^-5
wczytywanieDanych = menu('Wczyta� dane z pliku czy wprowadzi� r�cznie?','Z pliku','R�cznie'); %menu wyboru wprowadzania danych
switch wczytywanieDanych;
    case 1 %wczytywanie danych z pliku
        uiopen('*.mat*'); %funkcja pozwalaj�ca na wyb�r pliku
        if exist('alfa')==1 || exist('pojemnosc')==1 || exist('obciazenie')==1 %sprawdzenie, czy plik zawiera wymagane parametry
            waitfor(msgbox('Wczytano!')); %komunikat
        else
            load('defaults.mat'); %je�eli plik nie zawiera ��danych parametr�w, wczytywany jest plik z danymi domy�lnymi
            errordlg('Plik niekompatybilny. Wczytano dane domy�lne'); 
        end
    case 2 %wczytanie danych z r�ki
        rezystor = menu('Wybierz materia� rezystora:', 'Platyna','Konstantan'); %menu wyboru rezystora
        switch rezystor %prze��cznik - warto�� zale�na od wybranego rezystora
            case 0
                waitfor(warndlg('Nie wybrano materia�u! Wczytano ustawienie domy�lne (platyna)')); %je�li materia� rezystora nie zosta� wybrany, wy�wietla si� komunikat i wcztuj� si� dane domy�lne
                load('defaults.mat','alfa'); %wczytanie danych domy�lnych
            case 1 %platyna
                alfa=3.9*10^-3; %ustawienie alfy
            case 2 %konstantan
                alfa=2*10^-5;
        end

        kondensator = menu('Wybierz pojemno�� kondensatora:', '250uF', '3mF'); % Wyb�r pojemno�ci kondensatora
        switch kondensator %prze��cznik analogiczny do tego w rezystorze
            case 0
                waitfor(warndlg('Nie wybrano pojemno�ci! Wczytano pojemno�� domy�ln� 250uF'));
                load('defaults.mat','pojemnosc');
            case 1
                pojemnosc = 250*10^-6;
            case 2
                pojemnosc = 3*10^-3;
        end
        
        % okreslenie rezystancji obci��enia
        komunikatObc = ('Podaj warto�� rezystancji obci��enia w omach:'); %okienko wprowadzania danych dot. obcia�enia- komunikat
        dlgtitle = 'Obciazenie'; %nazwa okienka
        obciazenieIn = inputdlg(komunikatObc,dlgtitle,1); %funkcja wyswietlaj�ca okienko
        if isempty(obciazenieIn)==0 %je�eli obci��enie jest funkcj� niepust�, wszystko jest ok, 
            obciazenie = str2double(obciazenieIn{1}); %obcia�enie to tak naprawd� macierz po wczytaniu z okienka, ta funkcja przerabia je na warto��
        else
            waitfor(warndlg('Nie podano rezystancji obci��enia! Wczytano dane domy�lne!')); %komunikat je�li dane nie zostan� podane 
            load('defaults.mat','obciazenie'); %wczytanie danych domy�lnych obci�zenia
        end
       
end

