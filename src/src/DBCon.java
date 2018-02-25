package src;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBCon
{
  public DBCon() {}
  
  Connection con = null;
  
  public void OpenConnection() throws ClassNotFoundException {
	  Class.forName("com.mysql.jdbc.Driver");
   
	  try {
      con = con=DriverManager.getConnection
    		  ("jdbc:mysql://localhost:3306/expensedb","root","root");
      System.out.println("Connection Successful");
    }
    catch (Exception ex) {}
  }
  
  public void closeConnetion()
    throws SQLException
  {
    //con.commit();
    con.close();
  }
  
    
  public String ExecuteQury(String qry) throws IOException {
    String rstr = "Data Added Successfully!!";
    try
    {
      OpenConnection();
      
      Statement st = con.createStatement(1004, 1008);
      st.executeUpdate(qry);
      closeConnetion();
    }
    catch (Exception ee)
    {
     System.out.println(ee.getMessage().toString());
    }
    return rstr;
  }
  
  public ResultSet ExecuteSelect(String qry) {
    ResultSet rs = null;
    
    try
    {
      OpenConnection();
      Statement st = con.createStatement(1004, 1008);
      rs = st.executeQuery(qry);
    }
    catch (Exception ee) {}
    


    return rs;
  }
    
}