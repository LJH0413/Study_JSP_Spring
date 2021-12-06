package db;

import java.sql.*;

public class DriverTest {
	public static void main(String args[]){
        Connection con = null;
 
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC", // DB URL
                    "root", "password");  // USER_NAME과 PASSWORD
            System.out.println("Success");
        }
        catch(SQLException ex){ 
            System.out.println("SQLException" + ex);
            ex.printStackTrace();
        }
        catch(Exception ex){ 
            System.out.println("Exception:" + ex);
            ex.printStackTrace();
        }
    }

}
