#include <stdio.h>
#include <string.h>
#include <ctype.h>

char production[20][20];
char first[20][20];
char follow[20][20];

int n;

void add(char set[], char c)
{
    int i;

    for (i = 0; set[i] != '\0'; i++)
        if (set[i] == c)
            return;

    int len = strlen(set);
    set[len] = c;
    set[len + 1] = '\0';
}

void findFirst(char symbol, char result[])
{
    int i, j;

    if (!isupper(symbol))
    {
        add(result, symbol);
        return;
    }

    for (i = 0; i < n; i++)
    {
        if (production[i][0] == symbol)
        {
            for (j = 2; production[i][j] != '\0'; j++)
            {
                char x = production[i][j];

                if (!isupper(x))
                {
                    add(result, x);
                    break;
                }

                char temp[20] = "";

                findFirst(x, temp);

                int hasEpsilon = 0;

                for (int k = 0; temp[k] != '\0'; k++)
                {
                    if (temp[k] == '#')
                        hasEpsilon = 1;
                    else
                        add(result, temp[k]);
                }

                if (!hasEpsilon)
                    break;

                if (production[i][j + 1] == '\0')
                    add(result, '#');
            }
        }
    }
}

int main()
{
    int i;

    printf("Enter number of productions: ");
    scanf("%d", &n);

    printf("Enter productions (example E=TR):\n");

    for (i = 0; i < n; i++)
        scanf("%s", production[i]);

    for (i = 0; i < n; i++)
        findFirst(production[i][0], first[production[i][0] - 'A']);

    printf("\nFIRST:\n");

    for (i = 0; i < n; i++)
    {
        char c = production[i][0];

        printf("FIRST(%c) = { %s }\n",
               c,
               first[c - 'A']);
    }

    return 0;
}
