package dbAccess;

import java.sql.*;

public class DBConnection {
	private Connection myConn;
	
	public DBConnection() throws Exception{
		String dbUrl = "jdbc:mysql://localhost:3306/db_assignment2";
		String user = "root";
		String password = "";
		
		Class.forName("com.mysql.jdbc.Driver");
		myConn = DriverManager.getConnection(dbUrl,user,password);
		System.out.println("initiating database");
		Statement myStmt = myConn.createStatement();
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
	
	public String executeSQL(String Query) {
		String result="";
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myStmt = myConn.prepareStatement(Query);
			myRs = myStmt.executeQuery();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static void main(String[] args) {
		String Formatting = new java.text.SimpleDateFormat("YMMdd").format(new java.util.Date());
		try {
			DBConnection sampleObj = new DBConnection();
			System.out.println("db object created");
			System.out.println(sampleObj.getValue("Select Right(TicketNO,6) From tr_ticket Where TicketNO Like '"+Formatting+"%' Order By TicketNO Desc Limit 0,1"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
