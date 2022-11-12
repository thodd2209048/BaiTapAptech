//https://www.hackerearth.com/practice/basic-programming/input-output/basics-of-input-output/practice-problems/algorithm/seven-segment-display-nov-easy-e7f87ce0/

#include<stdio.h>
#include<string.h>

int stickPerChar(char a) {
	switch (a) {
		case '0':
			return 6;
			break;
		case '1':
			return 2;
			break;
		case '2':
			return 5;
			break;
		case '3':
			return 5;
			break;
		case '4':
			return 4;
			break;
		case '5':
			return 5;
			break;
		case '6':
			return 6;
			break;
		case '7':
			return 3;
			break;
		case '8':
			return 7;
			break;
		case '9':
			return 6;
			break;																									
	}
}

int tinhStick(char n[100]) {
	int m = strlen(n);
	int i;
	int sum = 0;
	for(i = 0; i < m; i++) {
		sum = sum + stickPerChar(n[i]);
	}
	return sum;
}

void ketQua() {
	char n[100];
	scanf("%s", n);
	int stick = tinhStick(n);
	int x, y;
	int i;
	for(y = 0; y <= stick / 3;) {
		x = stick - (3 * y);
		if(x % 2 == 0){
			break;
		}
		y++;
	}
	if(y != 0) { //y chi co the mang gia tri 1 hoac 0
		printf("%d", 7);
	}
	for(i = 1; i <= x/2; i++) {
		printf("%d", 1);
	}
	printf("\n"); //xuong dong sau moi ket qua
}
	
int main() {
	int t;
	scanf("%d", &t);
	int i;
	for(i = 0; i < t; i++) {
		ketQua();
	}
	return 0;
}

