
%{
#include <stdio.h>
int yylex();
int yyerror(char *s);
%}

%%
S : A 'b'   { printf("Valid String\n"); }
  ;

A : 'a' A
  | 
  ;
%%

int main()
{
    printf("Enter a string: ");
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid String\n");
    return 0;
}
