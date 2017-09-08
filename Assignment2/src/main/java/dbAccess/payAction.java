package dbAccess;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dbAccess.DBConnection;

public class payAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	private DBConnection newConnection;
    public payAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btnPay = request.getParameter("btnPay");
		if(btnPay!=null){
			String Formatting = new java.text.SimpleDateFormat("YMMdd").format(new java.util.Date());
			
			try {
				newConnection = new DBConnection();
				String Autonumbering = newConnection.getValue("Select Right(TicketNO,6) From tr_ticket "
						                                    + "Where TicketNO Like '"+Formatting+"%' "
						                                    + "Order By TicketNO Desc Limit 0,1");
				if (Autonumbering.equals("")) {
					Autonumbering="000001";
				}else{
					Autonumbering=String.format("%06d", (Integer.parseInt(Autonumbering)+1));
				}
				Autonumbering=Formatting+Autonumbering;
				boolean transaction=false;
				
				String StartTime=new java.text.SimpleDateFormat("Y-MM-dd").format(new java.util.Date())+" "+request.getParameter("txtStartTime");
				String FinishTime=new java.text.SimpleDateFormat("Y-MM-dd").format(new java.util.Date())+" "+request.getParameter("txtFinishTime");
				transaction=true;
				if(transaction){
					String Query = "Insert Into tr_ticket Values ('"+Autonumbering+"','"+request.getParameter("txtCarPlateNO").toUpperCase()+"','"+StartTime+"','"+FinishTime+"','"+request.getParameter("txtFee").replace("$ ", "")+"',NOW())";
					newConnection.executeSQL(Query);
					response.sendRedirect("display.jsp?TicketNO="+Autonumbering);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}