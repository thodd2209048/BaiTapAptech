#include<stdio.h>
#include<stdlib.h>

int main () {
	char chuoi[40];
	printf("\nNhap chuoi ky tu\n");
	scanf("%s", chuoi);
	int i;
	for(i = 0; i < 40; i++) {
		if(chuoi[i] == '\0') {
			break;
		}
	}
	int j, temp;
	for(j=0; j < i/2; j++) {
		temp = *(chuoi + j);
		*(chuoi + j) = *(chuoi + i - 1 - j);
		*(chuoi + i - 1 - j) = temp;
	}
	printf("Chuoi dao nguocj\n");
	printf("%s", chuoi);
	
	return 0;
}
