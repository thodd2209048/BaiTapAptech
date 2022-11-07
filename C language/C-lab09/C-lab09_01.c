#include<stdio.h>

int power(int a, int n) {
	int b = 1;
	int i;
	for(i = 1; i <= n; i++) {
	b = b * a;
	}
	return b;
}

int main() {
	int a, n;
	printf("Chuong trinh tinh luy thua\n");
	printf("Nhap gia tri cua a\n");
	scanf("%d", &a);
	printf("Nhap gia tri cua n\n");
	scanf("%d", &n);
	printf("Ket qua cua phep tinh luy thua: %d", power(a, n));
	return 0;
}
