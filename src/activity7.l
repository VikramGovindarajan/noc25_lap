%{
	int num, ans = 0;
%}

%%

-?[1-9][0-9]*	{ num = atoi(yytext); }
"+"				{ ans = ans + num; }
[\n]			{ ans = ans + num; printf(">%d\n",ans); ans = 0; }

%%
int main()
{
	yylex();
	return 0;
}
