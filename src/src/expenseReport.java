package src;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class expenseReport
 */
@WebServlet("/expenseReport")
public class expenseReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public expenseReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBCon db=new DBCon();
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		try {
			db.OpenConnection();
			String qry="SELECT SUM(e.eamount),c.cname  FROM expense_info e, category_info c WHERE c.cid=e.cid GROUP BY e.cid;";
			ResultSet rs=db.ExecuteSelect(qry);
			while(rs.next())
			{
				System.out.println(rs.getInt(1)+"   "+rs.getString(2));
				map.put(rs.getString(2),rs.getInt(1));
			}			
			request.setAttribute("map", map);
			request.getRequestDispatcher("/jsp/expenseReport.jsp").forward(request,response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
