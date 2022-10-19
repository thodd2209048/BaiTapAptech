#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main () {
	int * p, n;
	printf("Nhap do dai cua mang\n");
	scanf("%d", &n);
	p = (int *)malloc(n * sizeof(int));
	if(!p) {
		printf("Cap phat khong thanh cong");
		exit(0);
	}
	else {
		printf("Cap phat thanh cong");
	}

	int i;
	printf("\nNhap cac phan tu\n");
	for(i = 0; i < n; i++) {
		scanf("%d", &p[i]);
	}
	
	printf("\nHien thi mang\n");
	for(i = 0; i < n; i++) {
		printf("%d ", *(p+i));
	}
	
	printf("\nHien thi cac so nguyen to\n");
	int j;
	int check;
	for(i = 0; i < n; i++) {
		check = 0;
		for(j = 2; j <= sqrt(*(p + i)); j++) {
			if(*(p+i) % j == 0) {
				check++;
			}
		}
		if(check == 0 && *(p+i) > 1) {
			printf("%d ", *(p+i));
		}
	}
	
	return 0;
}

