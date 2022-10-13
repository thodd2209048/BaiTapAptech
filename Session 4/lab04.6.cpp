#include<stdio.h>
#include<math.h>

int main() {
	int a , b , c;
	scanf("%d %d %d", &a, &b, &c);
	int max = a;
	if(b >= max) {
		max = b;
	}
	if(c >= max) {
		max = c;
	}
	if(pow(a, 2) + pow(b, 2) + pow(c, 2) == 2 * pow(max, 2)){
		printf("Day la ba canh cua tam giac vuong voi canh huyen la %d", max);
	}
	else {
		printf("Day khong phai la ba canh cua tam giac vuong.");
	}
	return 0;
}
