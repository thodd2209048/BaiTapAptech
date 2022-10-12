#include<stdio.h>

int main() {
	int a, b;
	scanf("%d %d", &a, &b);
	if(a % b == 0) {
		printf("%d la uoc cua %d", b, a);
	}
	else if(b % a == 0) {
		printf("%d la uoc cua %d", a, b);
	}
	else {
		printf("Khong co so nao la uoc cua nhau");
	}
	return 0;
}
