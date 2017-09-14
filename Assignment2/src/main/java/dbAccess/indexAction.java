package dbAccess;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dbAccess.DBConnection;

public class indexAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DBConnection newConnection;  
    public indexAction() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btnDisplay = request.getParameter("btnDisplay");
		String btnRefund = request.getParameter("btnRefund");
		
		if(btnDisplay!=null){
			
			try {
				ArrayList<String> TicketHD = new ArrayList<String>();
				boolean transaction=false;
				newConnection = new DBConnection();
				String Query = "Select * From tr_ticket "
                             + "Where TicketNO = '"+request.getParameter("txtTicketNO")+"' ";
				if (newConnection.exists(Query)) {
					TicketHD = newConnection.getRow(Query);
					transaction=true;
				}
				
				if(transaction){
					request.setAttribute("TicketNO",TicketHD.get(0));
					request.setAttribute("CarPlateNO",TicketHD.get(1));
					request.setAttribute("StartTime",TicketHD.get(2));
					request.setAttribute("EndTime",TicketHD.get(3));
					request.setAttribute("Fee",TicketHD.get(4));
					request.setAttribute("TransTime",TicketHD.get(5));

					request.getRequestDispatcher("display.jsp").forward(request, response);
					//response.sendRedirect("display.jsp?TicketNO="+request.getParameter("txtTicketNO"));
				}else {
					response.sendRedirect("index.jsp?alert=inv_ticket");
					
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(btnRefund!=null){
			
			try {
				String Alert="";
				ArrayList<String> TicketHD = new ArrayList<String>();
				boolean transaction=true;
				newConnection = new DBConnection();
				String Query = "Select * From tr_ticket "
                             + "Where TicketNO = '"+request.getParameter("txtTicketNO")+"' ";
				if (!newConnection.exists(Query)) {
					TicketHD = newConnection.getRow(Query);
					transaction=false;
					Alert="inv_ticket";
				}
				
				Query = "Select * From tr_refund "
                      + "Where TicketNO = '"+request.getParameter("txtTicketNO")+"' ";
				if (newConnection.exists(Query)) {
					transaction=false;
					Alert="ref_ticket";
				}
				Query = "Select * From tr_ticket "
                        + "Where TicketNO = '"+request.getParameter("txtTicketNO")+"' ";
				TicketHD = newConnection.getRow(Query);
				
				if(transaction){
					request.setAttribute("TicketNO",TicketHD.get(0));
					request.setAttribute("CarPlateNO",TicketHD.get(1));
					request.setAttribute("StartTime",TicketHD.get(2));
					request.setAttribute("EndTime",TicketHD.get(3));
					request.setAttribute("Fee",TicketHD.get(4));
					request.setAttribute("TransTime",TicketHD.get(5));

					request.getRequestDispatcher("refund.jsp").forward(request, response);
					//response.sendRedirect("display.jsp?TicketNO="+request.getParameter("txtTicketNO"));
				}else {
					response.sendRedirect("index.jsp?alert="+Alert);
					
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
