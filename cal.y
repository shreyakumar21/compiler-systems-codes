%{
#include<stdio.h>
int res = 0;
%}
%token ID
%left '+''-'
%left '*''/''%'
%left '('')'
%%
stmt:expr{res=$$;};
expr:expr '+' expr{$$=$1+$3;}
	|expr '-' expr{$$=$1-$3;}
	|expr '%' expr{$$=$1%$3;}
	|expr '*' expr{$$=$1*$3;}
	|'(' expr ')'	{$$=$2;}
	|expr '/' expr{if($3==0)return 0;$$=$1/$3;}
	|ID
	;
%%

#include "lex.yy.c"
int main()
{
	printf("Enter infix expression\n");
	yyparse();
	printf("Result is %d\n", res);
	return 0;
}

	
