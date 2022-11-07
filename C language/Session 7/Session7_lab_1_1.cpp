#include <stdio.h>

void hamSapXep(int a[], int n) {
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < n-1; j++) {
			if(a[j] < a[j+1]) {
				int temp;
				temp = a[j];
				a[j] = a[j+1];
				a[j+1] = temp;
			}
		}
	}
}


void hamIn(int a[], int n) {
	for(int i = 0; i < n; i ++) {
	printf("%d ", a[i]);
	}
}	

int main() {
	int a[100];
	int n;
	printf("Nhap so cac phan tu\n");
	scanf("%d", &n);
	printf("Nhap phan tu\n");
	for(int i = 0; i < n; i++) {
		scanf("%d", &a[i]);
	}
	
	hamSapXep(a, n);
	hamIn(a, n);

	return 0;
}

