#include<unistd.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<stdlib.h>
#include<strings.h>

//comment outside the program

int main(void)
{
	char buff[101];
	//comment inside the program
	int fd = open("Colleen.c", O_RDONLY);
	if (fd == -1)
	{
		write(1, "File error\n", 12);
		return (0);
	}
	bzero(buff, 101);
	int rv = read(fd, buff, 100);
	while (rv)
	{
		if (rv == -1)
			break;
		write(1, buff, rv);
		rv = read(fd, buff, 100);
	}
	close(fd);
	return (0);
}