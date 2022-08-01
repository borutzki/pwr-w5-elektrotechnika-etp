/* 
Metody numeryczne - projekt 4
Kacper Borucki 245365 semestr IV rok akademicki 2018/19
*/
#include <stdio.h> 
#include <stdlib.h>
#include <math.h>
#include<windows.h> 

int main ()
{
	
int q, x, y, z;
float gpotokl, dpotokl, lpotokl, ppotokl;

while(1)
{
	
   
printf("Prosze podac potencjal okladki gornej: ");
scanf("%f",&gpotokl);
printf("Prosze podac potencjal okladki dolnej: ");
scanf("%f",&dpotokl);
printf("Prosze podac potencjal okladki lewej: ");
scanf("%f",&lpotokl);
printf("Prosze podac potencjal okladki prawej: ");
scanf("%f",&ppotokl);

printf("Wprowadz wymiary prostokata WxS\n");
printf("W = ");
scanf("%d",&y);
printf("S = ");
scanf("%d",&q);

float wpotokl[y][q];

for (x=2;x<q;x++)
{ wpotokl[1][x]=gpotokl; }

for (x=2;x<q;x++)
{ wpotokl[y][x]=dpotokl; }

for (x=2;x<y;x++)
{ wpotokl[x][1]=lpotokl; }

for (x=2;x<y;x++)
{ wpotokl[x][q]=ppotokl; }

wpotokl[1][1]=gpotokl+lpotokl;
wpotokl[1][q]=gpotokl+ppotokl;
wpotokl[y][1]=dpotokl+lpotokl;
wpotokl[y][q]=dpotokl+ppotokl;

for(x=2;x<y;x++)
{
for(z=2;z<q;z++)
{ wpotokl[x][z]=(wpotokl[x-1][z]+wpotokl[x][z-1])/2; }

}
int t;
for(t;t<1000;t++)
{
for(x=2;x<y;x++)
{
for(z=2;z<q;z++)
{ wpotokl[x][z]=(wpotokl[x-1][z]+wpotokl[x][z-1]+wpotokl[x+1][z]+wpotokl[x][z+1])/4; }
}
}

float mpotokl=wpotokl[1][1];

for(x=1;x<y+1;x++)
{
for(z=1;z<q+1;z++)
{
if(wpotokl[x][z]>mpotokl)
{ mpotokl=wpotokl[x][z]; }
}
}
float max=4*mpotokl/5;
float pom=3*mpotokl/5;
float mid=2*mpotokl/5;
float nis=mpotokl/5;

WORD normal;
normal=0x0007;

HANDLE ozn; 
ozn=GetStdHandle(STD_OUTPUT_HANDLE); 

printf("Oznaczenia: \n");
SetConsoleTextAttribute(ozn, BACKGROUND_BLUE | BACKGROUND_RED | BACKGROUND_INTENSITY);
printf("Najwyzszy potencjal "); 
SetConsoleTextAttribute(ozn,BACKGROUND_GREEN | BACKGROUND_RED);
printf("Sredni potencjal\n");
SetConsoleTextAttribute(ozn,BACKGROUND_BLUE);
printf("Niski potencjal ");
SetConsoleTextAttribute(ozn, BACKGROUND_GREEN );
printf("Najnizszy potencjal\n");
SetConsoleTextAttribute(ozn,normal);

printf("\n\n");

for(x=1;x<y+1;x++)
{
for(z=1;z<q+1;z++)
{
if(wpotokl[x][z]>=max)
{ SetConsoleTextAttribute(ozn, BACKGROUND_BLUE | BACKGROUND_RED | BACKGROUND_INTENSITY  ); }
		
		
if(wpotokl[x][z]>=mid)
{
if(wpotokl[x][z]<max)
{ SetConsoleTextAttribute(ozn,BACKGROUND_GREEN | BACKGROUND_RED); }
}
				
if(wpotokl[x][z]>=nis)
{
if(wpotokl[x][z]<mid)
{ SetConsoleTextAttribute(ozn,BACKGROUND_BLUE); }
}
		        		
if(wpotokl[x][z]<nis)
{ SetConsoleTextAttribute(ozn, BACKGROUND_GREEN ); }
		
printf("%.2f",wpotokl[x][z]);
	
SetConsoleTextAttribute(ozn,normal);
	
if(wpotokl[x][z]<10)
{
printf("      ");
}
else
{
printf("     ");
}
}
printf("\n\n\n\n\n");
	
}

system("pause");
system("cls");
}
return (0);
}


