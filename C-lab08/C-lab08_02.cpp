#include <iostream>

int main () {
	int a[5];
	int * ptr = a;
	printf("Nhap phan tu cua mang\n");
	for(int i = 0; i < 5; i++) {
		scanf("%d", ptr);
		ptr++;
	}
	for(int i = 0; i < 5; i++) {
		printf("%d ", *(a+i));
	}
	return 0;
}
