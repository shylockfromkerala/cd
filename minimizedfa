#include <stdio.h>

int main()
{
    int n, m, i, j, k;
    int trans[20][10];
    int final[20];
    int mark[20][20] = {0};
    int group[20];

    printf("Enter number of states: ");
    scanf("%d", &n);

    printf("Enter number of input symbols: ");
    scanf("%d", &m);

    printf("Enter transition table:\n");

    for (i = 0; i < n; i++)
        for (j = 0; j < m; j++)
            scanf("%d", &trans[i][j]);

    printf("Enter number of final states: ");
    int f;
    scanf("%d", &f);

    for (i = 0; i < n; i++)
        final[i] = 0;

    printf("Enter final states:\n");

    for (i = 0; i < f; i++)
    {
        scanf("%d", &k);
        final[k] = 1;
    }

    /* Mark final vs non-final pairs */
    for (i = 0; i < n; i++)
    {
        for (j = i + 1; j < n; j++)
        {
            if (final[i] != final[j])
                mark[i][j] = mark[j][i] = 1;
        }
    }

    /* Mark distinguishable states */
    int changed = 1;

    while (changed)
    {
        changed = 0;

        for (i = 0; i < n; i++)
        {
            for (j = i + 1; j < n; j++)
            {
                if (!mark[i][j])
                {
                    for (k = 0; k < m; k++)
                    {
                        int a = trans[i][k];
                        int b = trans[j][k];

                        if (a != b && mark[a][b])
                        {
                            mark[i][j] = mark[j][i] = 1;
                            changed = 1;
                            break;
                        }
                    }
                }
            }
        }
    }

    for (i = 0; i < n; i++)
        group[i] = -1;

    int groups = 0;

    for (i = 0; i < n; i++)
    {
        if (group[i] == -1)
        {
            group[i] = groups;

            for (j = i + 1; j < n; j++)
            {
                if (!mark[i][j])
                    group[j] = groups;
            }

            groups++;
        }
    }

    printf("\nMinimized DFA:\n");

    for (i = 0; i < groups; i++)
    {
        printf("Group %d = { ", i);

        for (j = 0; j < n; j++)
            if (group[j] == i)
                printf("q%d ", j);

        printf("}\n");
    }

    printf("\nTransitions:\n");

    for (i = 0; i < groups; i++)
    {
        int representative = -1;

        for (j = 0; j < n; j++)
        {
            if (group[j] == i)
            {
                representative = j;
                break;
            }
        }

        for (k = 0; k < m; k++)
            printf("Group %d --%d--> Group %d\n",
                   i, k, group[trans[representative][k]]);
    }

    return 0;
}
