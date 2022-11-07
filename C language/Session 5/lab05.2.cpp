#include<stdio.h>
#include<math.h>

int main() {
	int n;
	scanf("%d", &n);
	int str;
	int sum = 0;
	for(;n!=0;) {
		str = n % 10;
		sum += str;
		n = n/10;
	}
	printf("%d", sum);
	return 0;
}

