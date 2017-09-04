<%@ page import="java.sql.*"%>

<%!
public Connection setConnection(){
	
	Connection connection = null; 
    
	try {	
	    String connectionURL = "jdbc:mysql://localhost/db_assignment2";
	    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	    connection = DriverManager.getConnection(connectionURL, "root", "");
    }catch(Exception ex){
    	System.out.println(ex);
    }   
	return connection;
}
%>

<%!
public int getRecordNumber(String Query){
	int result=0;
	
	Connection connection = null; 
    PreparedStatement pst = null;
    ResultSet rs = null;
    
	try {	
	    connection = setConnection();
		pst = connection.prepareStatement(Query);
	    rs = pst.executeQuery();  
	    while (rs.next()){
	        result++;
	    } 
    }catch(Exception ex){
    	System.out.println(ex);
    }   
	return result;
}
%>

<%!
public String getValue(String Query){
	String result="";
	
	Connection connection = null; 
    PreparedStatement pst = null;
    ResultSet rs = null;
    
	try {	
	    connection = setConnection();
		pst = connection.prepareStatement(Query);
	    rs = pst.executeQuery();  
	    while (rs.next()){
	        result=rs.getString(1);
	        return result;
	    } 
    }catch(Exception ex){
    	System.out.println(ex);
    }   
	return result;
}
%>

<%!
public void executeQuery(String Query){
	int result=0;
	
	Connection connection = null; 
    PreparedStatement pst = null;
    int rs = 0;
    
	try {	
	    connection = setConnection();
	    pst = connection.prepareStatement(Query);
	    rs = pst.executeUpdate();  
    }catch(Exception ex){
    	System.out.println(ex);
    }   
}
%>