#include<stdio.h>

int main() {
	int arr[1000];
	int n = 0;
	int x;
	while(1)
	{
		printf("Enter element number %d: ",n+1);
		scanf("%d", &arr[n]);
		if(arr[n] == 0)
		break;
		else
		n++;
	}
	printf("Entered elements: \n");
	for(int i = 0; i < n; i++) {
		printf("%d " , arr[i]);
	}
	
	printf("\nEnter element for searching: \n");
	scanf("%d", &x);
	
	int j = 0;
	for(; j < n;) {
		if(arr[j] != x) {
			j++;
		}
		else {
			break;
		}
	}
	if(j == n) {
		printf("Number %d not found",x);
}
	else {
			printf("Number %d found at position %d",x,j+1);
	}

	return 0;
 }
