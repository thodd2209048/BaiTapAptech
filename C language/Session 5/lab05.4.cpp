#include<stdio.h>
#include<math.h>

int main() {

	char c;
	scanf("%c", &c);
		if(c >= 48 && c <= 57) {
			printf("%c la chu so", c);
		}
		else if(c >= 65 && c <= 90) {
			printf("%c la chu cai", c);
		}
		else if(c >= 97 && c <= 122) {
			printf("%c la chu cai", c);
		}
		else if (c != 32){
			printf(" %c la ky tu dac biet", c);
		}
	return 0;
}

