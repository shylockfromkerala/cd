
%{
#include <stdio.h>
int yylex();
int yyerror(char *s);
%}

%%
S : '(' S ')' S
  | '[' S ']' S
  | '{' S '}' S
  |
  ;
%%

int main()
{
    printf("Enter expression: ");

    if (yyparse() == 0)
        printf("Valid Parentheses\n");
    else
        printf("Invalid Parentheses\n");

    return 0;
}

int yyerror(char *s)
{
    return 0;
}
