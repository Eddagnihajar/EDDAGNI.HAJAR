package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Book;


public class daoBook {
	public static  ArrayList<Book> allBooks() throws ClassNotFoundException, SQLException {
		ArrayList<Book> books = new ArrayList<Book>();
		
			DBInteraction.connect();
			String sql = "select * from book ";
			ResultSet rs = DBInteraction.select(sql);
			while (rs.next()) {
				Book b = new Book(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6),null, null); 
			   b.setCategorie(daoCategorie.categorieId(rs.getInt(7)));
			   b.setAuthor(daoUser.UserId(rs.getInt(8)));
				books.add(b);
				
		}
		
		DBInteraction.disconnect();
		return books;
		
	}
	 public static Book livreparcatauteur(String nomauteur,String nomcat) throws ClassNotFoundException, SQLException {
			int x=daoUser.getIdUsByName(nomauteur);
			int y=daoCategorie.getIdCByName(nomcat);
			Book l=null;
			DBInteraction.connect();
			ResultSet res= DBInteraction.select("select * from Book where idcategorie="+y+"and idAuthor="+x );
			
			l=new Book(res.getInt(1),res.getString(2),res.getString(3),res.getString(4),res.getInt(5),res.getInt(6),null,null);

			l.setCategorie(daoCategorie.categorieId(res.getInt(7)));
			l.setAuthor(daoUser.UserId(res.getInt(8)));
			return  l;
			
		}
	public static boolean verifierIsbn(int isbn) throws SQLException, ClassNotFoundException {
		boolean exist=false;
		DBInteraction.connect();
		ResultSet res= DBInteraction.select("select *from book where isbn="+isbn);
		if(res.next()) {
			exist=true;
		}
		DBInteraction.disconnect();
		return exist;
		
	}
	public static boolean addBook(Book b) throws ClassNotFoundException, SQLException {
		int idc=daoCategorie.getIdCByName(b.getCategorie().getNom());
		int idAu=daoUser.getIdUsByName(b.getAuthor().getNom());
		DBInteraction.connect();
		int res= DBInteraction.Maj("insert into book(title,description,genre,annee_edition,isbn,idCategorie,idAuthor) values ('"+b.getTitle()+"','"+b.getDescription()+"','"+b.getGenre()+"',"+b.getAnnee_edition()+","+b.getIsbn()+","+idc+","+idAu+")");
		DBInteraction.disconnect();
		return res ==1? true:false;
		
	}
	public static int addBookFromStudent(int student_id,int book_id) {
		int n = 0;
		
		try {
			DBInteraction.connect();
			n = DBInteraction.Maj("update reservation set  idStudent=" +student_id+" where idBook="+book_id );
			DBInteraction.disconnect();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	public int returnBookToBiblio(int id) {
		int nb = 0;
		
		try {
			DBInteraction.connect();
			nb = DBInteraction.Maj("update book set student_id = "+null+" where id=" + id);
			DBInteraction.disconnect();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nb;
	}
	public List<Book> allBooksAvailable() {
		List<Book> ab = new ArrayList<Book>();
		try {
			DBInteraction.connect();
			String sql = "select * from book where student_id is "+ null;
			ResultSet rs = DBInteraction.select(sql);
			while (rs.next()) {
				Book b = new Book();
			b.setId(rs.getInt(1));
			b.setGenre(rs.getString(2));
			b.setCategorie(rs.getString(3));
			b.setAuthor(rs.getString(4));
			ab.add(b);
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ab;
		
	}
	public int deleteBook(int id) {
		int nb = 0;

		try {
			DBInteraction.connect();
			nb = DBInteraction.Maj("delete from book where id=" + id);
			DBInteraction.disconnect();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nb;
	}
	}
