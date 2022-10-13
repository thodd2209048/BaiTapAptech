#include<stdio.h>
#include<math.h>

int main() {
	float a, b, c;
	scanf("%f %f %f", &a, &b, &c);
	float delta;
	delta = pow(b,2) - 4 * a * c;
	if(delta < 0) {
		printf("Phuong trinh vo nghiem");
	}
	if(delta == 0) {
		printf("Phuong trinh co nghiem kep: %f", -b/a);
	}
	if(delta > 0) {
		printf("Phuong trinh co hai nghiem %f va %f", (- b - sqrt(delta)) / 2 / a , (- b + sqrt(delta)) / 2 / a );
	}
	
	return 0;
}
