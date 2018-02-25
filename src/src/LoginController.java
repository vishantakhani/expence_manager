package src;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */ 
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     	PrintWriter out =   response.getWriter();
	
		String uname = request.getParameter("uname").toString();
		String password = request.getParameter("password").toString();
		DBCon db=new DBCon();
		
		try {
		
			db.OpenConnection();
			  String qry="select upwd from user_master where uname='"+uname+"'";
				ResultSet rs=db.ExecuteSelect(qry);
		    	if(!rs.next()){
		    		request.setAttribute("errorMessage", "User Not Exist ");
					request.getRequestDispatcher("/jsp/login.jsp").forward(request,response);
					
		    	}
		    	rs.first();
		    	if(rs.getString(1).equals(password)){
		    		request.getRequestDispatcher("index").forward(request,response);

	    	}
		    	else{
		    		request.setAttribute("errorMessage", "Enter Valid Username And Password ");
					request.getRequestDispatcher("/jsp/login.jsp").forward(request,response);
			 	}
		 
		} catch (ClassNotFoundException | SQLException e) {

			System.out.println(e.getMessage().toString());
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
