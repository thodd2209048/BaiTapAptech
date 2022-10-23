#include<stdio.h>
#include<math.h>

int inputNumber() {
	int a;
	printf("Nhap vao so nguyen can kiem tra\n");
	scanf("%d", &a);
	return a;
}

void checkNumber(int a) {
	int i;
	int b = 0;
	for(i = 2; i < sqrt(a); i++) {
		if(a % i == 0) {
			b = b + 1;
		}
	}
	if(b == 0) {
		printf("%d la so nguyen to", a);
	}
	else {
		printf("%d khong phai la so nguyen to", a);
	}
}

int main () {
	checkNumber(inputNumber());
}
