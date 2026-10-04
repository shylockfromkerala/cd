#include <stdio.h>

int main()
{
    int n, m;
    int e[10][10], trans[10][10][10];
    int closure[10][10];
    int i, j, k;

    printf("Enter number of states: ");
    scanf("%d", &n);

    printf("Enter number of input symbols: ");
    scanf("%d", &m);

    printf("Enter epsilon transition matrix:\n");

    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            scanf("%d", &e[i][j]);
        }
    }

    printf("Enter transition table:\n");

    for (i = 0; i < n; i++)
    {
        for (j = 0; j < m; j++)
        {
            for (k = 0; k < n; k++)
            {
                scanf("%d", &trans[i][j][k]);
            }
        }
    }

    /* Initially every state belongs to its own epsilon closure */
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
            closure[i][j] = e[i][j];

        closure[i][i] = 1;
    }

    /* Compute epsilon closure */
    for (k = 0; k < n; k++)
    {
        for (i = 0; i < n; i++)
        {
            for (j = 0; j < n; j++)
            {
                if (closure[i][k] && closure[k][j])
                    closure[i][j] = 1;
            }
        }
    }

    printf("\nNFA without epsilon transitions:\n");

    for (i = 0; i < n; i++)
    {
        for (j = 0; j < m; j++)
        {
            printf("q%d on symbol %d -> { ", i, j);

            for (k = 0; k < n; k++)
            {
                int found = 0;
                int p;

                if (closure[i][k])
                {
                    for (p = 0; p < n; p++)
                    {
                        if (trans[k][j][p])
                        {
                            found = 1;
                            break;
                        }
                    }
                }

                if (found)
                    printf("q%d ", k);
            }

            printf("}\n");
        }
    }

    return 0;
}
