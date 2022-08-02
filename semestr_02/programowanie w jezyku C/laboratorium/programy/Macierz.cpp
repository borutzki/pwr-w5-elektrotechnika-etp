#include <iostream>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

void main()
{
	int m, n, i, j, a[i][j]; /*m - liczba wierszy, n - liczba kol, i - nr wiersza, j - nr kolumny*/
	printf("Wprowadz liczbe wierszy: ");
	scanf("%d",&m);
	printf("wprowadz liczbe kolumn: ");
	scanf("%d",&n);
	i=1, j=1;
	while(i<=m)
	{
		while(j<=n)
			{
				printf("Podaj element a[%d,%d]: ",i,j);
				scanf("%d",&a[i][j]);
				j++;
			}
		i++;
		j=1;
	}
	element (i,j);
	system("pause");
	return 0;
}
void element(int i, int j)
{
	int m, n, a[i][j];
	printf("ktory element macierzy wyswietlic?\n");
	printf("podaj i: ");
	scanf("%d",&i);
	printf("\n podaj j: ");
	scanf("%d",&j);
	if(i<=m,j<=n)
	{
		printf("\n wartosc elementu: %d",a[i][j]);
	}
	else
	{
		printf("\n element nie istnieje");
	}
}
