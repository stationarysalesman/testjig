#include <stdio.h>
#include <math.h>
#include <inttypes.h>

int main()
{
	float f = -2.0f;
	int i = round(f);
	uint8_t u = (uint8_t) i;
	printf("i is %d\nu is %u\n", i, u);
	return 0;
}
