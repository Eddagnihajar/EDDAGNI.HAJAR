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
import services.servicesBook;


/**
 * Servlet implementation class AfficherLivre
 */
@WebServlet("/AfficherLivre")
public class AfficherLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfficherLivre() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Book l=null;
		PrintWriter out = response.getWriter();
		String nomauteur=request.getParameter("nomautho");
	    String nomcategorie=request.getParameter("nomcategy");
	    
		try {
		 l=servicesBook.lparcatauteur(nomauteur, nomcategorie);
		 out.print(l);
			if(l!=null) {
				response.sendRedirect("http://localhost:8282/Apprentissage/AllBook.jsp");
				}else {
					out.print("pas du ");
				}
		
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
