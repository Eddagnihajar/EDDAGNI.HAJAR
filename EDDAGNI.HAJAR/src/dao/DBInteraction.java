package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBInteraction {
	private  static Connection Con;
	private static Statement Stm;
	public static void connect() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Con=DriverManager.getConnection("jdbc:mysql://localhost/eddagni hajar","root","");
		Stm=Con.createStatement();

	}
	public  static void disconnect() throws SQLException
	{
		Stm.close();
		Con.close();
	}
	public static int Maj(String a) throws SQLException
	{
		return Stm.executeUpdate(a);
			
	}
	public static ResultSet  select(String a) throws SQLException
	{
		return Stm.executeQuery(a);
		
		
	}

}
