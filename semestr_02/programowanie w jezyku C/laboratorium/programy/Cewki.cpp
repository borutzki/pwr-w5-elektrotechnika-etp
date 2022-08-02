#include <iostream>
#include <math.h>

int main()
{
    int n; 
    float R, L1, L2, L3, X, Z;
	printf("\nPodaj n od 1 do 3: ");
	scanf("%d",&n);
	if(n==1)
	{
		printf("\nPodaj R: ");
		scanf("%f",&R);
		printf("Podaj L1: ");
		scanf("%f",&L1);
		Z=sqrt((R*R)+(L1*L1));
		printf("\n Modul Z=%f\n",Z);
	}
	else if(n==2)
	{

		printf("\nPodaj R: ");
		scanf("%f",&R);
		printf("\nPodaj L1: ");
		scanf("%f",&L1);
		printf("\n Podaj L2: ");
		scanf("%f",&L2);
		X=(L1*L2/(L1+L2));
		Z=sqrt((R*R)+(X*X));
		printf("\n Modul Z=%f\n",Z);
	}
	else if(n==3)
	{

		printf("\nPodaj R: ");
		scanf("%f",&R);
		printf("\n Podaj L1: ");
		scanf("%f",&L1);
		printf("\n Podaj L2: ");
		scanf("%f",&L2);
		printf("\n Podaj L3: ");
		scanf("%f",&L3);
		X=(L1*L2*L3/(L1+L2+L3));
		Z=(R*R)+(X*X);
		printf("\n Z=%f",Z);
		printf("\n Modul Z=%f\n",Z);
	}
system("pause");
return 0;
}
