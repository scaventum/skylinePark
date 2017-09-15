package dbAccess;

import java.util.Scanner;

public class computeParkingFee {
	static double baseRate;
	static double totalAmount;
	static int length;
	
	public computeParkingFee() {
		baseRate = 1.5;
		totalAmount = 0;
	}
	
	public static double calculateFee() {
		ParkingTimes obj = new ParkingTimes();
		length = obj.timeToPark;
		
		totalAmount = length/60 * baseRate;
		
		return totalAmount;
	}

	public static void main(String[] args) {
		ParkingTimes obj = new ParkingTimes();
		Scanner input = new Scanner(System.in);
		
		System.out.println("Enter duration (minutes):");
		int minutes = input.nextInt();
		obj.startTime();
		obj.endTime(minutes);
		System.out.println("Parking Fee: $ "+calculateFee());
		//System.out.println("Start Time: "+startTime());
		//System.out.println("End Time: "+endTime(minutes));
	}

}
