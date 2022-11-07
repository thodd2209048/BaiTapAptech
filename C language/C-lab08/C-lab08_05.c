#include<stdio.h>

void main() {
	int i;
	char str[80];
	printf("\nEnter a string\n");
	gets(str);

	while(*(str + i)!= '\0') {
		i++;

	}
	printf("\nLength = %d", i );
}

