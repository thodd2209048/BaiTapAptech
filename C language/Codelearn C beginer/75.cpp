#include<stdio.h>

void show(char name[100]) {
	printf("Hello %s", name);
}

int main() {
	char ian[100];
	scanf("%s", ian);
	show(ian);
	return 0;
}

