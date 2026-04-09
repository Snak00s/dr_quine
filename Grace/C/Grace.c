#include<stdio.h>

#define replica "#include<stdio.h>%1$c%1$c#define replica %3$c%5$s%3$c%1$c%1$c#define print(str) printf(str, 10, 9, 34, 92, str);%1$c%1$c#define start(str) %4$c%1$c%2$cint main(void){%4$c%1$c%2$c%2$cprint(str);%4$c%1$c%2$c%2$creturn (0);%4$c%1$c%2$c}%1$c%1$cstart(replica);"

#define print(str) printf(str, 10, 9, 34, 92, str);

#define start(str) \
	int main(void){\
		print(str);\
		return (0);\
	}

start(replica);