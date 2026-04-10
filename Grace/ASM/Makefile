NAME = Grace

NASM = nasm -f elf64

GCC = gcc -no-pie

SRC = Grace.s

OBJ = $(SRC:%.s=%.o)

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