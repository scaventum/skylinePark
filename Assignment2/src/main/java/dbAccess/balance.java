package dbAccess;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class balance
 */
public class balance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private DBConnection newConnection;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public balance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String Action = request.getParameter("Action");
	
	if(Action.equals("getBalance")) {
		try {
			newConnection = new DBConnection();
			String CarPlateNO = request.getParameter("CarPlateNo");
			String Balance = newConnection.getValue("Select Sum(Amout) From balance Where CarPlateNO = '"+CarPlateNO+"'");
			if (Balance.equals("")) {
				Balance="";
			}
			else {
				Balance="$"+Balance;
			}
			
			response.setContentType("text/plain");
			response.getWriter().write(Balance);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		
			
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
