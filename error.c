#include "minishell.h"

void ft_free_list(t_list *list)
{
    char *tmp;

    while (list)
    {
        while (*(list->split))
        {
            tmp = *(list->split);
            (list->split)++;
            free(tmp);
        }
        free(list->split);
        free(list->line);
        list = list->next;
    }
}
