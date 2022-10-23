#include<stdio.h>

int main() {
	int n;
	int a[100];
	printf("Nhap so phan tu cua mang thu 1\n");
	scanf("%d" , &n);
	
	printf("Nhap cac phan tu\n");
	for(int i=0; i<n; i++) {
		scanf("%d", &a[i]);
	}

	int m;
	int b[100];	
	printf("Nhap so phan tu cua mang thu 2\n");
	scanf("%d" , &m);
	
	printf("Nhap cac phan tu\n");
	for(int j=0; j<m; j++) {
		scanf("%d", &b[j]);
	}
	
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < m; j++) {
			if(b[j] == a[i]) {
				printf("%d la phan tu chung cua 2 mang\n", b[j]);
			}
		}
	}
	
	return 0;
 }
