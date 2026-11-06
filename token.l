%{
#include <stdio.h>
%}

%%
[a-zA-Z]+           { printf("Word detected\n"); }
[0-9]+              { printf("Number detected\n"); }
[^a-zA-Z0-9 \t\n]   { printf("Special character\n"); }
[ \t\n]+            ;
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter input: ");
    yylex();
    return 0;
}
