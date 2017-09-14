package dbAccess;

import java.sql.*;
import java.util.*;

public class DBConnection {
	private Connection myConn;
	
	public DBConnection() throws Exception{
		String dbUrl = "jdbc:mysql://localhost:3306/db_assignment2";
		String user = "root";
		String password = "";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		myConn = DriverManager.getConnection(dbUrl,user,password);
		Statement myStmt = myConn.createStatement();
	}
	
	public boolean exists(String Query) {
		boolean result=false;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myStmt = myConn.prepareStatement(Query);
			myRs = myStmt.executeQuery();
			
			while(myRs.next()) {
				result = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String getValue(String Query) {
		String result="";
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myStmt = myConn.prepareStatement(Query);
			myRs = myStmt.executeQuery();
			
			while(myRs.next()) {
				result = myRs.getString(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList getRow(String Query) {
		ArrayList<String> result = new ArrayList<String>();
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myStmt = myConn.prepareStatement(Query);
			myRs = myStmt.executeQuery();
			while(myRs.next()) {
				ResultSetMetaData myRsmd = myRs.getMetaData();
		        for (int i = 1; i <= myRsmd.getColumnCount(); i++) {
		        	result.add(myRs.getString(i));
		    		System.out.print(myRs.getString(i));
		        }
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String executeSQL(String Query) {
		String result="";
		PreparedStatement myStmt = null;
		int myRs = 0;
		
		try {
			myStmt = myConn.prepareStatement(Query);
			myRs = myStmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static void main(String[] args) {
		ArrayList<String> result = new ArrayList<String>();
		String Formatting = new java.text.SimpleDateFormat("YMMdd").format(new java.util.Date());
		try {
			DBConnection sampleObj = new DBConnection();
			System.out.println("db object created");
			//System.out.println(sampleObj.getValue("Select Right(TicketNO,6) From tr_ticket Where TicketNO Like '"+Formatting+"%' Order By TicketNO Desc Limit 0,1"));
			//result = sampleObj.getRow("Select * From tr_ticket Where 1=1 Limit 0,1");
		    //System.out.println(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
