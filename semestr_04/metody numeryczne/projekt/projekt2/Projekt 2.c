/* Kacper Borucki 245365 Rok akademicki 2018/19 */

/* Program 2 */


#include <conio.h>
#include <stdlib.h>
#include <math.h>
#include<stdio.h>
 

 float eps_f(float floatEps)
 {
 	float x, y;
	
	x=floatEps;
	
	do
		{
			floatEps=floatEps/2.0;
			y=x+floatEps;
		}while(x!=y);
	

    
    return floatEps;
 }
 
 double eps_d(double doubleEps)
 {
 	double x, y;
	
	x=doubleEps;
	
	do
		{
			doubleEps=doubleEps/2.0;
			y=x+doubleEps;
		}while(x!=y);
	

    return doubleEps;
 }
 
 int main()
{	
	printf("Kacper Borucki 245365 Program 2\n\n");

	
	float floatEps;
	double doubleEps;
	
	while (1){
	
		do{
           
			printf("Podaj liczbe rzeczywista x>0 (lub 0 aby zakonczyc program) ");
			scanf("%f", &floatEps);
			if (floatEps == 0){
				return 0;
			}
		} while (floatEps < 0);
	
	int y, t, i, a, p=1;
	
 	doubleEps=floatEps;
 	
 	printf("Zerowanie cyfr ulamkowych od pozycji (t-1): ");
 	scanf("%d",&t);
 	
 	printf("\n\n\nFLOAT\n\n");
 	
 	printf("\nLiczba do konwersji:\t %0.14e\n\n",floatEps);
 	
 	printf("Epsilon maszynowy:\t %0.15g\n\n", eps_f(floatEps));
 	
 	
 	float epsf, mat, z, epsd;
 	int dig, c;
 	c=0;
 	
 	epsf=eps_f(floatEps);
 	z=epsf;
 	
 	while(z<1)
 	{
 		z=z*10;
 		c=c+1;
	}
	
	mat=z;
	
	if(mat<4.5)
		dig=c-1;
		else dig=c-2;
		
	printf("Cyfry poprawne:\t\t %d\n",dig);
	
	/*Przesuwanie przecinka P*/
	for (i = 0; i < t; i++){
		floatEps *= 10.0;
		p *= 10;
	}
	
	/*Czesc ulamkowa*/
	a = floatEps;
	floatEps = a;
	
	/*Przesuwanie przecinka L*/
	floatEps /= p;
	
    /*Wyswietlenie liczby (wszystko)*/
	printf("\nWszystkie cyfry:\t %0.14E ", floatEps);
	y = floatEps;


    /*Wyswietlenie liczby (Poprawne)*/
	printf("\n\nZapis z cyframi poprawnymi:\t %0.*E \n\n\n\n", dig, floatEps);
	
	
	
	
	
	
	/*DOUBLE*/
	
	printf("\n\n\nDOUBLE\n\n");
 	
 	printf("\nLiczba do konwersji:\t %0.14e\n\n",doubleEps);
 	
 	printf("Epsilon maszynowy:\t %0.15g\n\n", eps_d(doubleEps));
 	
 	
 	
 	epsd=eps_d(doubleEps);
 	z=epsd;
 	
 	while(z<1)
 	{
 		z=z*10;
 		c=c+1;
	}
	
	mat=z;
	
	if(mat<4.5)
		dig=c-1;
		else dig=c-2;
		
	printf("Cyfry poprawne:\t\t %d\n",dig);
	
	/*Przesuwanie przecinka P*/
	for (i = 0; i < t; i++){
		doubleEps *= 10.0;
		p *= 10;
	}
	
	/*Czesc ulamkowa*/
	a = doubleEps;
	doubleEps = a;
	
	/*Przesuwanie przecinka L*/
	doubleEps /= p;
	
    /*Wyswietlenie liczby (wszystkio)*/
	printf("\nWszystkie cyfry:\t %0.14E ", doubleEps);
	y = doubleEps;


    /*Wyswietlenie liczby (Poprawne)*/
	printf("\n\nZapis z cyframi poprawnymi:\t %0.*E \n\n\n\n", dig, doubleEps);
	
	
 	
}
}

