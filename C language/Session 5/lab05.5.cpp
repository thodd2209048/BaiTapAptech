#include<stdio.h>
#include<cctype>
#include<stdbool.h>
#include<stdlib.h>
#include<math.h>

int main() {
	int result = 0;
	int n;
	do {
		scanf("%d", &n);
		if(n >= 0 && n <= 100) {
			result++;
		}
	}
	while(n >= 0 && n <= 100);
	printf("%d", result);
	return 0;
}

