package services;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.daoUser;
import models.User;



public class servicesUser {
	public static boolean addStudent(User u) throws ClassNotFoundException, SQLException {
		if(daoUser.verifierEmail(u.getEmail())==false) {
			 daoUser.addStudent(u);
			  return true;
		}			
		return false;

	}
	public static User authentication(String email, String password) {
		return daoUser.authentication(email, password);
	}
	public static ArrayList<User> AllAuthor() throws ClassNotFoundException, SQLException{
		return daoUser.AllAuthor();
	}
}
