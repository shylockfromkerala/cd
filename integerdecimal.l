%{
#include <stdio.h>
%}

%%
[0-9]+\.[0-9]+    { printf("Decimal number: %s\n", yytext); }
[0-9]+            { printf("Integer: %s\n", yytext); }
[ \t\n]+          ;
.                 ;
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
