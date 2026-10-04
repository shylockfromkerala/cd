#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main()
{
    char input[1000];
    int i = 0;

    printf("Enter the input: ");
    fgets(input, sizeof(input), stdin);

    while (input[i] != '\0')
    {
        if (isspace(input[i]))
        {
            i++;
        }
        else if (isalpha(input[i]) || input[i] == '_')
        {
            printf("Identifier: ");

            while (isalnum(input[i]) || input[i] == '_')
            {
                printf("%c", input[i]);
                i++;
            }

            printf("\n");
        }
        else if (isdigit(input[i]))
        {
            printf("Number: ");

            while (isdigit(input[i]))
            {
                printf("%c", input[i]);
                i++;
            }

            printf("\n");
        }
        else if (strchr("+-*/=<>", input[i]))
        {
            printf("Operator: %c\n", input[i]);
            i++;
        }
        else if (strchr(";,(){}[]", input[i]))
        {
            printf("Special Symbol: %c\n", input[i]);
            i++;
        }
        else
        {
            printf("Unknown Symbol: %c\n", input[i]);
            i++;
        }
    }

    return 0;
}
