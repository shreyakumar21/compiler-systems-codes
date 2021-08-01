%{
	#include<stdio.h>
	
%}
%token ID
%%
S : E{printf(" = %d\n",top());}
E : E E'+'{push(pop() + pop());}
|E E'-'{int item = pop(); push(pop()-item);}
|E E'*'{push(pop()*pop());}
|E E'/'{int temp = pop(); push(pop()/temp);}
|ID {push(yylval);}
;
%%

#include"lex.yy.c"

int st[100];
int i = 0;
void push(int val)
{
	st[i++] = val;
}
int pop()
{
	return st[--i];
}
int top()
{
	return st[i-1];
}
int main()
{
yyparse();
return 0;
}

