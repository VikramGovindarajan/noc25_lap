/* simplest version of calculator */

%{
# include <stdio.h>
# include <math.h>
%}

/* declare tokens */
%token NUM
%token ADDOP SUBOP MULOP DIVOP ABSOP POWER LOG10
%token OP CP
%token EOL EXIT
%left ADDOP SUBOP
%left MULOP DIVOP
%right POWER
%left LOG10

%%

calclist: /* nothing */
 | calclist exp EOL { printf("= %d\n> ", $2); }
 | calclist EXIT { printf("exiting\n"); exit(0); }
 
exp: factor
 | exp ADDOP factor { $$ = $1 + $3; }
 | exp SUBOP factor { $$ = $1 - $3; }
 ;
 
factor: term
 | factor MULOP term { $$ = $1 * $3; }
 | factor DIVOP term { $$ = $1 / $3; }
 ;

term: base 
 | base POWER term { $$ = pow($1,$3); }
 ;

base: NUM { $$ = yylval; }
 | OP exp CP { $$ = $2; }
 | LOG10 OP exp CP { $$ = log10($3); }
 ;
 
%%

main (int argc, char **argv) {
	printf("> ");
	yyparse();
}

yyerror(char *s) {
	fprintf(stderr, "error: %s\n", s);
}

