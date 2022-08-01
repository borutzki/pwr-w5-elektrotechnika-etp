// PROJEKT: Metody numeryczne 
// Kacper Borucki, Robert Leœniak, Kamil Rychcik
// Rok akademicki 2018/19
// Semestr letni

#include <windows.h>
#include <stdio.h>
#include <conio.h> 
#include <stdlib.h> 
#include <string.h>
#include <time.h>
#include <math.h> 
#include "sistlib.h" 
//wybór wzoru do obliczania y
double funkcja(double nrFunkcji,double x)
{
	double y;
	int wzor = nrFunkcji;
	switch(wzor){
		case 1:
			y = x*x*x + x*x + x;
			break;
		case 2:
			y = exp(x);
			break;
		case 3:
			y = sqrt(x*x + 1);
			break;
		default:
			y=1;
			break;
	}
	return y;
}

//metoda prostok¹tów
double calkaProstokat(double granicaGorna,double granicaDolna,double nrFunkcji,double liczbaPrzedzialow)
{
	double wynikProstokat;
	double x, dx;
	int i;
	dx = (granicaGorna-granicaDolna)/liczbaPrzedzialow;
	wynikProstokat=0;
	
	for(i = 1; i<=liczbaPrzedzialow; i++){
		wynikProstokat += funkcja(nrFunkcji,granicaDolna+i*dx);
	}
	wynikProstokat*=dx;
	return wynikProstokat;
}

//metoda trapezów

double calkaTrapez(double granicaGorna,double granicaDolna,double nrFunkcji,double liczbaPrzedzialow)
{
	double wynikTrapez;
	double x, dx, y1, y2;
	int i;
	dx = (granicaGorna-granicaDolna)/liczbaPrzedzialow;
	wynikTrapez=0;
	
	for(i=1;i<=liczbaPrzedzialow;i++){
		wynikTrapez+=funkcja(nrFunkcji,granicaDolna+i*dx);
	}
	wynikTrapez=(wynikTrapez + (funkcja(nrFunkcji,granicaDolna)+(nrFunkcji,granicaGorna))/2)*dx;
	return wynikTrapez;
}

double calkaSimpson(double granicaGorna,double granicaDolna,double nrFunkcji,double liczbaPrzedzialow)
{
	double wynikSimpson, sumaSrodka, x, dx;
	int i;
	wynikSimpson = 0;
	sumaSrodka = 0;
	dx = (granicaGorna-granicaDolna)/liczbaPrzedzialow;
	
	for(i=1; i<=liczbaPrzedzialow; i++)
	{
		x = granicaDolna + i*dx;
		sumaSrodka += funkcja(nrFunkcji, x - dx/2);
		if(i<liczbaPrzedzialow) wynikSimpson+=funkcja(nrFunkcji, x);
	}
	
	wynikSimpson=dx/6 * (funkcja(nrFunkcji,granicaDolna)+funkcja(nrFunkcji,granicaGorna) + 2*wynikSimpson + 4*sumaSrodka);
	return wynikSimpson;
}


int main()
{
/*//////////////////////////////////////////////////////////////////////////////
// INTERFEJS DO OBIEKTOW ZDEFINIOWANYCH W BIBLIOTECE DYNAMICZNEJ "DLL" /////////
////////////////////////////////////////////////////////////////////////////////
///W TYM BLOKU NIE WOLNO MODYFIKOWAC DEFINICJI NAZW TYPOW I FUNKCJI ////////////
//////////////////////////////////////////////////////////////////////////////*/	
HINSTANCE hSistlab = LoadLibrary ("sistlib.dll");
if (hSistlab == NULL) {return 0;} /* sprawdzenie poprawnosci zaladowania biblioteki */
/* ///////////////////////////////////////////////////////////////////////////////////// */
/* ustalenie adresow funkcji w bibliotece "sistlab.dll" */
/* funkcje "Panelu Graficznego" SiSTLab30 */
consleep = (CONSLEEP) GetProcAddress (hSistlab, "ConSleep");
StartSISTLab = (SISTLAB) GetProcAddress (hSistlab, "StartSISTLab");
StopSISTLab = (SISTLAB) GetProcAddress (hSistlab, "StopSISTLab");
UstawMape = (USTMAPE) GetProcAddress (hSistlab, "ansic_UstawMape");
UstawObiekt = (USTOBIEKT) GetProcAddress (hSistlab, "UstawObiekt");
UstawWykres = (USTWYKRES) GetProcAddress (hSistlab, "ansic_UstawWykres");
CzytajObiekt = (CZTOBIEKT) GetProcAddress (hSistlab, "CzytajObiekt");
UstawTekst = (USTTEKST) GetProcAddress (hSistlab, "ansic_UstawTekst");
UstawNapis = (USTNAPIS) GetProcAddress (hSistlab, "ansic_UstawNapis");
ZmienNapis = (ZMENAPIS) GetProcAddress (hSistlab, "ansic_ZmienNapis");
UstawTabele = (USTTABELE) GetProcAddress (hSistlab, "ansic_UstawTabele");
CzytajPozycje = (CZTPOZYCJE) GetProcAddress (hSistlab, "CzytajPozycje");
CzytajSuwak = (CZTSUWAK) GetProcAddress (hSistlab, "CzytajSuwak");
printf("\n"); /* pusty wiersz w celu obnizenia komunikatu specjalnego SiSTLab30 */
/*//////////////////////////////////////////////////////////////////////////////
// KONIEC INTERFEJSU DO OBIEKTOW ZDEFINIOWANYCH W BIBLIOTECE DYNAMICZNEJ "DLL"
//////////////////////////////////////////////////////////////////////////////*/

StartSISTLab();/* uruchomienie "Panelu Graficznego" SiSTLab30 */
consleep(100);
gotoxy(1,23);printf("Dev-C++ 5.1.1: Zakonczenie aplikacji klienta po nacisnieciu 'q'\n");    
/*//////////////////////////////////////////////////////////////////////////////*/

//DEFINICJE
WORD k,j;
DOUBLE zamknij,granicaGorna,granicaDolna,nrFunkcji,prostokaty,trapezy,simpson,liczbaPrzedzialow;
DWORD cspeed;
CHAR znak[4] = {'|','/','-','\\'}; /* uwaga: pierwszy znak \ w '\\' to znak specjany */
CHAR koniec, s1[80],s2[80],s3[80],s4[80],s5[80],s6[80]; 

srand(time(NULL));/* uruchomeinie ziarna generatora liczb pseudolosowych*/
/* przykladowa inicjalizacja zmiennych */
koniec='\0';  

koniec=0;granicaGorna=0.0;granicaDolna=0.0;
/*/////////////////////////////////////////////////////////////////////////////*/
//ustawianie obiektów
UstawObiekt(11,0,1067,625,0,0,0,1,0,0,0);    /* Przycisk "STOP" - zatrzymanie programu */

UstawObiekt(21,2.0,270,495,0,0,0,1,0,0,0);  /* górna granica funkcji */
UstawObiekt(22,1.0,250,605,0,0,0,1,0,0,0); /* dolna granica funkcji */
UstawObiekt(23,1,360,212,0,0,0,1,0,0,0); /* nr funkcji */
UstawObiekt(24,20,665,270,0,0,0,1,0,0,0); /* dok³adnoœæ obliczania*/

/*/////////////////////////////////////////////////////////////////////////////*/

/*START GLOWNEJ PETLI PROGRAMU "WSPOLDZIALAJACEJ" Z PANELEM GRAFICZNYM SISTLAB30*/
while ((koniec != 'q')&&((int)(zamknij) != 1))
{            
//odczyt danych
// zamknij,granicaGorna,granicaDolna,nrFunkcji,calkaProstokat,calkaTrapez,dokladnosc;
CzytajObiekt(21,&granicaGorna);
CzytajObiekt(22,&granicaDolna);
CzytajObiekt(23,&nrFunkcji);
CzytajObiekt(24,&liczbaPrzedzialow); //sprawdzone, dzia³a



//kontrola inputu i outputu
gotoxy(1,12);printf("Kontrola wartosci granicaGorna  %5.5f      ",granicaGorna);
gotoxy(1,13);printf("Kontrola wartosci granicaDolna  %5.5f      ",granicaDolna);
gotoxy(1,14);printf("Kontrola wartosci nrFunkcji  %5.5f      ", nrFunkcji);
gotoxy(1,15);printf("Kontrola wartosci prostokaty  %5.5f      ",prostokaty);
gotoxy(1,16);printf("Kontrola wartosci trapezy  %5.5f      ", trapezy);
gotoxy(1,17);printf("Kontrola wartosci Simpson  %5.5f      ", simpson);

//obliczenia
if((granicaDolna<granicaGorna)&&(nrFunkcji<=4))
{
	prostokaty=calkaProstokat(granicaGorna,granicaDolna,nrFunkcji,liczbaPrzedzialow);
	trapezy=calkaTrapez(granicaGorna,granicaDolna,nrFunkcji,liczbaPrzedzialow);
	simpson=calkaSimpson(granicaGorna,granicaDolna,nrFunkcji,liczbaPrzedzialow);
}

//zamkniecie
CzytajObiekt(11,&zamknij); /* Stop - zakonczenie programu, powrot do edytora*/

strcpy(s1,"  Metoda prostokatow:   ");sprintf(s2,"%0.3lE",prostokaty);strcat(s1,s2);
strcpy(s3,"  Metoda trapezow:       ");sprintf(s4,"%0.3lE",trapezy);strcat(s3,s4);
strcpy(s5,"  Metoda Simpsona:      ");sprintf(s6,"%0.3lE",simpson);strcat(s5,s6);

UstawNapis(1,520,511,350,20,1,0,0,clBlack,clWhite,0,14,s1);
UstawNapis(2,520,551,350,20,1,0,0,clBlack,clWhite,0,14,s3);
UstawNapis(3,520,591,350,20,1,0,0,clBlack,clWhite,0,14,s5);

if (kbhit()) {koniec = getch();} /* po nacisnieciu, odczytanie klawisza */

} /* zakonczenie petli "while {}" */

StopSISTLab(); /* zakonczenie dzialania Panelu Graficznego SiSTLab30 */
consleep(100);
FreeLibrary (hSistlab); /* zwolnienie uchwytu(pamieci) systemowego biblioteki dynamicznej DLL */
return EXIT_SUCCESS; /* zakonczenie procesu konsoli trybu tekstowego */
}
