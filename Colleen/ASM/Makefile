NAME = Colleen

NASM = nasm -f elf64

SRC = Colleen.s
OBJ = $(SRC:%.s=%.o)

# -----------------------------------------

EXEC = test

GCC = gcc -no-pie

CSRCS = main.c

all: $(NAME)

%.o: %.s
	$(NASM) $< -o $@

$(NAME): $(OBJ)
	$(GCC) $(OBJ) -o $(NAME)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re