package com.jdbcfetching;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCfetching {
	public static void main(String[] args) throws ClassNotFoundException, SQLException{
		Class.forName("org.postgresql.Driver");
		  Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/covid","postgres","Sweety0608@");
		  Statement st = conn.createStatement();	
	      ResultSet rs = st.executeQuery("SELECT location, Count(total_cases ) FROM latestCovidData WHERE new_cases> 1000 GROUP BY location,new_cases ORDER BY new_cases");	 
		  
					
			   while(rs.next()) {
						System.out.println(rs.getString(1)+" "+rs.getString(2));
					}
					
					conn.close();
				
	  }
  
}
