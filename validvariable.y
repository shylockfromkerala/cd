%{
#include <stdio.h>
%}

%token VALID INVALID

%%

input:
      VALID    { printf("Valid variable\n"); }
    | INVALID  { printf("Invalid variable\n"); }
    ;

%%

int main()
{
    printf("Enter variable: ");
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid variable\n");
    return 0;
}
