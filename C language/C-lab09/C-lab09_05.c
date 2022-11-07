#include<stdio.h>
#include<math.h>

int a[20];

void init(int * a) {
	int i;
	for(i = 0; i < 20; i++) {
		*(a+i) = rand()%10;
	}
}

void display(int * a) {
	int i;
	for(i = 0; i < 20; i++) {
		printf("%d ", a[i]);
	}
}

void getMax(int * a) {
	int maxValue = a[0];
	int i;
	for(i = 1; i < 20; i++) {
		if(a[i] > maxValue) {
			maxValue = a[i];
		}
	}
	printf("\nGia tri lon nhat trong mang la %d", maxValue);
}

void getAvg(int * a) {
	int sum = 0;
	int i;
	for(i = 0; i < 20; i++) {
		sum = sum + a[i];
	}
	printf("\nGia tri trung binh cua cac phan tu trong mang la %d", sum / 20);
}

void findValue(int * a) {
	int fv, b[20], i;
	int slkq = 0;
	int j = 0;
	printf("\n\nNhap gia tri can tim kiem\n");
	scanf("%d", &fv);
	for(i = 0; i < 20; i++) {
		if(a[i] == fv) {
			slkq++;
			b[j] = i;
			j++;
		}
	}
	if(slkq == 0) {
		printf("\nKhong tim thay phan tu co gia tri %d", fv);
	}
	else {
		printf("\nGia tri %d duoc tim thay o vi tri: ", fv);
		for(j = 0; j < slkq; j++) {
			printf("%d ", b[j] + 1);
		}
	}
}

int main() {
	int a[20];
	init(a);
	display(a);
	getMax(a);
	getAvg(a);
	findValue(a);
	return 0;
}


