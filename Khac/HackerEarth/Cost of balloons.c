#include<stdio.h>


int testChan(int a[10][2], int n) {
	int i, j;
	int sum = 0;
	for(i = 0; i < n; i++){
		j = 0;
		sum = sum + a[i][j];
	}
	return sum;	
}	

int testLe(int a[10][2], int n) {
	int i, j;
	int sum = 0;
	for(i = 0; i < n; i++){
		j = 1;
		sum += a[i][j];
	}
	return sum;
}


void minCost(t) {
	int grn, pur;
	scanf("%d %d", &grn, &pur);
	int n;
	//printf("Nhap so nguoi tham gia\n");
	scanf("%d", &n);
	int a[10][2];
	//printf("Nhap ket qua test\n");
	int i, j;
	for(i = 0; i < n; i++) {
		for(j = 0; j < 2; j++) {
			scanf("%d", &a[i][j]);
		}
	}
	int sum1, sum2;
	sum1 = testChan(a, n) * grn + testLe(a, n) * pur;
	sum2 = testChan(a, n) * pur + testLe(a, n) * grn;
	if(sum1 > sum2) {
		//printf("minicost: ");
		printf("%d\n", sum2);
	}
	else {
		//printf("minicost: ");
		printf("%d\n", sum1);	
	}
}
int main() {
	int t;
	int i;
	//printf("Nhap so test case\n");
	scanf("%d", &t);
	//printf("Nhap gia bong\n");
	for(i = 0; i < t; i++) {
		minCost(t);
	}

	return 0;
}
