
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.Role;
import models.User;


public class daoUser {
	
	public static boolean verifierEmail(String email) throws SQLException, ClassNotFoundException {
		boolean exist=false;
		DBInteraction.connect();
		ResultSet res= DBInteraction.select("select *from user where email='"+email+"' ");
		if(res.next()) {
			exist=true;
		}
		DBInteraction.disconnect();
		return exist;
		
	}
	public static boolean addStudent(User u) throws ClassNotFoundException, SQLException {
		DBInteraction.connect();
		int res= DBInteraction.Maj("insert into user(nom,prenom,email,password,role) values ('"+u.getNom()+"','"+u.getPrenom()+"','"+u.getEmail()+"','"+u.getPassword()+"','student')");
		DBInteraction.disconnect();
		return res ==1? true:false;
		
	}
	
	public static User authentication(String email, String password){
		User u=null;
		try {
			DBInteraction.connect();
			ResultSet rs = DBInteraction.select("select * from user where email='"+email+"' and password='"+password+"'");
			if(rs.next())
			{
				u=new User();
				u.setId(rs.getInt(1));
				u.setNom(rs.getString(2));
				u.setPrenom(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setPassword(rs.getString(5));
				
				if(rs.getString(6).equals("student")) {
					u.setRole(Role.STUDENT);
				} else if(rs.getString(6).equals("admin")) {
					u.setRole(Role.ADMIN);
				}else {
					u.setRole(Role.AUTHOR);
				}
			}

				
			
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return u;
		
	}

	public static ArrayList<User> AllAuthor() throws ClassNotFoundException, SQLException{
		ArrayList<User> Users = new ArrayList<User>();
		DBInteraction.connect();
		ResultSet rs = DBInteraction.select("select * from user where role='author'");
		while(rs.next()) {
		User u=new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), Role.AUTHOR);
		Users.add(u);
		}
		DBInteraction.disconnect();
		return Users;
		}
	public static int getIdUsByName(String nom) throws ClassNotFoundException, SQLException {
		int idper=0;
		DBInteraction.connect();
		ResultSet res = DBInteraction.select("select id from user where nom='"+nom+"'");
		if(res.next()) {
		idper=res.getInt(1);
		}
		DBInteraction.disconnect();
		return idper;
		}
	public static User UserId(int id) throws ClassNotFoundException, SQLException {
		User u=null;
		DBInteraction.connect();
		ResultSet res = DBInteraction.select("select * from user where id="+id);
		if(res.next()) {
		u=new User(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), null);
		if(res.getString(6).equals("student")) {
		u.setRole(Role.STUDENT);
		} else if(res.getString(6).equals("admin")) {
		u.setRole(Role.ADMIN);
		}else {
		u.setRole(Role.AUTHOR);
		}
		}
		DBInteraction.disconnect();
		return u;
		}

	public int deleteUser(int id) {
		int nb = 0;

		try {
			DBInteraction.connect();
			nb = DBInteraction.Maj("delete from user where id=" + id);
			DBInteraction.disconnect();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nb;
	}

}
