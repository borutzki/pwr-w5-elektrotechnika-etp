#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

long int obliczanieD(int m, int n)
{
	long int i, j, nsilnia, msilnia, nmsilnia, wynik;
	
	j=n-m;
	
	nsilnia = 1; msilnia = 1; nmsilnia = 1;
	
	for(i=1; i<=n; i++)
	{
		nsilnia = nsilnia*i;
	}
	
	for(i=1; i<=m; i++)
	{
		msilnia = msilnia*i;
	}
	
	for(i=1; i<=j; i++)
	{
		nmsilnia = nmsilnia*i;
	}
	
	wynik = nsilnia/(msilnia*nmsilnia);
	
	return wynik;
}

int main(int argc, char *argv[]) {
	
	int n, m, D;
	
	do
	{
		printf("Podaj n>10: ");
		scanf("%d", &n);
	}while(n<=10);
	
	
	//printf("Podaj m: ");
	//scanf("%d", &n);
	
	printf("D0 = brak wartosci (dziel przez 0)\n");
	
	for(m=1;m<=n;m++)
	{
		D = obliczanieD(m, n);
		printf("D%d = %d\n", m, D);
	}
	
	return 0;
}
