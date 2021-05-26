<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import=" models.User"%>

    <%@page import=" models.Role"%>
   <% User u = (User)session.getAttribute("user"); 
if(u!=null){
	if(u.getRole().equals(Role.ADMIN)){
	response.sendRedirect("http://localhost:8282/EDDAGNI.HAJAR/auth");
	}else{
		response.sendRedirect("http://localhost:8282/EDDAGNI.HAJAR/auth");
		
	}
	

}else{

%>
    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CreatAccount</title>
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    
    <link rel="shortcut icon" href="assets/images/book.png" type="image/x-icon">
    <link rel="stylesheet" href="assets/css/app.css">
</head>

<body>
    <div id="auth">
        
<div class="container">
    <div class="row">
        <div class="col-md-7 col-sm-12 mx-auto">
            <div class="card pt-4">
                <div class="card-body">
                    <div class="text-center mb-5">
                        <img src="assets/images/book.png" height="60" class='mb-4'>
                        <h3>Sign Up</h3>
                        <p>Please fill the form to register</p>
                    </div>
                    <form action="CreatAcc" method="post">
                        <div class="row">
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="first-name-column">First Name</label>
                                    <input type="text" id="first-name-column" class="form-control"  name="nom">
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="last-name-column">Last Name</label>
                                    <input type="text" id="last-name-column" class="form-control"  name="prenom">
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="username-column">Email</label>
                                    <input type="email" id="username-column" class="form-control" name="email">
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label for="country-floating">Password</label>
                                    <input type="password" id="country-floating" class="form-control" name="password">
                                </div>
                            </div>
                           
                           
                        </diV>

                                <a href="authentication.jsp">Have an account? Login</a>
                        <div class="clearfix">
                            <button type="submit" class="btn btn-primary float-right">Register</button>
                        </div>
                    </form>
                    <div class="divider">
                        <div class="divider-text">OR</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <button class="btn btn-block mb-2 btn-primary"><i data-feather="facebook"></i> Facebook</button>
                        </div>
                        <div class="col-sm-6">
                            <button class="btn btn-block mb-2 btn-secondary"><i data-feather="github"></i> Github</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    </div>
    <script src="assets/js/feather-icons/feather.min.js"></script>
    <script src="assets/js/app.js"></script>
    
    <script src="assets/js/main.js"></script>
</body>

</html>
<%} %>
    