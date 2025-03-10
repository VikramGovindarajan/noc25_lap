/* recognize tokens for the calculator and print them out */

%{
# include "activity7.tab.h"
%}

%%

"+"		{ return ADDOP; }
"-"		{ return SUBOP; }
"*"		{ return MULOP; }
"/"		{ return DIVOP; }
"("		{ return OP; }
")"		{ return CP; }
[0-9]+	{ yylval = atoi(yytext); return NUM; }
[\n]	{ return EOL; }
"//".*
[ \t]	{ /*ignore white space */ }
.		{ yyerror("Mystery character %c\n", *yytext); }

%%
