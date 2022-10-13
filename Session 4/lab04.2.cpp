#include<stdio.h>

int main() {
	char c;
	scanf("%c", &c);
	if(c >= 'a' && c <= 'z') {
		printf("Day la ky tu viet thuong");
	}
	else if(c >= 'A' && c <= 'Z') {
		printf("Day la ky tu viet hoa");
	}
	else if(c >= '0' && c <= '9') {
		printf("Day la ky tu so");
	}
	else {
		printf("Day khong phai ky tu so hay ky tu chu");
	}
	return 0;
}
