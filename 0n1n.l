
%{
#include <stdio.h>
int zeros = 0, ones = 0;
%}

%%
0       { zeros++; }
1       { ones++; }
\n      {
            if (zeros > 0 && zeros == ones)
                printf("Valid String\n");
            else
                printf("Invalid String\n");

            zeros = 0;
            ones = 0;
        }
.       { printf("Invalid Character\n"); }
%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
