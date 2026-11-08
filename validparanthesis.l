
%{
#include "y.tab.h"
%}

%%
"("       return '(';
")"       return ')';
"["       return '[';
"]"       return ']';
"{"       return '{';
"}"       return '}';
[ \t\n]   ;
.         return yytext[0];
%%

int yywrap()
{
    return 1;
}
