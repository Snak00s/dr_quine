NAME = Sully

CC = cc -Wall -Werror -Wextra

SRC = Sully.c

#use of wildcards idk if legals

NAME_RES = Sully_*

#------------------------------

OBJ = $(SRC:%.c=%.o)

all: $(NAME)

%.o: %.c
	$(CC) -c $< -o $@

$(NAME): $(OBJ)
	$(CC) -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME_RES)
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re