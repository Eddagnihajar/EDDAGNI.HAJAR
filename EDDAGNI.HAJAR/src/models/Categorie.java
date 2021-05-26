package models;

import java.util.ArrayList;

public class Categorie {

	private int id;
	private String nom;
	private String description;
	private ArrayList<Book> books;
	
	public Categorie() {
		super();
	}
	public Categorie(int id, String nom, String description, ArrayList<Book> books) {
		super();
		this.id = id;
		this.nom = nom;
		this.description = description;
		this.books = books;
	}
	public Categorie(String nom, String description, ArrayList<Book> books) {
		super();
		this.nom = nom;
		this.description = description;
		this.books = books;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public ArrayList<Book> getBooks() {
		return books;
	}
	public void setBooks(ArrayList<Book> books) {
		this.books = books;
	}
	@Override
	public String toString() {
		return "Categorie [id=" + id + ", nom=" + nom + ", description=" + description + ", books=" + books + "]";
	}
	
	

}
