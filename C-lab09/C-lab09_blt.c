#include<stdio.h>
#include<math.h>
#include<time.h>
#include<stdlib.h>

void giaiThua() {
	int n, i;
	int kq = 1;
	printf("Ban can tinh giai thua cua so may?\n");
	scanf("%d", &n);
	for(i = 1; i <= n; i++) {
		kq = kq * i;
	}
	printf("Ket qua: %d! = %d\n", n, kq);
}

void xucXac() {
	int rNum;
	srand(time(NULL));
	rNum = rand()%5;
	printf("Ban da gieo duoc so %d\n", rNum+1);
}

void rutBai() {
	int laBai, loaiBai;
	srand(time(NULL));
	laBai = rand()%13 + 1;
	switch (laBai) {
		case 1:
			printf("Ban rut duoc la A ");
			break;
		case 2:
			printf("Ban rut duoc la 2 ");
			break;
		case 3:
			printf("Ban rut duoc la 3 ");
			break;
		case 4:
			printf("Ban rut duoc la 4 ");
			break;
		case 5:
			printf("Ban rut duoc la 5 ");
			break;
		case 6:
			printf("Ban rut duoc la 6 ");
			break;
		case 7:
			printf("Ban rut duoc la 7 ");
			break;
		case 8:
			printf("Ban rut duoc la 8 ");
			break;
		case 9:
			printf("Ban rut duoc la 9 ");
			break;
		case 10:
			printf("Ban rut duoc la 10 ");
			break;
		case 11:
			printf("Ban rut duoc la J ");
			break;
		case 12:
			printf("Ban rut duoc la Q ");
			break;
		case 13:
			printf("Ban rut duoc la K ");
			break;
	}
	loaiBai = rand()%4 + 1;
	switch (loaiBai) {
		case 1: 
			printf("Clubs\n");
			break;
		case 2: 
			printf("Diamonds\n");
			break;
		case 3: 
			printf("Hearts\n");
			break;
		case 4: 
			printf("Spades\n");
			break;
		
	}
}

void chuHoaThuong() {
	char a[100];
	printf("Nhap chuoi ky tu can xu ly\n");
	fflush(stdin);
	gets(a);
	printf("\nChuoi o dang chu hoa la: %s", strupr(a));
	printf("\nChuoi o dang chu thuong la: %s\n", strlwr(a));
}

void menu() {
	int ch;
	while(1) {
		printf("\nMENU\n");
		printf("1. Tinh giai thua\n");
		printf("2. Gieo xuc xac\n");
		printf("3. Rut mot la bai\n");
		printf("4. Chuyen chu hoa, chu thuong\n");
		printf("5. Thoat\n");
		printf("Chon\n");
		scanf("%d", &ch);
		switch (ch) {
			case 1:
				giaiThua();
				break;
			case 2:
				xucXac();
				break;
			case 3:
				rutBai();
				break;
			case 4:
				chuHoaThuong();
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
