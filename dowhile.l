%{
#include "y.tab.h"
%}

%%
"do"            { return DO; }
"while"         { return WHILE; }
"("             { return '('; }
")"             { return ')'; }
"{"             { return '{'; }
"}"             { return '}'; }
";"             { return ';'; }
"<="|">="|"=="|"!="|"<"|">"  { return RELOP; }
"="             { return '='; }
[0-9]+          { return NUM; }
[a-zA-Z][a-zA-Z0-9]*  { return ID; }
[ \t\n]+        ;
.               { return yytext[0]; }
%%

int yywrap()
{
    return 1;
}
