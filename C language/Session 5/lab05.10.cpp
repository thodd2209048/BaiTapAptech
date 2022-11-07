#include<stdio.h>
#include<cctype>
#include<stdbool.h>
#include<stdlib.h>
#include<math.h>

int main() {
	printf("Nhap so nguyen duong:\n");
	int n;
	scanf("%d", &n);
	int a[1000];
	int i = 0;
	for(i; n > 0 ;) {
		a[i] = n % 2;
		n = n / 2;
		i++;
	}
	for(i=i-1; i >=0; i-- ){
		printf("%d", a[i]);
	}
	return 0;
}

