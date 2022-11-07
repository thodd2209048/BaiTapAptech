#include<stdio.h>
#include<math.h>

void sTamGiac() {
	int a, b, c;
	printf("Nhap do dai cac canh cua tam giac\n");
	scanf("%d %d %d", &a, &b, &c);
	if(a + b > c && a + c > b && b + c > a) {
		int p = (a + b + c)/2;
		int s = sqrt(p * (p - a) * (p - b) * (p - c));
		printf("Dien tich cua tam giac la: %d\n\n", s);
	}
	else {
		printf("Du lieu khong hop le\n\n");
	}
}

void sChuNhat() {
	int a, b;
	printf("Nhap do dai cac canh cua hinh chu nhat\n");
	scanf("%d %d", &a, &b);
	printf("Dien tich cua hinh chu nhat la: %d\n\n", a * b);
}

void sHinhThang() {
	int a, b, h;
	printf("Nhap do dai day nho cua hinh thang\n");
	scanf("%d", &a);
	printf("Nhap do dai day lon cua hinh thang\n");
	scanf("%d", &b);
	printf("Nhap chieu cao cua hinh thang\n");
	scanf("%d", &h);
	printf("Dien tich cua hinh thang la: %d\n\n", (a+b)/2*h);
}

void sHinhTron() {
	int r;
	scanf("%d", &r);
	printf("Dien tich cua hinh tron la: %d\n\n", 3.14 * pow(r,2));
}

void menu() {
	int ch;
	while(1) {
		printf("TINH DIEN TICH\n");
		printf("===========================\n");
		printf("1. Tam giac\n");
		printf("2. Chu nhat\n");
		printf("3. Hinh thang\n");
		printf("4. Hinh tron\n");
		printf("5. Thoat\n");
		printf("===========================\n");
		printf("Chon\n");
		scanf("%d", &ch);		
		switch(ch) {
			case 1:
				sTamGiac();
				break;
			case 2:
				sChuNhat();
				break;
			case 3:
				sHinhThang();
				break;
			case 4:
				sHinhTron();
				break;
			case 5:
				exit(0);
		}
	}
}

int main() {
	menu();
	return 0;
}
