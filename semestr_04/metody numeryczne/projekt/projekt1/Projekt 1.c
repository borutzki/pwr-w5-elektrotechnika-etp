/*
Kacper Borucki 245365 Semestr IV Rok akademicki 2018/19
Projekt 1
*/

#include <stdio.h>
#include <stdlib.h>

int main() 
{	

	printf("\n {Projekt 1}\n");

while(1)
{
	
	float rzeczywista,ulamek,x;
	int calkowite;
	int e,c,bias; /*e-cecha przesunieta; c-cecha; bias*/
	int d, be, tm, ls; /*d-dlugosc slowa; be-bity cechy przesunietej; tm-bity czesci ulamkowej mantysy; ls-znak liczby*/
	int i,j,k,l;
	int  m; /*mantysa*/
	int t=0;		
	char tablica1[64],tablica2[64],tablica3[64];		 			
		
	//Pytanie o liczbe rzeczywista
	printf("\n");
	printf("Liczba rzeczywista do konwersji: ");
	scanf("%f",&x);
	
	//Okreœlenie znaku liczby (ls)
	if(x>=0)
	{
		ls=0;
	}
	else
	{
		ls=1; // jeœli 1 to liczba ujemna

	}
	//printf("\nZnak liczby: ls=%d",ls);
	
	//Wprowadzenie szerokoœci s³owa maszynowego i liczby bitów przewidzian¹ na mantyse
	printf("Podaj szerokosc slowa maszynowego (d): ");
	scanf("%d",&d);
	printf("Podaj Liczbe bitow dla mantysy: ");
	scanf("%d",&tm);

	//Obliczenie biasu i bitów cechy przesuniêtej
	printf("\n");
	be=d-tm-ls;

	float liczba;
	int wykladnik;
	liczba=1;
	wykladnik=be-1;
	for(i=0;i<wykladnik;i++)
		{
			liczba=2*liczba; //wynik z 2^(b-1)
		}
	bias=liczba-1;
	printf("Przesuniecie bias=%d\n",bias);
	printf("Liczba bitow dla cechy przesunietej e: be=%d\n",be); //liczba bitow dla cechy przesunietej e

	//Konwersja liczby calkowitej na binarna
	printf("\n");
	printf("Czesc calkowita z liczby rzeczywistej: ");
		
	if(x<0)
		rzeczywista=x*(-1);
	else
		rzeczywista=x;
		
	calkowite=rzeczywista;
    if(calkowite==0)
		tablica2[t]=0;
	else
		while(1)
			{
				if(calkowite==1)
					{
						tablica2[t]=1;
						break;
					}
			k=calkowite%2;	
				if(k==1)
				tablica2[t]=1;
				else
				tablica2[t]=0;		
				t++;
			calkowite=calkowite/2;
			}
	i=0;
	for(j=t;j>=0;j--)
		{	
			tablica1[i]=tablica2[j];
			printf("%d", tablica1[i]);
			i++;
		}
	printf("\n");
	
	//Konwersja liczby ulamkowej na binarna
	printf("Czesc niecalkowita z liczby rzeczywistej: ");
	
	if(x<0)
		rzeczywista=x*(-1);
	else
		rzeczywista=x;
		
	calkowite=rzeczywista;
	ulamek=rzeczywista-calkowite;
	i=0;
    do
		{
			{
				ulamek=ulamek*2;
				if (ulamek>=1)
					{
						tablica2[i]=1;
						ulamek--;
					}
				else
						tablica2[i]=0;
			}
		i++;
		}
	while(ulamek>0);
	calkowite=0;	
	for(j=0;j<i;j++)
		{	
			printf("%d",tablica2[j]);
		}
	printf("\n");
	
	//Wypisanie calkowitej oraz ulamkowej
	printf("\n");
	printf("Liczba rzeczywista w ukladzie pozycyjnym o podstawie 2: ");
	if(x<0)
		printf("-");
	for(j=0;j<t+1;j++)
		{
			tablica3[j]=tablica1[j];
			printf("%d",tablica3[j]);
		}
	printf(".");
	for(l=0;l<i;l++)
		{
			tablica3[j]=tablica2[l];
			printf("%d",tablica3[j]);
			j++;
		}
	printf("\n");
	
	//Przesuniecie przecinka
	i=0;
	m=j;
	c=-1;
	for(j=0;j<t+1;j++)
		{
			c++;
		}	
	printf("\n");
	
	//Mantysa z zerami
	printf("m=");
	for(i=1;i<m/*bias+2*/;i++)
		{
			if (tm>=i)
				printf("%d",tablica3[i]);
			else
				printf("0");		
		}
	printf("\n");
	
	//Przesuniecie i zmiana na binarny
	e=c+bias;
	i=0;
	while(1)
		{
			if (e==1)
			{
				tablica2[i]=1;
				break;
			}	
		j=e%2;	
		if (j==1)
			{
				tablica2[i]=1;
			}
		else
			{
				tablica2[i]=0;
			}
		i++;
		e=e/2;
		}
	

	t=0;
	for(j=i;j+1>0;j--)
		{
			tablica1[t]=tablica2[j];
			printf("%d",tablica1[t]);
			t++;
		}
	
	printf("\n");
	
	printf("Format koncowy prezentowany w formacie IEE-754: ");
	printf("ls");
	printf(" ");
	for(i=0;i<t;i++)
	printf("e");
	printf(" ");

	for(i=0;i<tm/*c+be*/;i++)
		printf("m");

	printf("\n");	
		
	printf("%d",ls);
	printf(" ");
	for(i=0;i<t;i++)
		printf("%d",tablica1[i]);
	printf(" ");
	for(i=1/*1*/;i<tm/*c+bias+1*/;i++)
	{
		if (m>=i)
			printf("%d",tablica3[i]);
		else
			printf("0");
	}
	printf("\n");
	}
	return 0;
}

