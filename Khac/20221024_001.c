#include<stdio.h>
#include<stdlib.h>//thu vien cho cap phat bo nho dong
//Function => Hàm d? chia nh? chuong trình ra thành nhi?u ph?n nh? hon
//Phân rã chuong trình
//=> D? code, d? s?a l?i, d? b?o trì, d? d?c => Ph?i dùng.
int * a;
int n;
void initArray(){
    printf("\nNhap so luong phan tu\n");
    scanf("%d", &n);
    a = (int*)malloc(n * sizeof(int));
    if(a == NULL) {
    	printf("Cap phat bo nho khong thanh cong\n");
    	exit(0);
	}
	else {
		printf("Cap phat bo nho THANH CONG\n");
	}
	int i;
	printf("Nhap cac phan tu cua mang\n");
	for(i = 0; i < n; i++) {
		scanf("%d", &a[i]);
	}
}
void findMax(int * a, int n){
	int i, max;
	max = a[0];
	for(i = 1; i < n; i++) {
		if(a[i] > max) {
			max = a[i];
		}
	}
    printf("\nSo Max la: %d\n", max);
}

void findMin(int * a, int n){
	int i, min;
	min = a[0];
	for(i = 1; i < n; i++) {
		if(a[i] < min) {
			min = a[i];
		}
	}
    printf("\nSo Min la: %d\n", min);
}

void sortAsc(int a[], int n){
	int i, j, temp;
	for(i = 1; i < n; i++) {
		temp = a[i];
		j = i - 1;
		while(j >= 0 && temp > a[j]) {
			a[j+1] = a[j];
			j--;
		}
		a[j+1] = temp;
	}
	printf("Mang sau khi sap xep\n");
	for(i = 0; i < n; i++) {
    printf("%d ", a[i]);		
	}
}

void sortDesc(int * a, int n){
	int i, j, temp;
	for(i = 1; i < n; i++) {
		temp = a[i];
		j = i - 1;
		while(j >= 0 && temp < a[j]) {
			a[j+1] = a[j];
			j--;
		}
		a[j+1] = temp;
	}
	printf("Mang sau khi sap xep\n");
	for(i = 0; i < n; i++) {
    printf("%d ", a[i]);		
	}

}

void findByValue(int a[], int n){
    int i, j, fValue;
    int b[n];
    int numOfResult = 0;
    j = 0;
    printf("Enter the value to be searched: ");
    scanf("%d", &fValue);
    for(i = 0; i < n; i++) {
    	if(a[i] == fValue) {
    		numOfResult++;
    		b[j] = i;
    		j++;
		}
	}
	if(numOfResult == 0) {
		printf("\nValue %d not found.", fValue);
	}
	else {
		printf("The value %d is found at the location: ", fValue);
		for(j = 0; j < numOfResult; j++) {
			printf("%d ", b[j] + 1);
		}
	}
}


void menu(){
    int ch;
    while(1){
        printf("\n\t\tFunctions\n");
        printf("\n1. Init Arry");
        printf("\n2. findMax");
        printf("\n3. findMin");
        printf("\n4. sortAsc");
        printf("\n5. sortDesc");
        printf("\n6. findByValue");
        printf("\n7. Exit");
        printf("\nEnter your choice: ");
        scanf("\n %d",&ch);
       
        switch(ch){
            case 1: initArray();
                break;
            case 2: findMax(a, n);
                break;
            case 3: findMin(a, n);
                break;
            case 4: sortAsc(a, n);//ch? có dc c?a m?ng du?c truy?n vào
                break;
            case 5: sortDesc(a, n);
                break;
            case 6: findByValue(a, n);
                break;
            case 7:
                exit(0);
        }
    }
   
}

int main(){
    menu();
    return 0;
}

