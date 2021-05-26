<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import=" models.User"%>
<% User u = (User)session.getAttribute("user"); 
if(u!=null){
	if(models.Role.ADMIN.equals(u.getRole())){
		response.sendRedirect("http://localhost:8282/EDDAGNI.HAJAR/admin");
	}else if(models.Role.STUDENT.equals(u.getRole())){
		response.sendRedirect("http://localhost:8282/EDDAGNI.HAJAR/student");
	}
	

}else{ %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>authentication</title>
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    
    <link rel="shortcut icon" href="assets/images/book.png" type="image/x-icon">
    <link rel="stylesheet" href="assets/css/app.css">
      <script src="assets/js/feather-icons/feather.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/js/main.js"></script>
</head>

<body>
    <div id="auth">
        
<div class="container">
    <div class="row">
        <div class="col-md-5 col-sm-12 mx-auto">
            <div class="card pt-4">
                <div class="card-body">
                    <div class="text-center mb-5">
                        <img src="assets/images/book.png" height="60" class='mb-4'>
                        <h3>Sign In</h3>
                        <p>Please sign in to continue </p>
                    </div>
                    <form action="auth" method="post">
                        <div class="form-group position-relative has-icon-left">
                            <label for="username">Email</label>
                            <div class="position-relative">
                                <input type="email" class="form-control" name="email"  id="username">
                                <div class="form-control-icon">
                                    <i data-feather="user"></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left">
                            <div class="clearfix">
                                <label for="password">Password</label>
                                
                            </div>
                            <div class="position-relative">
                                <input type="password" name="password"  class="form-control" id="password">
                                <div class="form-control-icon">
                                    <i data-feather="lock"></i>
                                </div>
                            </div>
                        </div>

                        <div class='form-check clearfix my-4'>
                            <div class="checkbox float-left">
                                <input type="checkbox" id="checkbox1" class='form-check-input' >
                                <label for="checkbox1">Remember me</label>
                            </div>
                            <div class="float-right">
                                <a href="CreatAccount.jsp">Don't have an account?</a>
                            </div>
                        </div>
                        <div class="clearfix">
                            <button type="submit" class="btn btn-primary float-right">Login</button>
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
  
</body>

</html>
<%} %>
    