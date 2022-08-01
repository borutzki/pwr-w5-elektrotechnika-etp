function wykresy(funkcjaNapieciaT40,funkcjaNapieciaT21,funkcjaNapieciaT85,pradT40,pradT21,pradT85,mocT40,mocT21,mocT85)

    
    %figure('Name','Przebiegi na czw�rniku'); %okienko wykres�w
    %przedzia� czasu dla wykresu:
    t=0:0.00001:0.10;
    
    %wykresy napi�cia
    subplot(311) %pozycja 1 wykresu napi�cia
    fnapiecieT40=plot(t,funkcjaNapieciaT40,'b'); %ustawienie wykresu
    title('Przebiegi napi��') %tytu� wykresu
    grid %w��czenie siatki
    xlabel('t [s]') %ustalenie etykiet osi
    ylabel('U [V]')

    hold on %umo�lwienie rysowania kolejnego wykresu na tym samym uk�adzie
    fnapiecieT21=plot(t,funkcjaNapieciaT21,'g'); %wykres napi�cia przy T=21
    fnapiecieT85=plot(t,funkcjaNapieciaT85,'r'); %wykres napi�cla przy T=85
    hold off %koniec rysowania

    legend('T=-40^{\circ}C','T=21^{\circ}C','T=85^{\circ}C') %legenda

    %wykresy pr�d�w - analogicznie do napi�cia
    subplot(312)
    fpradT40=plot(t,pradT40,'b');
    title('Przebiegi pr�d�w');
    grid
    xlabel('t [s]')
    ylabel('I [A]')

    hold on
    fpradT21=plot(t,pradT21,'g');
    fpradT85=plot(t,pradT85,'r');
    hold off

    legend('T=-40^{\circ}C','T=21^{\circ}C','T=85^{\circ}C')

    %wykresy mocy - analogicznie jak powy�sze
    subplot(313)
    fmocT40=plot(t,mocT40,'b');
    title('Przebiegi mocy')
    grid
    xlabel('t [s]')
    ylabel('P [W]')

    hold on
    fmocT21=plot(t,mocT21,'g');
    fmocT85=plot(t,mocT85,'r');
    hold off

    legend('T=-40^{\circ}C','T=21^{\circ}C','T=85^{\circ}C') %wy�wietlenie legendy dla poszczeg�lnych kolor�w (wsp�lne)
    
while(1)
    temperaturaWykresu=menu('Wyb�r temperatury pracy uk�adu','-40�C','21�C','85�C','Wszystkie','Powr�t do menu'); %menu z wyborem, kt�re temperatury maja si� wy�wietla�
    switch temperaturaWykresu %obs�uga wy�wietlania wykres�w, zale�nie od ustawiena sprawia �e niekt�re wykresy znikaj�, inne si� pojawiaj�
        case 1 %temperatura -40 - ustawienie widoczno�ci poszczeg�lnych wykres�w
            set(fnapiecieT40,'visible','on')
            set(fpradT40,'visible','on')
            set(fmocT40,'visible','on')
            
            set(fnapiecieT21,'visible','off')
            set(fpradT21,'visible','off')
            set(fmocT21,'visible','off')
            
            set(fnapiecieT85,'visible','off')
            set(fpradT85,'visible','off')
            set(fmocT85,'visible','off')

        case 2 %temperatura 21  - ustawienie widoczno�ci poszczeg�lnych wykres�w       
            set(fnapiecieT40,'visible','off')
            set(fpradT40,'visible','off')
            set(fmocT40,'visible','off')
            
            set(fnapiecieT21,'visible','on')
            set(fpradT21,'visible','on')
            set(fmocT21,'visible','on')
            
            set(fnapiecieT85,'visible','off')
            set(fpradT85,'visible','off')
            set(fmocT85,'visible','off')

        case 3 %temperatura 85  - ustawienie widoczno�ci poszczeg�lnych wykres�w
            set(fnapiecieT40,'visible','off')
            set(fpradT40,'visible','off')
            set(fmocT40,'visible','off')
            
            set(fnapiecieT21,'visible','off')
            set(fpradT21,'visible','off')
            set(fmocT21,'visible','off')
            
            set(fnapiecieT85,'visible','on')
            set(fpradT85,'visible','on')
            set(fmocT85,'visible','on')

        case 4 %wzsytkie - ustawienie widoczno�ci poszczeg�lnych wykres�w
            set(fnapiecieT40,'visible','on')
            set(fpradT40,'visible','on')
            set(fmocT40,'visible','on')
            
            set(fnapiecieT21,'visible','on')
            set(fpradT21,'visible','on')
            set(fmocT21,'visible','on')
            
            set(fnapiecieT85,'visible','on')
            set(fpradT85,'visible','on')
            set(fmocT85,'visible','on')

        case 5 %wyjd� - funkcja wraca do menu g��wnego
            close %zamkni�cie okna
            return %powr�t do menu g��wnego
    end
end
