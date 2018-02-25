package src;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addIncome
 */
@WebServlet("/addIncome")
public class addIncome extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addIncome() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		DBCon db = new DBCon();
		
		try {
			db.OpenConnection();
		} catch (ClassNotFoundException e1) 
		{
		    out.println(e1.getMessage().toString());
		}
		if (request.getParameterMap().keySet().isEmpty()) 
		{
			ResultSet rs = db.ExecuteSelect("select cid,cname from category_info where ctype='income'");
		
			HashMap<Integer, String> catinfo = new HashMap<Integer, String>();
			
			try {
			
				while (rs.next()) {
				
					catinfo.put(rs.getInt(1), rs.getString(2));
				}
				
			} catch (SQLException e) 
			{
				out.println(e.getMessage().toString());
			}
			request.setAttribute("catinfo", catinfo);
			request.getRequestDispatcher("/jsp/income.jsp").forward(request, response);
			return;

		}
		// [date, category, amount, paidby, remark, Save]
		
		String dt = request.getParameter("date"); // yyyy-mm-dd
		String category = request.getParameter("category");
		int amount = Integer.parseInt(request.getParameter("amount").toString().trim());
		String paidby = request.getParameter("paidby");
		String remark = request.getParameter("remark");
		
		try {
			
			String paid = "";
			if (paidby.toUpperCase().equals("CASH"))
				paid = "ucash";
			else
				paid = "ubank";

			String qry1 = "insert into income_info(cid,idate,iamount,iremark,ipayby) values(" + category + ",'" + dt + "',"
					+ amount + ",'" + remark + "','"+paidby+"')";
			db.ExecuteQury(qry1);
			String qry2 = "update user_master set " + paid + " = " + paid + " + " + amount + "";
			db.ExecuteQury(qry2);

		} catch (Exception e) 
		{
			out.println(e.getMessage().toString());
		}


		request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
