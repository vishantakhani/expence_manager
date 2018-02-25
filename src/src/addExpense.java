package src;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addExpense
 */
@WebServlet("/addExpense")
public class addExpense extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addExpense() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out =   response.getWriter();
		
		DBCon db = new DBCon();
		
		ResultSet rs=null;
		
		try {
		
			db.OpenConnection();
		
		} 
		catch (ClassNotFoundException e1) 
		{
			out.println(e1.getMessage().toString());
		}
		if (request.getParameterMap().keySet().isEmpty()) 
		{
			rs = db.ExecuteSelect("select cid,cname from category_info where ctype='expense'");
			HashMap<Integer, String> catinfo = new HashMap<Integer, String>();
			try {
				while (rs.next()) {
					catinfo.put(rs.getInt(1), rs.getString(2));
				}
			} 
			catch (SQLException e) 
			{
			out.println(e.getMessage().toString());
			}
			
			request.setAttribute("catinfo", catinfo);
			
			request.getRequestDispatcher("/jsp/expense.jsp").forward(request, response);
			
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
			
			String qry1="select "+paid+" from user_master";
			
			rs=db.ExecuteSelect(qry1);
			
			rs.first();
			
			if(rs.getInt(1)<amount)
			{
				System.out.println(rs.getInt(1)+"  "+amount);
				request.setAttribute("errorMessage", "Insufficient Balance");
				request.getRequestDispatcher("/jsp/expense.jsp").forward(request, response);
				return;
			}
			String qry2 = "insert into expense_info(cid,edate,eamount,eremark,epayby) values(" + category + ",'" + dt + "',"
					+ amount + ",'" + remark + "','"+paidby+"')";
			db.ExecuteQury(qry2);
			
			String qry3 = "update user_master set " + paid + " = " + paid + " - " + amount + "";
			db.ExecuteQury(qry3);

		} catch (Exception e) 
		{
			System.out.println(e.getMessage().toString());
		}

		
		request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
