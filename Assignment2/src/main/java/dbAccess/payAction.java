package dbAccess;

import java.io.IOException;
import java.sql.*;
import java.time.LocalTime;
import java.util.ArrayList;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Action = request.getParameter("Action");
		
		if(Action.equals("getBalance")) {
			try {
				newConnection = new DBConnection();
				String CarPlateNO = request.getParameter("CarPlateNO");
				String Balance = newConnection.getValue("Select Sum(Amount) From balance Where CarPlateNO = '"+CarPlateNO+"' ");
				if(Balance.equals("")) {
					Balance="";
				}else {
					Balance="$ "+Balance;
				}
				response.setContentType("text/plain");
				response.getWriter().write(Balance);
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

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
					Double Fee = Double.parseDouble(request.getParameter("txtFee").replace("$ ", ""));
					Double Balance = 0.00;
					Double NettFee = 0.00;
					Double BalanceShift = 0.00;
					if(!request.getParameter("txtBalance").equals("")) {
						Balance=Double.parseDouble(request.getParameter("txtBalance").replace("$ ", ""));	
					}
					if(Fee>Balance) {
						NettFee = Fee - Balance;
						BalanceShift = Balance*(-1);
					}else {
						NettFee = 0.00;
						BalanceShift = Fee*(-1);
					}
					String Query = "Insert Into tr_ticket Values ('"+Autonumbering+"','"+request.getParameter("txtCarPlateNO").toUpperCase()+"', "
							     + "'"+StartTime+"','"+FinishTime+"',"+NettFee+",NOW())";
					newConnection.executeSQL(Query);
					
					if(BalanceShift!=0) {
						Query = "Insert Into balance Values ('"+Autonumbering+"','"+request.getParameter("txtCarPlateNO").toUpperCase()+"',"+BalanceShift+",NOW())";
						newConnection.executeSQL(Query);
					}
					//response.sendRedirect("display.jsp?TicketNO="+Autonumbering);
					
					ArrayList<String> TicketHD = new ArrayList<String>();
					Query = "Select * From tr_ticket "
	                             + "Where TicketNO = '"+Autonumbering+"' ";
						TicketHD = newConnection.getRow(Query);
						request.setAttribute("TicketNO",TicketHD.get(0));
						request.setAttribute("CarPlateNO",TicketHD.get(1));
						request.setAttribute("StartTime",TicketHD.get(2));
						request.setAttribute("EndTime",TicketHD.get(3));
						request.setAttribute("Fee",TicketHD.get(4));
						
						
						request.setAttribute("TransTime",TicketHD.get(5));

						request.getRequestDispatcher("display.jsp").forward(request, response);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
