%{
#include <stdio.h>
%}

%token FOR ID NUM INC

%%

statement:
    FOR '(' init ';' condition ';' increment ')' '{' '}'
    {
        printf("Valid for loop\n");
    }
    ;

init:
      ID '=' NUM
    ;

condition:
      ID '<' NUM
    ;

increment:
      ID INC
    ;

%%

int main()
{
    printf("Enter for loop: ");
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid for loop\n");
    return 0;
}
