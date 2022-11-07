#include <stdio.h>

void sortArray(int arr[], int n) {
	int i, j, temp;
	for(i = 1; i <= n; i++) {
		temp = arr[i];
		j = i - 1;
		while(j >= 0 && temp > arr[j]) {
			arr[j+1] =  arr[j];
			j--;
		}
		arr[j+1] = temp;
	}
}

int main() {
	int n;
	int arr[1000];
	scanf("%d", &n);
	for (int i = 0; i < n; i++) {
		scanf("%d", &arr[i]);
	}
	sortArray(arr, n);
	for (int i = 0; i < n; i++) {
		printf("%d ", arr[i]);
	}

	return 0;
}

