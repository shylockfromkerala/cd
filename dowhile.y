%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token DO WHILE ID NUM RELOP

%%
stmt:
    DO '{' assignment '}' WHILE '(' condition ')' ';'
    {
        printf("Valid do-while loop\n");
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
    printf("Invalid do-while loop\n");
}

int main()
{
    printf("Enter do-while loop:\n");
    yyparse();
    return 0;
}
