#include<fcntl.h>
#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>

char filename[100];

char *getReplica(void)
{
	return("#include<fcntl.h>%1$c#include<unistd.h>%1$c#include<stdio.h>%1$c#include<stdlib.h>%1$c%1$cchar filename[100];%1$c%1$cchar *getReplica(void)%1$c{%1$c%2$creturn(%3$c%4$s%3$c);%1$c}%1$c%1$cint main(void)%1$c{%1$c%2$cint i = %5$d;%1$c%2$cif (i == 0)%1$c%2$c%2$creturn (0);%1$c%2$csprintf(filename, %3$cSully_%%d.c%3$c, --i);%1$c%2$cint fd = open(filename, O_CREAT | O_TRUNC | O_WRONLY, 420);%1$c%2$cif (fd == -1)%1$c%2$c{%1$c%2$c%2$cprintf(%3$copen fail%3$c);%1$c%2$c%2$creturn (0);%1$c%2$c}%1$c%2$cchar *replica = getReplica();%1$c%2$cdprintf(fd, replica, 10, 9, 34, replica, i);%1$c%2$cclose(fd);%1$c%2$csprintf(filename, %3$ccc -Wall -Wextra -Werror Sully_%%1$d.c -o Sully_%%1$d%3$c, i);%1$c%2$csystem(filename);%1$c%2$csprintf(filename, %3$c./Sully_%%1$d%3$c, i);%1$c%2$csystem(filename);%1$c%2$creturn (0);%1$c}");
}

int main(void)
{
	int i = 5;
	if (i == 0)
		return (0);
	sprintf(filename, "Sully_%d.c", --i);
	int fd = open(filename, O_CREAT | O_TRUNC | O_WRONLY, 420);
	if (fd == -1)
	{
		printf("open fail");
		return (0);
	}
	char *replica = getReplica();
	dprintf(fd, replica, 10, 9, 34, replica, i);
	close(fd);
	sprintf(filename, "cc -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d", i);
	system(filename);
	sprintf(filename, "./Sully_%1$d", i);
	system(filename);
	return (0);
}