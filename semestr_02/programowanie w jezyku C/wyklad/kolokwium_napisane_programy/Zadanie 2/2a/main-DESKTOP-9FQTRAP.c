#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	
	int n, m, i, j;
	//n = wiersze, m - kolumny
	do{
		printf("podaj n: "); scanf("%d", &n);
	}while(n<0);
	
	do{
		printf("podaj m: "); scanf("%d", &m);
	}while(m<0);
	
	int A[m][n];
	int B[n][n];
	int C[n][n];
	
	//wprowadzenie macierzy A

	for(i=0;i<=m;i++)
	{
		for(j=0;j<=n;j++)
		{
		printf("podaj element A[%d][%d]: ", i+1,j+1);
		scanf("%d", &A[i][j]);
		}
	}
	
	return 0;
}
