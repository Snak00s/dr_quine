#include<stdio.h>

/*
	yo
*/

char *getReplica(void)
{
	return ("#include<stdio.h>%1$c%1$c/*%1$c%3$cyo%1$c*/%1$c%1$cchar *getReplica(void)%1$c{%1$c%3$creturn (%2$c%4$s%2$c);%1$c}%1$c%1$cint main(void)%1$c{%1$c%3$c/*%1$c%3$c%3$cissou%1$c%3$c*/%1$c%1$c%3$cchar *replica = getReplica();%1$c%3$cprintf(replica, 10, 34, 9, replica);%1$c%3$creturn (0);%1$c}");
}

int main(void)
{
	/*
		issou
	*/

	char *replica = getReplica();
	printf(replica, 10, 34, 9, replica);
	return (0);
}