package src;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class transferMoney
 */
@WebServlet("/transferMoney")
public class transferMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public transferMoney() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out =   response.getWriter();
		
		if(request.getParameterMap().keySet().isEmpty())
		{	
			request.getRequestDispatcher("/jsp/transfer.jsp").forward(request, response);
		}
	else{
		//[tdate, from, amount, remark, Save]
		
		DBCon db=new DBCon();
		
		try {
			db.OpenConnection();
			String from=request.getParameter("from");
			String to="";
			int amount = Integer.parseInt(request.getParameter("amount").toString().trim());
			if(from.toUpperCase().equals("CASH")) {
            from="ucash";
            to="ubank";
				}
			else{
				from="ubank";
				to="ucash";
				}
			
			
				String qry1="select "+from+" from user_master";
				ResultSet rs=db.ExecuteSelect(qry1);
				rs.first();
				if(rs.getInt(1)<amount){
					System.out.println(rs.getInt(1)+"  "+amount);
					request.setAttribute("errorMessage", "Insufficient Balance");
					request.getRequestDispatcher("/jsp/transfer.jsp").forward(request,response);
					return;
				}
				String qry2="update user_master set "+from+" = "+from+" - "+amount+" , "+to+" = "+to+" + "+amount;
                 db.ExecuteQury(qry2);
						
		} catch (ClassNotFoundException | SQLException e) {
			 out.println(e.getMessage().toString());
		}
		
		request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
		
	
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
