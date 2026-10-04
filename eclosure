#include <stdio.h>

int n;
int eclosure[20][20];
int visited[20];

void dfs(int state)
{
    int i;

    visited[state] = 1;

    for (i = 0; i < n; i++)
    {
        if (eclosure[state][i] == 1 && !visited[i])
        {
            dfs(i);
        }
    }
}

int main()
{
    int i, j;

    printf("Enter number of states: ");
    scanf("%d", &n);

    printf("Enter epsilon transition matrix:\n");

    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            scanf("%d", &eclosure[i][j]);
        }
    }

    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
            visited[j] = 0;

        dfs(i);

        printf("E-Closure(q%d) = { ", i);

        for (j = 0; j < n; j++)
        {
            if (visited[j])
                printf("q%d ", j);
        }

        printf("}\n");
    }

    return 0;
}
