NAME		= minishell

SRCS		=	\
				exec/builtin.c \
				exec/echo.c \
				exec/env.c \
				exec/exec.c \
				exec/exit.c \
				exec/export.c \
				exec/unset.c \
				exec/utils.c \
				parsing/final_parse.c \
				parsing/ioredir.c \
				parsing/pipes.c \
				parsing/quotes_and_variables.c \
				parsing/utils.c \
				utils/utils.c \
				utils/utils2.c \
				error.c \
				free.c \
				main.c

OBJS		= $(SRCS:.c=.o)

CFLAGS		= -Wall -Wextra -Werror

%.o :		%.c
			gcc -c -g -I./include -I./libft $(CFLAGS) $< -o $@

$(NAME):	$(OBJS)
			make -C libft
			mv libft/libft.a .
			gcc $(OBJS) libft.a -o $(NAME) -lreadline

all:		$(NAME)

clean:
			rm -f $(OBJS)
			make -C libft clean

fclean:		clean
			rm -f $(NAME) libft.a

re:			fclean all

.PHONY:		all clean fclean re
