#include <stdio.h>

int main()
{
    int n, m, i, j, k;
    int trans[10][10][10];
    int dfa[100][10];
    int states[100][10];
    int count = 1;

    printf("Enter number of states: ");
    scanf("%d", &n);

    printf("Enter number of symbols: ");
    scanf("%d", &m);

    printf("Enter NFA transition table (-1 for no transition):\n");

    for (i = 0; i < n; i++)
    {
        for (j = 0; j < m; j++)
        {
            int num;
            printf("q%d on symbol %d: ", i, j);
            scanf("%d", &num);

            if (num == -1)
                trans[i][j][0] = -1;
            else
            {
                trans[i][j][0] = num;
                scanf("%d", &trans[i][j][1]);
            }
        }
    }

    for (i = 0; i < n; i++)
        states[0][i] = 0;

    states[0][0] = 1;

    for (i = 0; i < count; i++)
    {
        for (j = 0; j < m; j++)
        {
            int newset[10] = {0};

            for (k = 0; k < n; k++)
            {
                if (states[i][k])
                {
                    int p;

                    for (p = 0; p < 2; p++)
                    {
                        if (trans[k][j][p] != -1)
                            newset[trans[k][j][p]] = 1;
                    }
                }
            }

            int found = -1;

            for (k = 0; k < count; k++)
            {
                int same = 1;

                int x;
                for (x = 0; x < n; x++)
                {
                    if (states[k][x] != newset[x])
                    {
                        same = 0;
                        break;
                    }
                }

                if (same)
                {
                    found = k;
                    break;
                }
            }

            if (found == -1)
            {
                for (k = 0; k < n; k++)
                    states[count][k] = newset[k];

                found = count;
                count++;
            }

            dfa[i][j] = found;
        }
    }

    printf("\nDFA Transition Table:\n");

    for (i = 0; i < count; i++)
    {
        printf("D%d = { ", i);

        for (j = 0; j < n; j++)
            if (states[i][j])
                printf("q%d ", j);

        printf("}\n");

        for (j = 0; j < m; j++)
            printf("  Symbol %d -> D%d\n", j, dfa[i][j]);
    }

    return 0;
}
