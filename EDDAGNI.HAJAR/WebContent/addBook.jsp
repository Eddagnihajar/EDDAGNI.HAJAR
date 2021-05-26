<%@page import="services.servicesUser"%>
<%@page import="services.servicesCategory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.util.ArrayList" %>
  <%@page import="services.servicesCategory"%>
<%@page import="models.Categorie"%>
<%@page import="models.User"%>
  <%@page import="services.servicesUser"%>
 
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> BOOK ADMIN</title>
    
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="assets/vendors/chartjs/Chart.min.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/book.png" type="image/x-icon">
</head>
<body>
    <div id="app">
        <div id="sidebar" class='active'>
            <div class="sidebar-wrapper active">
    <div class="sidebar-header">
        <img src="assets/images/book.png" alt="" srcset=""><h1>BOOK</h1>
    </div>
    <div class="sidebar-menu">
        <ul class="menu">
            
            
                <li class='sidebar-title'>Main Menu</li>
            
            
            
                <li class="sidebar-item active ">
                    <a href="index.html" class='sidebar-link'>
                        <i data-feather="home" width="20"></i> 
                        <span>HOME</span>
                    </a>
                    
                </li>

            
            
            
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                      <i data-feather="triangle" width="20"></i> 
                        <span>FONCTIONNALITES</span>
                    </a>
                    
                    <ul class="submenu ">
                    <li>
                            <a href="addStudent.jsp">Ajouter Etudiant</a>
                        </li>
                        <li>
                            <a href="addBook.jsp">Ajouter livre</a>
                        </li>
                        
      
                        <li>
                            <a href="AllBook.jsp">Lister les livres </a>
                        </li>
                        
                        <li>
                            <a href="#">Reserver livre</a>
                        </li>
                        
                        
                        
                    </ul>
                    
                </li>
    
        </ul>
    </div>
    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
</div>
        </div>
        <div id="main">
            <nav class="navbar navbar-header navbar-expand navbar-light">
                <a class="sidebar-toggler" href="#"><span class="navbar-toggler-icon"></span></a>
                <button class="btn navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav d-flex align-items-center navbar-light ml-auto">
                        <li class="dropdown nav-icon">
                            <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
                                <div class="d-lg-inline-block">
                                    <i data-feather="bell"></i>
                                </div>
                            </a>
                          
                        </li>
                        <li class="dropdown nav-icon mr-2">
                            <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
                                <div class="d-lg-inline-block">
                                    <i data-feather="mail"></i>
                                </div>
                            </a>
                            
                        </li>
                   
                    </ul>
                </div>
            </nav>
            
<div class="main-content container-fluid">
    <div class="page-title">
        <h3>HOME</h3>
      
    </div>
  
</div>
            
<div class="main-content container-fluid">
                                
                                
                                    <!-- add  book        ----------------------------------->
    <!-- Basic Horizontal form layout section start -->
    <section id="basic-horizontal-layouts">
    <div class="row match-height">
        <div class="col-md-10 col-12">
        <div class="card">
            <div class="card-header">
            <h4 class="card-title">Ajouter Livre</h4>
            </div>
            <div class="card-content">
            <div class="card-body">
                <form class="form form-horizontal" action="book" method="post">
                <div class="form-body">
                    <div class="row">
                    <div class="col-md-4">
                        <label>Title</label>
                    </div>
                    <div class="col-md-8 form-group">
                        <input type="text" id="first-name" class="form-control" name="title" placeholder="title">
                    </div>
                    <div class="col-md-4">
                        <label>Description</label>
                    </div>
                    <div class="col-md-8 form-group">
                        <input type="text" id="email-id" class="form-control" name="description" placeholder="description">
                    </div>
                    <div class="col-md-4">
                        <label>Genre</label>
                    </div>
                    <div class="col-md-8 form-group">
                        <input type="text" id="contact-info" class="form-control" name="genre" placeholder="genre">
                    </div>
                    <div class="col-md-4">
                        <label>Annee_edition</label>
                    </div>
                    <div class="col-md-8 form-group">
                        <input type="number" id="password" class="form-control" name="annee_edition" placeholder="annee_edition">
                    </div>
                     <div class="col-md-4">
                        <label>Isbn</label>
                    </div>
                    <div class="col-md-8 form-group">
                        <input type="number" id="first-name" class="form-control" name="isbn" placeholder="isbn">
                    </div>
                     <div class="col-md-4">
                        <label>Category</label>
                    </div>
                     <!--<div class="col-md-8 form-group">
                          <input type="text" id="first-name" class="form-control" name="nomc" placeholder="categorie">
                       
                    </div> -->
                     <div class="col-md-8 ">
                                    
                                   <div class="form-group">
                                    <%ArrayList<Categorie> categories=servicesCategory.AllCategories(); %>
                                        <select  name="nomc" class="choices form-select" >
                                        <%for(Categorie c:categories){ %>
                                            <option ><%=c.getNom() %></option>
                                            <%} %>
                                          
                                        </select>
                                    </div>
                                </div>
                     <div class="col-md-4">
                        <label>Author</label>
                    </div>
                     <!-- <div class="col-md-8 form-group">
                       <input type="text" id="first-name" class="form-control" name="noma" placeholder="author">
                    </div>-->
                     <div class="col-md-8 ">
                                    
                                   <div class="form-group">
                                    <%ArrayList<User> Authors=servicesUser.AllAuthor(); %>
                                        <select  name="noma" class="choices form-select" >
                                        <%for(User u:Authors){ %>
                                            <option ><%=u.getNom() %></option>
                                            <%} %>
                                          
                                        </select>
                                    </div>
                                </div>
                    <div class="col-12 col-md-8 offset-md-4 form-group">
                        <div class='form-check'>
                            <div class="checkbox">
                                <input type="checkbox" id="checkbox1" class='form-check-input' checked>
                                <label for="checkbox1">Remember Me</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary mr-1 mb-1">Ajouter</button>
                       
                    </div>
                    </div>
                </div>
                </form>
            </div>
            </div>
        </div>
        </div>
      
    </div>
    </section>
    <!-- // Basic Horizontal form layout section end -->
        <!-- add book -->
    </div>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-left">
                        <p>2021 &copy; book </p>
                    </div>
                  
                </div>
            </footer>
        </div>
    </div>
    <script src="assets/js/feather-icons/feather.min.js"></script>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/app.js"></script>
    
    <script src="assets/vendors/chartjs/Chart.min.js"></script>
    <script src="assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="assets/js/pages/dashboard.js"></script>

    <script src="assets/js/main.js"></script>
</body>
</html>

    