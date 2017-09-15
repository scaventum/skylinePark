package dbAccess;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.Scanner;

public class ParkingTimes {
	static int timeToPark = 0;
	
	public static String startTime() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		
		return sdf.format(cal.getTime());
	}
	
	public static String endTime(int min) {
		timeToPark = min;
		LocalTime lt = LocalTime.parse(startTime());
		LocalTime ltlater = lt.plusMinutes(timeToPark);
		String endTime = ltlater.toString();
		
		return endTime;
	}
	
	/*public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.println("Enter duration (minutes):");
		int minutes = input.nextInt();
		System.out.println("Start Time: "+startTime());
		System.out.println("End Time: "+endTime(minutes));
		
	}*/

}
