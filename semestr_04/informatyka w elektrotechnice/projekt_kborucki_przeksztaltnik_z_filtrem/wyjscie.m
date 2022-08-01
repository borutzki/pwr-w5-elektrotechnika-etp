function [] = wyjscie(alfa,pojemnosc,obciazenie,funkcjaNapieciaT40,funkcjaNapieciaT21,funkcjaNapieciaT85,pradT40,pradT21,pradT85,mocT40,mocT21,mocT85)
%OUTPUT Summary of this function goes here
%   Detailed explanation goes here

zapisDanych=menu('Które dane zapisaæ?','Dane wejœciowe','Wyniki obliczeñ','Wszystko','Powrót'); %menu wyboru - które dane zapisaæ?
switch zapisDanych
    case 1 %zapis danych wejœciowych, na podstawie których przeprowadzone zosta³y obliczenia
        [file,path,indx] = uiputfile('*.mat'); %wybór œcie¿ki pliku
        filename=fullfile(path,file); %nazwa i œcie¿ka pliku do zapisu na podstawie wyboru
        save(filename,'alfa','pojemnosc','obciazenie'); %zapis pliku
        msgbox('Zapisano!'); %potwierdzenie zapisu danych
        
    case 2 %zapis danych wyjœciowych, wynikaj¹cych z funkcji obliczeñ - analogiczna funkcja do powy¿szej, tylko wyprowadza inne dane
        [file,path,indx] = uiputfile('*.mat');
        filename=fullfile(path,file);
        save(filename,'funkcjaNapieciaT40','funkcjaNapieciaT21','funkcjaNapieciaT85','pradT40','pradT21','pradT85','mocT40','mocT21','mocT85');
        msgbox('Zapisano!');

    case 3 %zapis wszystkich danych, które funkcja obs³uguje (wejœciowe + wyjœciowe) - analogiczna funkcja do powy¿szej, tylko wyprowadza inne dane
        [file,path,indx]=uiputfile('*.mat');
        filename=fullfile(path,file);
        save(filename);
        msgbox('Zapisano!');
        
    case 4 %powrót do menu g³ównego
        return
end

