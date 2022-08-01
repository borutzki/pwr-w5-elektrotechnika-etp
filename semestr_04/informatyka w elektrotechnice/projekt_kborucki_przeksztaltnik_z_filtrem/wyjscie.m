function [] = wyjscie(alfa,pojemnosc,obciazenie,funkcjaNapieciaT40,funkcjaNapieciaT21,funkcjaNapieciaT85,pradT40,pradT21,pradT85,mocT40,mocT21,mocT85)
%OUTPUT Summary of this function goes here
%   Detailed explanation goes here

zapisDanych=menu('Kt�re dane zapisa�?','Dane wej�ciowe','Wyniki oblicze�','Wszystko','Powr�t'); %menu wyboru - kt�re dane zapisa�?
switch zapisDanych
    case 1 %zapis danych wej�ciowych, na podstawie kt�rych przeprowadzone zosta�y obliczenia
        [file,path,indx] = uiputfile('*.mat'); %wyb�r �cie�ki pliku
        filename=fullfile(path,file); %nazwa i �cie�ka pliku do zapisu na podstawie wyboru
        save(filename,'alfa','pojemnosc','obciazenie'); %zapis pliku
        msgbox('Zapisano!'); %potwierdzenie zapisu danych
        
    case 2 %zapis danych wyj�ciowych, wynikaj�cych z funkcji oblicze� - analogiczna funkcja do powy�szej, tylko wyprowadza inne dane
        [file,path,indx] = uiputfile('*.mat');
        filename=fullfile(path,file);
        save(filename,'funkcjaNapieciaT40','funkcjaNapieciaT21','funkcjaNapieciaT85','pradT40','pradT21','pradT85','mocT40','mocT21','mocT85');
        msgbox('Zapisano!');

    case 3 %zapis wszystkich danych, kt�re funkcja obs�uguje (wej�ciowe + wyj�ciowe) - analogiczna funkcja do powy�szej, tylko wyprowadza inne dane
        [file,path,indx]=uiputfile('*.mat');
        filename=fullfile(path,file);
        save(filename);
        msgbox('Zapisano!');
        
    case 4 %powr�t do menu g��wnego
        return
end

