#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>  
#include <cctype> 
int main() {
	printf("So luong cac so can so sanh:\n");
	int n;
	scanf("%d", &n);
	
	float a[1000];
	for(int i = 1; i <= n; i++) {
		scanf("%f", &a[i]);
	}
	
	float max = a[1];
	float min = a[1];
	for(int i = 2; i <= n; i++) {
		if(a[i] > max) {
			max = a[i];
		}
		if(a[i] < min) {
			min = a[i];
		}
	}
	printf("\nSo lon nhat la %f", max);
	printf("\nSo nho nhat la %f", min);
    return (0);  
} 
