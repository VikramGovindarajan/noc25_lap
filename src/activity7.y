/* simplest version of calculator */

%{
# include <stdio.h>
%}

/* declare tokens */
%token NUM
%token ADDOP SUBOP MULOP DIVOP ABSOP
%token OP CP
%token EOL EXIT
%left ADDOP SUBOP
%left MULOP DIVOP

%%

calclist: /* nothing */
 | calclist exp EOL { printf("= %d\n> ", $2); }
 
exp:	factor
 | exp ADDOP factor { $$ = $1 + $3; }
 | exp SUBOP factor { $$ = $1 - $3; }
 ;
 
factor:	term
 | factor MULOP term { $$ = $1 * $3; }
 | factor DIVOP term { $$ = $1 / $3; }
 ;
 
term:	NUM { $$ = yylval; }
 | OP exp CP { $$ = $2; }
 ;
 
%%

main (int argc, char **argv) {
	printf("> ");
	yyparse();
}

yyerror(char *s) {
	fprintf(stderr, "error: %s\n", s);
}

