%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
      expression '\n'
      {
          printf("Result = %d\n", $1);
      }
      ;

expression:
      expression '+' expression { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression { $$ = $1 / $3; }
    | '(' expression ')'        { $$ = $2; }
    | '-' expression %prec UMINUS { $$ = -$2; }
    | NUMBER                     { $$ = $1; }
    ;

%%

int main()
{
    printf("Enter expression: ");
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid expression\n");
    return 0;
}
