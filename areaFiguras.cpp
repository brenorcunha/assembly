#include <iostream>
#include <math.h>
double areaTriangulo(double base, double altura){
	return (base*altura)/2;
}
double areaRetangulo(double base, double altura){
	return base*altura;
}
double perimetroRetangulo(double base, double altura){
	return (base*2)+ (altura*2);
}
double areaTrapezio(double topo, double base, double altura){
	return ((topo+base)*altura)/2;
}

int main(void){
double topo, base, altura;
int opcao;
printf("- Bem vindo ao programa de figuras geometricas: \n");
printf("Escolha a opcao desejada: \n");
printf("1 - Area do retangulo. \n");
printf("2- Area do triangulo. \n");
printf("3- Perimetro do trapezio. \n");
scanf("%d", &opcao);

if(opcao==1){
	printf("Para calculo da area do retangulo: \n");
	printf("Informe o valor da medida da base:  \n");
	scanf("%d", &base);
	printf("Informe o valor da medida da altura:  \n");
	scanf("%d", &altura);
	
	printf("Area do retangulo= %d ", areaRetangulo(base, altura));
	
} else if(opcao==2){
	printf("Para calculo da area do triangulo: \n");
	printf("Informe o valor da medida da base:  \n");
	scanf("%d", &base);
	printf("Informe o valor da medida da altura:  \n");
	scanf("%d", &altura);
	
	printf("Area do triangulo= %d ", areaTriangulo(base, altura));
} else if(opcao==3){
	printf("Para calculo da area do trapezio: \n");
	printf("Informe o valor da medida do topo:  \n");
	scanf("%d", &topo);
	printf("Informe o valor da medida da base:  \n");
	scanf("%d", &base);
	printf("Informe o valor da medida da altura:  \n");
	scanf("%d", &altura);
	
	printf("Area do trapezio= %d ", areaTrapezio(topo, base, altura));
} else {printf("Opcao incorreta!");}
}
