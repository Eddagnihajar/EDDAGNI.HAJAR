<%@page import="services.servicesBook"%>
<%@page import="java.util.ArrayList"%>
<%@page import="services.servicesCategory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
  <%@page import="java.util.ArrayList" %>
  <%@page import="services.servicesBook"%>
<%@page import="models.Book"%>
<%@page import="models.Categorie"%>
<%@page import="models.User"%>
  
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> BOOK </title>
    
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
                    <% User u = (User)session.getAttribute("user");  
                    if(models.Role.ADMIN.equals(u.getRole())){ %>
                    <ul class="submenu ">
                    <li>
                            <a href="#">Ajouter Etudiant</a>
                        </li>
                        <li>
                            <a href="#">Ajouter livre</a>
                        </li>
                        
      
                        <li>
                            <a href="AllBook.jsp">Lister les livres </a>
                        </li>
                        
                        <li>
                            <a href="#">Reserver livre</a>
                        </li>
                        
                        
                        
                    </ul>
                    
                    <% }%>
                    <% if(models.Role.STUDENT.equals(u.getRole())) { %>
                            <ul class="submenu ">
                   
                        
      
                        <li>
                            <a href="AllBook.jsp">Lister les livres </a>
                        </li>
                        
                        <li>
                            <a href="#">Reserver livre</a>
                        </li>
                        
                        
                        
                    </ul>
                     <% }%>
                   
                    
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
       <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Search</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form" action="AfficherLivre" method="post">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column">Categorie</label>
                                            <input type="text"  id="first-name-column" class="form-control" placeholder=""
                                                name="nomautho">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="last-name-column">Author</label>
                                            <input type="text" id="last-name-column" class="form-control" placeholder=""
                                                name="nomcategy">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        
                                    </div>
                                    
                                    
                                  
                                    <div class="col-12 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary mr-1 mb-1">Search</button>
                                       
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>                             
                                
                                    <!-- all book        ----------------------------------->
                                  
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Datatable</h3>
                <p class="text-subtitle text-muted">We use 'simple-datatables' made by @fiduswriter. You can check the full documentation <a href="https://github.com/fiduswriter/Simple-DataTables/wiki">here</a>.</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Datatable</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-header">
               Lister Livres
            </div>
            <div class="card-body">
            <% ArrayList<Book> books=servicesBook.allBooks(); %>
                <table class='table table-striped' id="table1">
                    <thead>
                        <tr>
                           
                            <th>Title</th>
                            <th>Genre</th>
                            <th>Annee_edition</th>
                            <th>Isbn</th>
                            <th>Category</th>
                            <th>Author</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%for(Book b:books){ %>
                        <tr>
                           
                            <td><%=b.getTitle() %></td>
                          
                            <td><%=b.getGenre() %></td>
                            <td><%=b.getAnnee_edition() %></td>
                            <td><%=b.getIsbn() %></td>
                            <td><%out.print(b.getCategorie());%></td>
                            <td><%=b.getAuthor()%></td>
                        </tr>
                        <%} %>

                    </tbody>
                </table>
            </div>
        </div>

    </section>

                                      <!-- all  book        ----------------------------------->
   
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

    