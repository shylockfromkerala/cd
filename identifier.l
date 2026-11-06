%{
#include <stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*    { printf("Valid identifier\n"); }
[0-9][a-zA-Z0-9_]*        { printf("Invalid identifier\n"); }
[ \t\n]+                  ;
.                         { printf("Invalid character\n"); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter identifier: ");
    yylex();
    return 0;
}
