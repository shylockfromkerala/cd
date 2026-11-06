%{
#include <stdio.h>
%}

%%
[0-9]+    { printf("Number detected: %s\n", yytext); }
.         ;
\n        ;
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
