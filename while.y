%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token WHILE ID NUM RELOP

%%
stmt:
    WHILE '(' condition ')' '{' assignment '}'
    {
        printf("Valid while loop\n");
    }
    ;

condition:
    ID RELOP ID
    | ID RELOP NUM
    | NUM RELOP ID
    | NUM RELOP NUM
    ;

assignment:
    ID '=' NUM ';'
    | ID '=' ID ';'
    ;

%%

void yyerror(char *s)
{
    printf("Invalid while loop\n");
}

int main()
{
    printf("Enter while loop:\n");
    yyparse();
    return 0;
}
