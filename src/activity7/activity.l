/* recognize tokens for the calculator and print them out */

%{
# include "activity.tab.h"
void yyerror(const char *s);

%}

%%

"+"		{ return ADDOP; }
"-"		{ return SUBOP; }
"*"		{ return MULOP; }
"/"		{ return DIVOP; }
"^"		{ return POWER; }
"log10"	{ return LOG10; }
"exit"	{ return EXIT; }
"("		{ return OP; }
")"		{ return CP; }
[0-9]+	{ yylval = atoi(yytext); return NUM; }
[\n]	{ return EOL; }
"//".*
[ \t]	{ /*ignore white space */ }
. {
    char msg[64];
    snprintf(msg, sizeof(msg), "Mystery character '%c'", *yytext);
    yyerror(msg);
}


%%
