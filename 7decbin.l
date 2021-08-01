%{
extern int yyval;
%}
%%
[0-9]+ {yylval=atoi(yytext);
return ID;
}
\n yyterminate();
%%
int yywrap() {return -1;}

