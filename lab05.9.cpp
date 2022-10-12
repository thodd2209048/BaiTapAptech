#include<stdio.h>
#include<cctype>
#include<stdbool.h>
#include<stdlib.h>
#include<math.h>

int main() {
	printf("Nhap so nguyen duong:\n");
	int n;
	scanf("%d", &n);

	for(int i = 1; i <= n; i++) {
		if(n % i == 0) {
			printf("%d ", i);
		}
	}
	return 0;
}

