#include<conio.h>
#include<stdio.h>
void main()
{
 FILE *fp;
 int i=0,result;
 char pass[10],test[10],ch;
 clrscr();
 gotoxy(28,12);
 printf("浜様様様様様様様様様様様融\n");
 gotoxy(28,13);
 printf("�Enter Password:         �\n");
 gotoxy(28,14);
 printf("藩様様様様様様様様様様様夕 \n");
 gotoxy(44,13);
 do
 {
	ch=getch();
	if(ch>='a'&&ch<='z'||ch>='A'&&ch<='Z'||ch>='1'&&ch<='9')
	{
		pass[i++]=ch;
		printf("*");
	}
 }
 while(ch!='\r');
// printf("\b");
 pass[i]=0;
 fp=fopen("e:\\school\\seit\\itlab2\\madhur.txt","r");
 fgets(test,5,fp);
 result = strcmp(pass,test);
 if(result==0)
 printf("\n\n\nGoto next step");
 else
 printf("\n\nincorrect");
 getch();
}

