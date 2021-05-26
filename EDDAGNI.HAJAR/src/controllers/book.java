package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Book;
import models.Categorie;
import models.User;
import services.servicesBook;


/**
 * Servlet implementation class book
 */
@WebServlet("/book")
public class book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public book() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/Admin.jsp").include(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean rs=false;
		PrintWriter out=response.getWriter();
		Book b=new Book(request.getParameter("title"),request.getParameter("description"),request.getParameter("genre"),Integer.parseInt(request.getParameter("annee_edition")),Integer.parseInt(request.getParameter("isbn")),new Categorie(0, request.getParameter("nomc"),null, null),new User(0,request.getParameter("noma"),null, null,null,null));
	
			 try {
				rs=servicesBook.addBook(b);
				
		
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 if(rs==true) {
					
			
				 out.print("ajoute");
					}else {
					out.print("error");
				}
			

}
}
