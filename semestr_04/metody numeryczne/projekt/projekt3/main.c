/*
    Kacper Borucki 245365 Semestr IV Rok akademicki 2018/19 
	Projekt 3
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef int(*TF)(int i);
typedef double(*TF2)(int a);


int silnia(int s)
{
	if(s==0||s==1)
	{
		return 1;
	}
	return s*silnia(s-1);	
}

double szereg1(int s1)
{
	if(s1%2==0)
	{
		return ((1)/((2*(double)s1)+1));
	}
	else return ((-1)/((2*(double)s1)+1));
}

double szereg2(int s2)
{	
	if(s2%2==0)
	{
		return ((1)/(double)(silnia(2*s2+1)));
	}
	else return ((-1)/(double)(silnia(2*s2+1)));
}

double szereg3(int s3)
{
	if(s3%2==0)
	{
		return((1)/(double)(silnia(s3)));
	}
	else return((-1)/(double)(silnia(s3)));	
}


double natsum(TF2 funkcja,int n1,int n2)
{
	int z;
	double temp=0;
	for (z=n1;z<=n2;z++)
	{
		temp=temp+funkcja(z);	
	}
	return(temp);
}

double avesum(TF2 funkcja,int n1,int n2,double *pop)
{
	int z,y;
	double u,v,w,suma;
	double s[n2];
	
	for(z=n1;z<=n2;z++)
	{
		s[z]=0;
		u=0;
		v=0;
		*pop=0.0;
		for(y=n1;y<=z;y++)
		{
			w=funkcja(y);
			u=v+w;
			*pop=v-u+w+*pop;
			v=u;
		}
		s[z]=u+*pop;
	}
	for(y=(n2-1);y>=n1;y--)
	{
		for(z=n1;z<=n2;z++)
		{
			s[z]=(s[z+1]+s[z])/2;
		}
	}
	suma=s[n1];
	return(suma);
}
int main() 
	{	
		int wybrane=1;
		int d,g,G;
		d=0;
		double poprawka;
		//const int N[6]={5,10,15,20,25,30};
		while(wybrane!=0)
		{	
			system("cls");
			printf("Prosze wybrac szereg: \n");
			printf("0 - Konczy program\n");
			printf("1. arctan(1.0): a(i)=(-1)^i/(2.0*i+1.0)\n");
			printf("2. sin(1.0): a(i)=(-1)^i/(2.0*i+1.0)!\n");
			printf("3. 1.0/e: a(i)=(-1)^i/i!\n");
			printf("\n");
			scanf("%d",&wybrane);
			
			printf("Podaj gorna granice:\n");
			scanf("%d",&G);
			switch(wybrane)
			{
				case 1: 
				{
					printf("\nSZEREG a(i)=(-1)^i/(2.0*i+1.0)\n ");
					printf("\n  N      NATSUM       AVESUM         POPRAWKA (G-M)    DOKLADNA WARTOSC\n");
					for(g=0;g<G;g++)
					{					
						printf("%3d   %+.8f    %+.8f        %+.3e        %+.8f\n",g,natsum(szereg1,d,g),avesum(szereg1,d,g,&poprawka),poprawka,atan(1.0));
					}	
					system("PAUSE");
					break;
				}
				case 2: 
				{  
					printf("\nSZEREG a(i)=(-1)^i/(2.0*i+1.0)!\n ");
					printf("\n  N      NATSUM       AVESUM         POPRAWKA (G-M)    DOKLADNA WARTOSC\n");
					for(g=0;g<G;g++)
					{								
						printf("%3d   %+.8f    %+.8f        %+.3e        %+.8f\n",g,natsum(szereg2,d,g),avesum(szereg2,d,g,&poprawka),poprawka,sin(1.0));
					}
					system("PAUSE");
					break;
				}
				case 3: 
				{  
					printf("\nSZEREG a(i)=(-1)^i/i!\n ");
					printf("\n  N      NATSUM       AVESUM         POPRAWKA (G-M)    DOKLADNA WARTOSC\n");
					for(g=0;g<G;g++)
					{					
						printf("%3d   %+.8f    %+.8f        %+.3e        %+.8f\n",g,natsum(szereg3,d,g),avesum(szereg3,d,g,&poprawka),poprawka,(1.0/M_E));
					}
					system("PAUSE");
					break;
				}
				detault: break;
			}
		}
		return 0;
	}

