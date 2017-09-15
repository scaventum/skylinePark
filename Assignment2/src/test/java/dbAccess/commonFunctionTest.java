package dbAccess;

import java.util.ArrayList;

import junit.framework.TestCase;

public class commonFunctionTest extends TestCase {
	int Duration = 0;
	String StartTime = null;
	commonFunction obj;
	
	protected void setUp() throws Exception {
		Duration = 120;
		StartTime = "15:50:45";
		obj = new commonFunction();
	}

	protected void tearDown() throws Exception {
		Duration = 0;
		StartTime = null;
		obj = null;
	}
	
	public void testGetFinishTime() {
		//fail("Not yet implemented");
		String expected = "17:50:45";
		String actual = obj.getFinishTime(Duration,StartTime);
		assertEquals(expected,actual);		
	}
	
	public void testGetFee() {
		//fail("Not yet implemented");
		Double expected = 1.875;
		Double actual = obj.getFee(Duration,StartTime);
		assertEquals(expected,actual);		
	}
	
	public void testGetFinishTime2() {
		//notused
	}
	
	
}
