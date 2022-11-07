#include<stdio.h>
#include<math.h>

int main() {
	float a, b;
	
	printf("Nhap so thu nhat: ");
	scanf("%f ", &a);
	printf("\nNhap so thu hai: ");
	scanf("%f ", &b);
	printf("\n        MENU");
	printf("\n=======================");
	printf("\n+\n-\nx\n:");
	printf("\n=======================");
	printf("\nChon: ");
	fflush(stdin);
	char c;
	scanf("%c", &c);
	switch(c) {
		case '+':
			printf("%f", a + b);
			break;
		case '-':
			printf("%f", a - b);
			break;
		case 'x':
			printf("%f", a * b);
			break;
		case ':':
			printf("%f", a / b);
			break;
	}
	return 0;
}

