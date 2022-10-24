#include<stdio.h>
#include<stdlib.h>

int a = 0;
int b = 0;
void input() {
	printf("Nhap hai so a, b de tinh toan\n");
	scanf("%d %d", &a, &b);
}

void sum(int a, int b) {
	printf("Tong cua hai so la %d\n", a + b);
}

void sub(int a, int b) {
	printf("Hieu cua hai so la %d\n", a - b);
}

void multi(int a, int b) {
	printf("Tich cua hai so la %d\n", a * b);
}

void division(float a, float b) {
	if(b == 0) {
		printf("Phep chia khong thuc hien duoc do so bi chia = 0");
	}
	else {
	printf("Thuong cua hai so la %f\n", a / b);		
	}

}

void menu() {
	int ch;
	while(1) {
		printf("TINH TOAN\n");
		printf("========================\n");
		printf("1. Nhap so\n");
		printf("2. Tinh tong\n");
		printf("3. Tinh hieu\n");
		printf("4. Tinh tich\n");
		printf("5. Tinh thuong\n");
		printf("6. Thoat\n");
		printf("========================\n");
		printf("Chon\n");
		scanf("%d", &ch);
		switch (ch) {
			case 1:
				input();
				break;
			case 2:
				sum(a, b);
				break;
			case 3:
				sub(a, b);
				break;
			case 4:
				multi(a, b);
				break;
			case 5:
				division(a, b);
				break;
			case 6:
				exit(0);
		}	
	}
}

int main() {
	menu();
	return 0;
}
