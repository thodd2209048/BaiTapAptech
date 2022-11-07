#include <iostream>

int main () {
	int a, b;
	int *x, *y;
	x = &a;
	y = &b;
	printf("Nhap gia tri cua a va b:\n");
	scanf("%d", x);
	scanf("%d", y);
	printf("Gia tri va dia chi cua bien truoc khi thay doi.\n");
	printf("Gia tri cua bien a va b la: %d va %d\n", *x, *y);
	printf("Dia chi cua bien a va b la: %d va %d\n", x, y);
	int temp;
	temp = *x;
	*x = *y;
	*y = temp;
	printf("Gia tri va dia chi cua bien sau khi thay doi.\n");
	printf("Gia tri cua bien a va b la: %d va %d\n", *x, *y);
	printf("Dia chi cua bien a va b la: %d va %d\n", x, y);
	
	return 0;
}
