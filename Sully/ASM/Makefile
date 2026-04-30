NAME = Sully

NASM = nasm -f elf64

GCC = gcc -no-pie

SRC = Sully.s

NAME_RES = Sully_*

OBJ = $(SRC:%.s=%.o)

all: $(NAME)

%.o: %.s
	$(NASM) $< -o $@

$(NAME): $(OBJ)
	$(GCC) $(OBJ) -o $(NAME)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME_RES)
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re