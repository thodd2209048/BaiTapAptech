#include <stdio.h>

int countOddNumberInArray(int arr[], int n) {
	int numOdd = 0;
	for(int i = 0; i < n; i++) {
		if(arr[i] % 2 != 0) {
			numOdd++;
		}
	}
	return numOdd;
}

int main() {
	int n;
	int arr[1000];
	scanf("%d", &n);
	for (int i = 0; i < n; i++) {
		scanf("%d", &arr[i]);
	}
	printf("%d", countOddNumberInArray(arr, n));
	return 0;
}

