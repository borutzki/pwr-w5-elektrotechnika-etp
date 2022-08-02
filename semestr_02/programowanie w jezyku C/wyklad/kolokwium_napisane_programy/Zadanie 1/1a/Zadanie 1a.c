#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	int C[200], i, j, max, min, warunekOk, iloczyn;
	
	warunekOk=0;
	iloczyn = 1;
	for(;i<2;i++)
	for(i=0;i<=200;i++)
	{
	
		printf("Podaj C[%d]: ", i);
		scanf("%d", &C[i]);
		if(C[i]<i*(i-1))
		{
			printf("Wartosc warunku: %d\n", i*(i-1));
			printf("Warunek jest ok\n");
				if(warunekOk==0)
					{
						min = C[i];
						max = C[i];
					}
				else if(C[i]>max)
					{
						max = C[i];
					}
				else if(C[i]<min)
					{
						min = C[i];
					}
				warunekOk++;
		}
		else 
		{
			printf("Wartosc warunku: %d\n", i*(i-1));
			printf("Warunek nie jest ok\n");
		}
		if(i>4)
		{
			
			iloczyn = C[i]*C[i-1]*C[i-2]*C[i-3]*C[i-4];
			printf("iloczyn: %d\n", iloczyn);
			if(iloczyn>C[i-5]) break;
		}
		
		printf("C[%d] jest rowne: %d\n", i, C[i]);
		printf("Aktualny max jest rowny: %d\n", max);
		printf("Aktualny min jest rowny: %d\n", min);
		printf("Spelniajace warunek: %d\n", warunekOk);
	}
	
	printf("Spelniajace warunek: %d\n", warunekOk);
	printf("Max jest rowny: %d\n", max);
	printf("Min jest rowny: %d\n", min);
	
	
	return 0;
}
