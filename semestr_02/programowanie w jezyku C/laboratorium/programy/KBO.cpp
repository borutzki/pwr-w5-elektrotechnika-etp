#include <iostream>
#include <math.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main() /*odbiór energii elektrycznej ga³êzi po³¹czonych ze soba równolegle n kondensatorów*/

{
	int n, a; /*n - liczba kondensatorow*/
	float C[n], X, suma, Z[n];
	printf("\n Podaj liczbe kondensatorow: ");
	scanf("%d", &n);
	if(n<1)
	{
		printf("\n n mniejsze od 1, blad \n");
	}
	else
	{
	a=n;
	n=1;
	while(n<=a)
		{
		printf("\n Podaj pojemnosc kondensatora C[%d]: ",n);
		scanf("%f", &C[n]);
		n++;
		}
	n=1;
	suma=0;
	while(n<=a)
	{
		Z[n]=1/C[n];
		suma=suma+Z[n];
		n++;
	}
	suma=1/suma;
	printf("Suma impedancji: %f \n",suma);
	suma=sqrt(suma);
	printf("Modul impedancji: %f \n",suma);
}


	
	
	system("pause");
	return 0;
	
}
