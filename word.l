%{
#include <stdio.h>
%}

%%
[a-zA-Z]+    { printf("Word detected: %s\n", yytext); }
[ \t\n]+     ;
.            ;
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
