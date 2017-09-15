package dbAccess;

import java.util.Scanner;

public class Car {
	private static String carRegistration = null;

	public static String registerCar(String reg) {
		carRegistration = reg;
		return carRegistration;
	}
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		System.out.println("Enter Car Registration:");
		String reg = input.nextLine();
		System.out.println("You registered: "+registerCar(reg));
	}

}
