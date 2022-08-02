#include <stdio.h>


/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	int S[1000];
	int L, i, j, min, iloscS, R, pierwszyElement;
	
	//skaner dla L:
	printf("Wczytaj L: "); scanf("%d", &L);
	iloscS = 10*L;
	
	//deklaracje rozmiarow wstepnych tablic:
	
	
	//wczytanie R[0]
	printf("Wczytaj R: "); scanf("%d", &R);
	min = R;
	pierwszyElement = R;
	S[0] = R;
	
	j=1;
	
	if(pierwszyElement>=0)
	{
		do
		{
			printf("Podaj R: "); 
			scanf("%d", &R);
			if(R<min && R>=0)
			{
				S[j]=R;
				if(S[j]==0)
				{
					printf("wymagany znak jest dodatni, a element ciagu ma wartosc zero. Brak dalszych dzialan.");
					break;
				}
				j++;
				
			}
			//else if(R==0)
		
		}
		while(j<iloscS);
		
		do
		{
			printf("Podaj R: "); 
			scanf("%d", &R);
		}
		while(R<0);
	}
	else if(pierwszyElement<0)
	{
		do
		{
			printf("Podaj R: "); 
			scanf("%d", &R);
			if(R<min)
			{
				S[j]=R;
				j++;
			}
		}
		while(j<iloscS);
		
		do
		{
			printf("Podaj R: "); 
			scanf("%d", &R);
		}
		while(R<0);
	}
	
	
	
	return 0;
}
