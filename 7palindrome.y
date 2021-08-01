%{
#include<stdio.h>
#include<string.h>
void yyerror(char *msg);
int flag;
int i;
int k=0;
%}
%union {
char *f;
}
%token <f>STR
%type <f>E
%%
S:E {
flag=0;
k=strlen($1)-1;
/*
if(k%2==0) {
for(i=0;i<k/2;i++)
{
if($1[i]==$1[k-i])
{
}
else
{
flag=1;
}
}
if(flag==1) 
printf("Not palindrome!");
else
printf("Palindrome");
printf("%s \n",$1);
}
else
{
for(i=0;i<k/2;i++)
{
if($1[i]==$1[k-i])
{
}
else
{
flag=1;
}
}
if(flag==1) 
printf("Not palindrome!");
else
printf("Palindrome");
printf("%s \n",$1);
}
}
;
*/
i=0;
while(i<k)
{
if($1[i]==$1[k])
{
}
else
{
flag=1;
}
i++;
k--;
}
if(flag==1)
printf("Not palindrome");
else
printf("Palindrome");
}
;
E:STR {$$=$1;}
;
%%
#include "lex.yy.c"
int main()
{
yyparse();
return 0;
}

