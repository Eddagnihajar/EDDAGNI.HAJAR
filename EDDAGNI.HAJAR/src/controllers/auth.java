package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Role;
import models.User;
import services.servicesUser;

/**
 * Servlet implementation class auth
 */
@WebServlet("/auth")
public class auth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public auth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/authentication.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = null;
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		 u = servicesUser.authentication(email, password);
		if(u!=null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			if(u.getRole().equals(Role.STUDENT)) {
				response.sendRedirect("http://localhost:8282/EDDAGNI.HAJAR/student");
			}else {
				response.sendRedirect("http://localhost:8282/EDDAGNI.HAJAR/admin");
			}
		}else {
			response.sendRedirect("http://localhost:8282/EDDAGNI.HAJAR/auth");
			}
			
		

	}

}
