#include <iostream>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main()
 {
 	int n, i, I, a[i];
 	printf("wprowadz n: ");
 	scanf("%d",&n);
 	i=1, I=1;
 	while(i<=n)
 		{
 			printf("wprowadz a[%d]: ",i);
 			scanf("%d",&a[i]);
			I=a[i]*I;
 			i++;
		 }
	printf("Iloraz: %d",I);
 	printf("\n");
 	system("pause");
 	return 0;
}
