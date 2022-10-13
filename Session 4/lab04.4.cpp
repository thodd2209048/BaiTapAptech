#include<stdio.h>

int main() {
	char c;
	scanf("%c", &c);
	char chuoi[] = {'A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u', '\0'};
	if(c >= 'a' && c <= 'z' or c >= 'A' && c <= 'Z') {
		int nn = 0;
		for(int i = 0; i < 10; i++) {
			if(c == chuoi[i]) {
				nn = nn + 1;
			}
		}
		if(nn == 1) {
			printf("Day la nguyen am");
		}
		if(nn == 0) {
			printf("Day la phu am");
		}
	}
	else {
		printf("Ky tu khong thuoc bang chu cai");
	}
	return 0;
}
