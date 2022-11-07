#include <iostream>

int main () {
	int a[5], b[5];
	printf("Nhap cac phan tu cua mang a\n");
	for(int i = 0; i < 5; i++) {
		scanf("%d", a + i);
	}
	printf("Nhap cac phan tu cua mang b\n");
	for(int i = 0; i < 5; i++) {
		scanf("%d", b + i);
	}
	int c[5];
	for(int i = 0; i < 5; i++) {
		*(c + i) = *(a + i) + * (b + i);
	}
	printf("\nMang a\n");
	for(int i = 0; i < 5; i++) {
		printf("%d ", *(a+i));
	}
	printf("\nMang b\n");
	for(int i = 0; i < 5; i++) {
		printf("%d ", *(b+i));
	}
	printf("\nMang c\n");
	for(int i = 0; i < 5; i++) {
		printf("%d ", *(c+i));
	}
	return 0;
}