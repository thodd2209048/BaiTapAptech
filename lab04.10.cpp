#include<stdio.h>
#include<math.h>

int main() {
	float a;
	printf("CHUYEN DOI DON VI DO DAI\nNhap do dai theo m:\n");
	scanf("%f", &a);
	printf("\nChon mot don vi do dai de chuyen doi.");
	printf("\n1.	mm");
	printf("\n2.	cm");
	printf("\n3.	dm");
	printf("\n4.	km\n");
	int b;
	scanf("%d", &b);
	switch (b) {
		case (1):
			printf("\nChieu dai tinh theo mm: %f", a * 1000);
			break;
		case (2):
			printf("\nChieu dai tinh theo cm: %f", a * 100);
			break;
		case (3):
			printf("\nChieu dai tinh theo dm: %f", a * 10);
			break;
		case (4):
			printf("\nChieu dai tinh theo km: %f", a * 0.001);
			break;
	}
	return 0;
}
