%{
void yyerror(char *s);
#include<stdio.h>
%}
%token  ZERO ONE
%%
N:L { printf("\n%d\n",$$); }
L:L B{ $$ = $1*2+$2 ; }
 |B { $$=$1; }
B:ZERO { $$=$1; }
 |ONE { $$=$1; };
%%
#include "lex.yy.c"
int main()
{
while(yyparse());
}
yyerror(char *s)
{
fprintf(stdout,"\n%s\n",s);
}
