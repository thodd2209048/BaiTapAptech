#include<stdio.h>
#include<math.h>

int main() {
	float a[1000];
	for(int i = 1; i <= 3; i++){
		scanf("%f", &a[i]);
	}
	float temp = 0;
	for(int i = 1; i <= 2; i++) {
		if(a[i] > a[i+1]) {
			temp = a[i];
			a[i] = a[i+1];
			a[i+1] = temp;
		}
	}
	
	for(int i = 1; i <= 3; i++) {
		printf("%f ", a[i]);
	}
	return 0;
}
