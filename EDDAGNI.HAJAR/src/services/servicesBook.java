package services;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.daoBook;
import models.Book;



public class servicesBook {
	

	public static boolean addBook(Book b) throws ClassNotFoundException, SQLException {
		if(daoBook.verifierIsbn(b.getIsbn())==false) {
			 daoBook.addBook(b);
			  return true;
		}			
		return false;

}
	public static  ArrayList<Book> allBooks() throws ClassNotFoundException, SQLException {
		return daoBook.allBooks();
	}
	public static Book lparcatauteur(String nomauteur,String nomcat) throws ClassNotFoundException, SQLException {
    	return daoBook.livreparcatauteur(nomauteur,nomcat);
    }
}
