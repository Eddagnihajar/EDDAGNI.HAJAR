package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import services.servicesUser;

/**
 * Servlet implementation class CreatAcc
 */
@WebServlet("/CreatAcc")
public class CreatAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatAcc() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/CreatAccount.jsp").include(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean rs=false;
		HttpSession session = request.getSession();
		PrintWriter out=response.getWriter();
		User u=new User(request.getParameter("nom"),request.getParameter("prenom"), request.getParameter("email"),request.getParameter("password"), null);
		try {
			 rs=servicesUser.addStudent(u);
			 if(rs==true) {
					
					User u1 = (User)session.getAttribute("user");
					if(u1==null) {
						response.sendRedirect("http://localhost:8282/EDDAGNI.HAJAR/auth");
					}else {
						response.sendRedirect("http://localhost:8282/EDDAGNI.HAJAR/CreatAcc");
					}
				}else {
					out.print("error");
				}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}



			
		
		
	}


