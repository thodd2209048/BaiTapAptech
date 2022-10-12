#include<stdio.h>
#include<cctype>
#include<stdbool.h>
#include<stdlib.h>
#include<math.h>

int main() {
	printf("Nhap so nguyen duong:\n");
	int n;
	scanf("%d", &n);
	int giaiThua = 1;
	for(int i = 1; i <= n; i++) {
		giaiThua *= i;
	}
	printf("%d", giaiThua);
	return 0;
}

