package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.Categorie;

public class daoCategorie {
	public static ArrayList<Categorie> AllCategories() throws ClassNotFoundException, SQLException{
		ArrayList<Categorie> categories = new ArrayList<Categorie>();
		DBInteraction.connect();
		ResultSet res = DBInteraction.select("select * from categorie");
		while(res.next()) {
		Categorie c=new Categorie(res.getInt(1), res.getString(2), res.getString(3), null);
		categories.add(c);
		}
		DBInteraction.disconnect();
		return categories;
		}
	public static int getIdCByName(String nom) throws ClassNotFoundException, SQLException {
		int idcat=0;
		DBInteraction.connect();
		ResultSet res = DBInteraction.select("select id from categorie where nom='"+nom+"'");
		if(res.next()) {
		idcat = res.getInt(1);
		}
		DBInteraction.disconnect();
		return idcat;
		}
	public static Categorie categorieId(int id) throws ClassNotFoundException, SQLException {
		Categorie c=null;
		DBInteraction.connect();
		ResultSet res = DBInteraction.select("select * from categorie where id="+id);
		if(res.next()) {
		c=new Categorie(res.getInt(1), res.getString(2), res.getString(3), null);
		}
		DBInteraction.disconnect();
		return c;
		}
	
		

	

}
