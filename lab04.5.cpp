#include<stdio.h>

int main() {
	printf("MENU\n");
	printf("================================\n");
	printf("1. CF\n");
	printf("2. C\n");
	printf("3. HDJ\n");
	printf("4. DreamWeaver\n");
	printf("5. RDBMS\n");
	printf("6. Learn Java By Example\n");
	
	int c;
	scanf("%d", &c);
	switch(c) {
		case 1:
			printf("Ban chon CF");
			break;
		case 2:
			printf("Ban chon C");
			break;
		case 3:
			printf("Ban chon HDJ");
			break;
		case 4:
			printf("Ban chon DreamWeaver");
			break;
		case 5:
			printf("Ban chon RDBMS");
			break;
		case 6:
			printf("Ban chon Learn Java By Example");
			break;
		default:
			printf("Ban chon sai");
	}
	
	return 0;
}
