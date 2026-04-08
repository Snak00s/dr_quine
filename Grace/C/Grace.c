#include<unistd.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<stdlib.h>
#include<strings.h>

int buff_size = 100;
char buff[101];
int fd;
int out;
int rv;

//comment blabla

#define loop(buff,fd,out,rv) \
	while (rv) {\
		if (rv == -1) {\
			break;\
		}\
		write(out, buff, rv);\
		rv = read(fd, buff, buff_size);\
	}

#define end(fd, out) \
	close(fd);\
	close(out);\
	return (0); }

#define start(buff,fd,out,rv) \
	int main() {\
		fd = open("Grace.c", O_RDONLY );\
		if (fd == -1) {\
			write(1, "File error\n", 12);\
			return(0);\
		}\
		out = open("Grace_kid.c",  O_CREAT | O_TRUNC | O_WRONLY, 0664); \
		rv = read(fd, buff, buff_size); \
		loop(buff, fd, out, rv); \
		end(fd, out);

start(buff, fd, out, rv);
