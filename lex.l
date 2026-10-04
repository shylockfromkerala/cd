```lex
%{
#include <stdio.h>
%}

%%
.*deva.*      { printf("Invalid\n"); }
.*           { printf("Valid\n"); }
\n           ;
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter string: ");
    yylex();
    return 0;
}
```
