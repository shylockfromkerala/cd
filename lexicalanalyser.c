
#include <stdio.h>
#include <ctype.h>
#include <string.h>

char keywords[32][10] = {
    "int", "float", "char", "double", "void",
    "if", "else", "for", "while", "do",
    "switch", "case", "break", "continue",
    "return", "default", "long", "short",
    "signed", "unsigned", "const", "static",
    "struct", "union", "enum", "typedef",
    "sizeof", "goto", "auto", "extern",
    "register", "volatile"
};

int isKeyword(char str[])
{
    int i;

    for (i = 0; i < 32; i++)
    {
        if (strcmp(str, keywords[i]) == 0)
            return 1;
    }

    return 0;
}

int main()
{
    char input[1000], word[100];
    int i = 0, j;

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
            j = 0;

            while (isalnum(input[i]) || input[i] == '_')
            {
                word[j++] = input[i++];
            }

            word[j] = '\0';

            if (isKeyword(word))
                printf("Keyword: %s\n", word);
            else
                printf("Identifier: %s\n", word);
        }
        else if (isdigit(input[i]))
        {
            printf("Number: ");

            while (isdigit(input[i]))
                printf("%c", input[i++]);

            printf("\n");
        }
        else if (strchr("+-*/=<>", input[i]))
        {
            printf("Operator: %c\n", input[i++]);
        }
        else if (strchr(";,(){}[]", input[i]))
        {
            printf("Special Symbol: %c\n", input[i++]);
        }
        else
        {
            printf("Unknown Symbol: %c\n", input[i++]);
        }
    }

    return 0;
}
