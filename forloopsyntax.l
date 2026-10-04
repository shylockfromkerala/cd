%{
#include "y.tab.h"
%}

%%
for             return FOR;
"("             return '(';
")"             return ')';
"{"             return '{';
"}"             return '}';
";"             return ';';
"="             return '=';
"<"             return '<';
"++"            return INC;
[a-zA-Z]        return ID;
[0-9]+          return NUM;
[ \t\n]         ;
.               return yytext[0];
%%

int yywrap()
{
    return 1;
}
