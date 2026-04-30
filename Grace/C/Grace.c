#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>

#define replica "#include<stdio.h>%1$c#include<fcntl.h>%1$c#include<unistd.h>%1$c%1$c#define replica %3$c%5$s%3$c%1$c%1$c#define print(str, fd) dprintf(fd, str, 10, 9, 34, 92, str);%1$c%1$c#define start(str) %4$c%1$c%2$cint main(void){%4$c%1$c%2$c%2$cint fd = open(%3$cGrace_kid.c%3$c, O_CREAT | O_TRUNC | O_WRONLY, 420);%4$c%1$c%2$c%2$c/*%1$c%2$c%2$c%2$clol%1$c%2$c%2$c*/%4$c%1$c%2$c%2$cif (fd == -1) return (1);%4$c%1$c%2$c%2$cprint(str, fd);%4$c%1$c%2$c%2$cclose(fd);%4$c%1$c%2$c%2$creturn (0);%4$c%1$c%2$c}%1$c%1$cstart(replica);"

#define print(str, fd) dprintf(fd, str, 10, 9, 34, 92, str);

#define start(str) \
	int main(void){\
		int fd = open("Grace_kid.c", O_CREAT | O_TRUNC | O_WRONLY, 420);\
		/*
			lol
		*/\
		if (fd == -1) return (1);\
		print(str, fd);\
		close(fd);\
		return (0);\
	}

start(replica);