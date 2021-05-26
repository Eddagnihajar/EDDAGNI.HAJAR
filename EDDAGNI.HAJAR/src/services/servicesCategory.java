package services;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.daoCategorie;
import models.Categorie;

public class servicesCategory {
	public static ArrayList<Categorie> AllCategories() throws ClassNotFoundException, SQLException{
		return daoCategorie.AllCategories();
	}
}
