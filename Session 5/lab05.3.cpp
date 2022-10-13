#include<stdio.h>
#include<math.h>

int main() {
	int h;
	scanf("%d", &h);
	int n = 1;
	while(n <= h) {
		for(int i = 1; i <=n; i++) {
			printf("*");
		}
		if(n==h){
			break;
		}
		printf("\n");
		n++;
	}
	return 0;
}

