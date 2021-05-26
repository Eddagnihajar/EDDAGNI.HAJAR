package models;

public class Book {
	private int id;
	private String title;
	private String description;
	private String genre;
	private int annee_edition;
	private int isbn;
	private Categorie categorie;
	private User author;
	public Book() {
		super();
	}
	public Book(int id, String title, String description, String genre, int annee_edition, int isbn,
			Categorie categorie, User author) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.genre = genre;
		this.annee_edition = annee_edition;
		this.isbn = isbn;
		this.categorie = categorie;
		this.author = author;
	}
	public Book(String title, String description, String genre, int annee_edition, int isbn, Categorie categorie,
			User author) {
		super();
		this.title = title;
		this.description = description;
		this.genre = genre;
		this.annee_edition = annee_edition;
		this.isbn = isbn;
		this.categorie = categorie;
		this.author = author;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getAnnee_edition() {
		return annee_edition;
	}
	public void setAnnee_edition(int annee_edition) {
		this.annee_edition = annee_edition;
	}
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	public Categorie getCategorie() {
		return categorie;
	}
	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}
	public User getAuthor() {
		return author;
	}
	public void setAuthor(User author) {
		this.author = author;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", title=" + title + ", description=" + description + ", genre=" + genre
				+ ", annee_edition=" + annee_edition + ", isbn=" + isbn + ", categorie=" + categorie + ", author="
				+ author + "]";
	}

	


}
