package dbAccess;

import java.sql.SQLException;
import java.util.ArrayList;

import junit.framework.Assert;
import junit.framework.TestCase;

public class DBConnectionTest extends TestCase {

	String Query = null;
	DBConnection obj;
	
	protected void setUp() throws Exception {
		Query = "";
		obj=new DBConnection();
	}

	protected void tearDown() throws Exception {
		Query = null;
		obj = null;
	}

	public void testExists() {
		Query = "Select * From balance Where CarPlateNO = 'CBR250' ";
		//boolean expected = true;
		boolean actual = obj.exists(Query);
		assertTrue(actual);
	}

	public void testGetValue() {
		Query = "Select Sum(Amount) From balance Where CarPlateNO = 'CBR250'";
		String expected = "0.75";
		String actual = obj.getValue(Query);
		assertEquals(expected,actual);
	}

	public void testGetRow() {
		Query = "Select * From balance Where CarPlateNO = 'CBR250' ";
		/*ArrayList<String> expected = new ArrayList<String>() {{
			add("R20170915000001");
		    add("CBR250");
		    add("0.75");
		    add("2017-09-15 11:58:13");
		}};*/
		ArrayList actual = obj.getRow(Query);
		assertNotNull(actual);
	}

	public void testExecuteSQL() {
		Query = "Insert into balance values ('TESTZ','TESTZ','0.00',NOW())";
		int expected = 1;
		int actual = obj.executeSQL(Query);
		assertEquals(expected,actual);
		
	}
	
	

}
