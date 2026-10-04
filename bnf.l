%{
#include "y.tab.h"
#include <string.h>
%}

%%
[a-zA-Z]    {
                yylval.str = strdup(yytext);
                return ID;
            }

[+]         return '+';
[*]         return '*';
[(]         return '(';
[)]         return ')';
[ \t\n]     ;
.           return yytext[0];
%%

int yywrap()
{
    return 1;
}
