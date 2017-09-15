package dbAccess;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import static java.time.temporal.ChronoUnit.SECONDS;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class commonFunction
 */
public class commonFunction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static int Duration = 0;
     
    public commonFunction() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Action = request.getParameter("Action");
		
		if(Action.equals("getFinishTime")) {
			int Duration = Integer.parseInt(request.getParameter("Duration"));
			String StartTime = request.getParameter("StartTime");
			
			response.setContentType("text/plain");
			response.getWriter().write(getFinishTime(Duration,StartTime));
		}
		
		if(Action.equals("getFee")) {
			int Duration = Integer.parseInt(request.getParameter("Duration"));
			String StartTime = request.getParameter("StartTime");
			
			response.setContentType("text/plain");
			Double Fee=0.0;
			String FeeString="";
			Fee=getFee(Duration,StartTime);
			FeeString = String.valueOf(new BigDecimal(Fee).setScale(2, BigDecimal.ROUND_HALF_UP));
			response.getWriter().write(FeeString);
		}
	}
	
	public String getFinishTime(int Duration,String StartTime) {
		
		LocalTime lt = LocalTime.parse(StartTime);
		LocalTime ltlater = lt.plusMinutes(Duration);
		String endTime = ltlater.toString();
		
		return endTime;
	}

	public double getFee(int Duration,String StartTime) {
		
		LocalTime StartPark = LocalTime.parse(StartTime);
		LocalTime FinishPark = StartPark.plusMinutes(Duration);
		LocalTime StartCharge = LocalTime.parse("09:00:00");
		LocalTime FinishCharge = LocalTime.parse("17:00:00");
		long DurationAfter=0;
		double Fee=0.0;
		
		LocalTime StartAct = null;
		LocalTime FinishAct = null;
		if(StartCharge.isBefore(StartPark)) {
			StartAct = StartPark;
		}else{
			StartAct = StartCharge;
		}
		
		if(FinishCharge.isAfter(FinishPark)){
			FinishAct=FinishPark;
		}else{
			FinishAct=FinishCharge;
		}
		
		DurationAfter = StartAct.until(FinishAct, SECONDS);
		//System.out.println(DurationAfter);
		Fee=Math.ceil((double) DurationAfter/900)*0.375;
		
		return Fee;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
