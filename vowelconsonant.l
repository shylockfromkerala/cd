%{
#include <stdio.h>
%}

%%
[aeiouAEIOU]    { printf("Vowel: %s\n", yytext); }
[a-zA-Z]        { printf("Consonant: %s\n", yytext); }
[ \t\n]+        ;
.               ;
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
