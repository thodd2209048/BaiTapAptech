#include<stdio.h>
#include<string.h>

int main() {
	int n;
	char c;
	do {
		printf("Ban muon bang cuu chuong cua so may?\n");
		scanf("%d", &n);
		for(int i =1; i <= 9; i++) {
			printf("%d * %d = %d\n", n, i, n*i);
		}
		printf("Co tiep tuc nhap khong?\n");
		fflush(stdin);
		scanf("%c", &c);
	}
	while(c == 'y');

	return 0;
}

