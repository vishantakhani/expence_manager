package src;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addCategory")
public class addCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public addCategory() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out =   response.getWriter();
		if(request.getParameterMap().keySet().isEmpty())
		{	
			request.getRequestDispatcher("/jsp/Category.jsp").forward(request, response);
		}
		//[name, category, remark, add]
		String cname=request.getParameter("name").toString().trim().toUpperCase();
		
		String type=request.getParameter("category").toString();
		
		String remark=request.getParameter("remark").toString();
		
		DBCon db=new DBCon();
		
		System.out.println(cname+" "+type+" "+remark);
		
		try {
		
			db.OpenConnection();
			
			String qry1="select count(*) from category_info where cname='"+cname+"' AND ctype='"+type+"'";
			
			ResultSet rs=db.ExecuteSelect(qry1);
			
			rs.first();
			
			if(rs.getInt(1)!=0)
			{
				request.setAttribute("errorMessage", "Category Already Exist");
				request.getRequestDispatcher("/jsp/Category.jsp").forward(request,response);
				return;
			}
			
			String qry2="insert into category_info(cname,ctype,cremark) values('"+cname+"','"+type+"','"+remark+"')";
			
			db.ExecuteQury(qry2);
			
			request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
			
	
			
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
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
