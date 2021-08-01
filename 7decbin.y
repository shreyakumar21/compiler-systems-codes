%{
void yyerror(char *s);
#include<stdio.h>
int b=0,r,p=1,num;
%}
%token ZERO ONE
%token ID;
%%
S:ID {
num=$1;
while(num>0)
{
r=num%2;
b+=p*r;
p=p*10;
num=num/2;
}
printf("%d",b);
}
;
%%
#include "lex.yy.c"
int main()
{
while(yyparse());
}

