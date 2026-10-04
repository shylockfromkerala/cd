#include <stdio.h>
#include <string.h>

char stack[50];
int top = -1;

char precedence[6][6] =
{
    /*    +    *    (    )    i    $ */
    /* + */ {'>','<','<','>','<','>'},
    /* * */ {'>','>','<','>','<','>'},
    /* ( */ {'<','<','<','=','<',' '},
    /* ) */ {'>','>',' ','>',' ','>'},
    /* i */ {'>','>',' ','>',' ','>'},
    /* $ */ {'<','<','<',' ','<','='}
};

int indexOf(char c)
{
    switch(c)
    {
        case '+': return 0;
        case '*': return 1;
        case '(': return 2;
        case ')': return 3;
        case 'i': return 4;
        case '$': return 5;
    }

    return -1;
}

int main()
{
    char input[50];
    int i = 0;

    printf("Enter expression using i for identifier: ");
    scanf("%s", input);

    strcat(input, "$");

    stack[++top] = '$';

    while (1)
    {
        int a = indexOf(stack[top]);
        int b = indexOf(input[i]);

        if (stack[top] == '$' && input[i] == '$')
        {
            printf("Accepted\n");
            break;
        }

        if (precedence[a][b] == '<' ||
            precedence[a][b] == '=')
        {
            stack[++top] = input[i++];
        }
        else if (precedence[a][b] == '>')
        {
            if (stack[top] == 'i')
            {
                top--;
            }
            else
            {
                top--;

                if (top >= 0 && stack[top] == 'i')
                    top--;
            }

            stack[++top] = 'E';
        }
        else
        {
            printf("Rejected\n");
            break;
        }
    }

    return 0;
}
