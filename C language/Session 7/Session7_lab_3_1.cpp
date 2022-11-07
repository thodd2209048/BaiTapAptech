#include<stdio.h>

int main() {
	int a[100];
	int spt;
	
	printf("nhap so luong phan tu\n");
	scanf("%d", &spt);
	printf("nhap cac phan tu\n");
	for(int i = 0; i < spt; i ++) {
		scanf("%d", &a[i]);
	}

	for(int i = 0; i < spt; i++) {
		printf("%d ", a[i]);
	}	
	
	int j,k;
	printf("nhap so nguyen j va k\n");
	scanf("%d %d", &j, &k);
	
	int m, n, temp;
	for(m = j; m<k; m++) {
		for(n = j; n < k; n++) {
			if(a[n] > a[n+1]) {
			temp = a[n+1];
			a[n+1] = a[n];
			a[n] = temp;
			}
		}
	}
	
	for(int i = 0; i < spt; i++) {
		printf("%d ", a[i]);
	}
		
	return 0;
}
