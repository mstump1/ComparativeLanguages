#include <stdio.h>
int main()
{
    int i = getint();
    int j = getint();
    while(j != 0 && i != 0)
    {
        if (i > j)
        {
            i = i % j;
        }
        else
        {
            j = j % i;
        }
    }

    if (j == 0)
    {
        putint(i);
    }
    else
    {
        putint(j);
    }
    
}

int getint()
{
    int result;
    scanf("%d", &result);
    return result;
}

int putint(int input)
{
    printf("%d\n", input);
}

