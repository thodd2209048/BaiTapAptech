#include <iostream>
#include<string.h>

int main () {
	char a[80];
	scanf("%s", a);
	int len;
	len = strlen(a);

	
	int ketqua = 0;
	for(int i = 0; i <= len/2; i++) {
		if(*(a + i) != *(a + len - 1 - i)){
			ketqua++;
		}
	}
	if(ketqua != 0) {
		printf("Chuoi la khong doi xung");
	}
	else {
		printf("Chuoi la doi xung");
	}
	
	return 0;
}
