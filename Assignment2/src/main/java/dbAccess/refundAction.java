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

public class refundAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DBConnection newConnection; 
 
    public refundAction() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btnRefund = request.getParameter("btnRefund");
		if(btnRefund!=null){
			String Formatting = "R"+new java.text.SimpleDateFormat("YMMdd").format(new java.util.Date());
			
			try {
				boolean transaction=true;
				
				newConnection = new DBConnection();
				String Autonumbering = newConnection.getValue("Select Right(RefundNO,6) From tr_refund "
						                                    + "Where RefundNO Like '"+Formatting+"%' "
						                                    + "Order By RefundNO Desc Limit 0,1");
				if (Autonumbering.equals("")) {
					Autonumbering="000001";
				}else{
					Autonumbering=String.format("%06d", (Integer.parseInt(Autonumbering)+1));
				}
				Autonumbering=Formatting+Autonumbering;
				
				String ActFinishTime=request.getParameter("txtDate")+" "+request.getParameter("txtActualFinishTime");

				if(transaction){
					String Query = "Insert Into tr_refund Values ('"+Autonumbering+"','"+request.getParameter("txtTicketNO")+"',NOW(),'"+ActFinishTime+"','"+request.getParameter("txtRefund").replace("$ ", "")+"')";
					newConnection.executeSQL(Query);

					Query = "Insert Into balance Values ('"+Autonumbering+"','"+request.getParameter("txtCarPlateNO")+"','"+request.getParameter("txtRefund").replace("$ ", "")+"',NOW())";
					newConnection.executeSQL(Query);
					request.setAttribute("CarPlateNO",request.getParameter("txtCarPlateNO"));
					request.getRequestDispatcher("balance.jsp").forward(request, response);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
