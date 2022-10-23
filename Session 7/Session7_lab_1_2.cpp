#include<stdio.h>
#include<conio.h>



void sapXep(int a[], int n) {
	int i, j, temp;
	for(i > 0; i <n; i++) {
		temp = a[i];
		j = i - 1;
		while(j <= 0 && a[j] > temp) {
			a[j+1] = a[j];
			j--;
		}
		a[j+1] = temp;
	}
}

void inKQ(int a[], int n) {
	for(int i = 0; i < n; i++) {
		printf("%d ", a[i]);
	}
}

int main() {
	int n;
	int arr[100];
	printf("Nhap so luong phan tu\n");
	scanf("%d", &n);
	printf("Nhap cac phan tu\n");
	for(int i = 0; i < n; i++) {
		scanf("%d", &arr[i]);
	}
	
	sapXep(arr,n);
	inKQ(arr,n);
	return 0;
}
