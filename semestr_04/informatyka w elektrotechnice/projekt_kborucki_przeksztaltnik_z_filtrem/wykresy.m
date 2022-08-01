function wykresy(funkcjaNapieciaT40,funkcjaNapieciaT21,funkcjaNapieciaT85,pradT40,pradT21,pradT85,mocT40,mocT21,mocT85)

    
    %figure('Name','Przebiegi na czwórniku'); %okienko wykresów
    %przedzia³ czasu dla wykresu:
    t=0:0.00001:0.10;
    
    %wykresy napiêcia
    subplot(311) %pozycja 1 wykresu napiêcia
    fnapiecieT40=plot(t,funkcjaNapieciaT40,'b'); %ustawienie wykresu
    title('Przebiegi napiêæ') %tytu³ wykresu
    grid %w³¹czenie siatki
    xlabel('t [s]') %ustalenie etykiet osi
    ylabel('U [V]')

    hold on %umo¿lwienie rysowania kolejnego wykresu na tym samym uk³adzie
    fnapiecieT21=plot(t,funkcjaNapieciaT21,'g'); %wykres napiêcia przy T=21
    fnapiecieT85=plot(t,funkcjaNapieciaT85,'r'); %wykres napiêcla przy T=85
    hold off %koniec rysowania

    legend('T=-40^{\circ}C','T=21^{\circ}C','T=85^{\circ}C') %legenda

    %wykresy pr¹dów - analogicznie do napiêcia
    subplot(312)
    fpradT40=plot(t,pradT40,'b');
    title('Przebiegi pr¹dów');
    grid
    xlabel('t [s]')
    ylabel('I [A]')

    hold on
    fpradT21=plot(t,pradT21,'g');
    fpradT85=plot(t,pradT85,'r');
    hold off

    legend('T=-40^{\circ}C','T=21^{\circ}C','T=85^{\circ}C')

    %wykresy mocy - analogicznie jak powy¿sze
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

    legend('T=-40^{\circ}C','T=21^{\circ}C','T=85^{\circ}C') %wyœwietlenie legendy dla poszczególnych kolorów (wspólne)
    
while(1)
    temperaturaWykresu=menu('Wybór temperatury pracy uk³adu','-40°C','21°C','85°C','Wszystkie','Powrót do menu'); %menu z wyborem, które temperatury maja siê wyœwietlaæ
    switch temperaturaWykresu %obs³uga wyœwietlania wykresów, zale¿nie od ustawiena sprawia ¿e niektóre wykresy znikaj¹, inne siê pojawiaj¹
        case 1 %temperatura -40 - ustawienie widocznoœci poszczególnych wykresów
            set(fnapiecieT40,'visible','on')
            set(fpradT40,'visible','on')
            set(fmocT40,'visible','on')
            
            set(fnapiecieT21,'visible','off')
            set(fpradT21,'visible','off')
            set(fmocT21,'visible','off')
            
            set(fnapiecieT85,'visible','off')
            set(fpradT85,'visible','off')
            set(fmocT85,'visible','off')

        case 2 %temperatura 21  - ustawienie widocznoœci poszczególnych wykresów       
            set(fnapiecieT40,'visible','off')
            set(fpradT40,'visible','off')
            set(fmocT40,'visible','off')
            
            set(fnapiecieT21,'visible','on')
            set(fpradT21,'visible','on')
            set(fmocT21,'visible','on')
            
            set(fnapiecieT85,'visible','off')
            set(fpradT85,'visible','off')
            set(fmocT85,'visible','off')

        case 3 %temperatura 85  - ustawienie widocznoœci poszczególnych wykresów
            set(fnapiecieT40,'visible','off')
            set(fpradT40,'visible','off')
            set(fmocT40,'visible','off')
            
            set(fnapiecieT21,'visible','off')
            set(fpradT21,'visible','off')
            set(fmocT21,'visible','off')
            
            set(fnapiecieT85,'visible','on')
            set(fpradT85,'visible','on')
            set(fmocT85,'visible','on')

        case 4 %wzsytkie - ustawienie widocznoœci poszczególnych wykresów
            set(fnapiecieT40,'visible','on')
            set(fpradT40,'visible','on')
            set(fmocT40,'visible','on')
            
            set(fnapiecieT21,'visible','on')
            set(fpradT21,'visible','on')
            set(fmocT21,'visible','on')
            
            set(fnapiecieT85,'visible','on')
            set(fpradT85,'visible','on')
            set(fmocT85,'visible','on')

        case 5 %wyjdŸ - funkcja wraca do menu g³ównego
            close %zamkniêcie okna
            return %powrót do menu g³ównego
    end
end
