package src;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userMaster
 */
@WebServlet("/userMaster")
public class userMaster extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userMaster() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out =   response.getWriter();
		
		//[user,pass]
		DBCon db=new DBCon();
		try {
			db.OpenConnection();
			if(request.getParameterMap().keySet().isEmpty()){
				String qry="select uname,upwd from user_master";
				ResultSet rs=db.ExecuteSelect(qry);
				rs.first();
				request.setAttribute("user",rs.getString(1));
				request.setAttribute("pass",rs.getString(2));
				request.getRequestDispatcher("/jsp/userMaster.jsp").forward(request,response);
			}
			else{
				//[user,pass]
				String qry="update user_master set uname='"+request.getParameter("user")+"', upwd = '"+request.getParameter("pass")+"'";
				db.ExecuteQury(qry);
				db.closeConnetion();
				request.getRequestDispatcher("/jsp/index.jsp").forward(request,response);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
		out.println(e.getMessage().toString());
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
