/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package metodosEstaticos;
 
import java.util.Scanner;

public class Matematica {

public static double areaRetangulo(double base, double altura){
return base*altura;
}
public static double perimetroRetangulo(double base, double altura){
return (base*2)+ (altura*2);
}
public static double areaTriangulo(double base, double altura){
return (base*altura)/2;
}
public static double areaTrapezio(double topo, double base, double altura){
return ((topo+base)*altura)/2;
}

    public static void main(String[] args) {
		int op, op2 = 1;
        double topo, base, altura;
        Scanner e = new Scanner(System.in);
		
		do{
		System.out.println("- Bem vindo ao programa de figuras geometricas: ");
		System.out.println("Escolha a opcao desejada: ");
		System.out.println("1 - Area e perimetro do retangulo: ");
		System.out.println("2- Area do triangulo: ");
		System.out.println("3- Perimetro do trapezio: ");
		op = e.nextInt();
		
		switch(op){
		case 1:
		System.out.println("- Para calculo da area e perimetro do retangulo: ");
		System.out.println("Informe o valor da base: ");
		base = e.nextDouble();
		System.out.println("Informe o valor da altura: ");
		altura = e.nextDouble();
		System.out.println("areaRetangulo= "+ areaRetangulo(base, altura));
		System.out.println("perimetroRetangulo= "+ perimetroRetangulo(base, altura));
		break;
          
		case 2:
		System.out.println("- Para calculo da area do triangulo: ");
		System.out.println("Informe o valor da base: ");
		base = e.nextDouble();
		System.out.println("Informe o valor da altura: ");
		altura = e.nextDouble();
		System.out.println("areaTriangulo= "+ areaTriangulo(base, altura));
		break;
        
		case 3:
		System.out.println("- Para calculo da area do trapezio: ");
		System.out.println("Informe o valor do TOPO: ");
		topo = e.nextDouble();
		System.out.println("Informe o valor da BASE: ");
		base = e.nextDouble();
		System.out.println("Informe o valor da altura: ");
		altura = e.nextDouble();
		System.out.println("areaTrapezio= "+ areaTrapezio(topo, base, altura) + " cm quadrados.");
		break;
        
		default:
		System.out.println("Opção incorreta!");
		break;
		}
		
		System.out.println("Quer fazer outra operacao? 1=Sim/2=Não");
		op2 = e.nextInt();
		} while (op2 == 1);

    }
}
