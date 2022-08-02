#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int m, i, j, indeksy;
	
	printf("podaj m: "); scanf("%d", &m);
	
	int B[m][m];
	
	for(i=0; i<m;i++)
	{
		for(j=0;j<m;j++)
		{
			B[i][j] = 0;
		}
	}
	
	for(i=0; i<m;i++)
	{
		for(j=0;j<m;j++)
		{
			printf("%d  ",B[i][j]);
		}
		printf("\n");
	}
	
	//resetowanie wskaznikow
	indeksy = 1;
	i=0;
	j=0;
	
	//podawanie indeksow
	do
	{
		do{
			printf("podaj numer wiersza: "); scanf("%d", &i);
		}while(i>m || i<=0);
		
		do{
			printf("podaj numer kolumny: "); scanf("%d", &j);
		}while(j>m || j<=0);
		
		printf("podaj wartosc dla elementu B[%d][%d]: ",i,j);
		scanf("%d", &B[i-1][j-1]);
		indeksy++;

	}
	while(indeksy<=5);
		for(i=0; i<m;i++)
	{
		for(j=0;j<m;j++)
		{
			printf("%d  ",B[i][j]);
		}
		printf("\n");
	}
	
	int Zera;
	
	printf("wiersze z samymi zerami: ");
	for(i=0;i<m;i++)
	{
		Zera = 0;
		for(j=0;j<m;j++)
		{
		if(B[i][j]==0)
			{
				Zera++;
			}
		}
		if(Zera==m)
		{
			printf("%d, ",i+1);
		}		
	}
	
	return 0;
}
