<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBConnection.DbClass" %>
<%@page  contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <!-- Meta Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
   
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta Tags -->

    <!-- Style-sheets -->
    <!-- Bootstrap Css -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- Bootstrap Css -->
    
    <!-- Common Css -->
    <link href="css/style3.css" rel="stylesheet" type="text/css" media="all" />
    <!--// Common Css -->
    <!-- Nav Css -->
    <link rel="stylesheet" href="css/style4.css">
    <!--// Nav Css -->
    <!-- Fontawesome Css -->
    <link href="css/fontawesome-all.css" rel="stylesheet">
    <!--// Fontawesome Css -->
    <!--// Style-sheets -->

    <!--web-fonts-->
    <link href="//fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <!--//web-fonts-->
</head>

<body>
    <div class="se-pre-con"></div>
    <div class="wrapper">
        <!-- Sidebar Holder -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h1>
					Admin
                    <!--a href="index.html">Modernize</a-->
                </h1>
                <span>A</span>
            </div>
            <div class="profile-bg"></div>
            <ul class="list-unstyled components">
                <li>
                    <a href="welcomeAdmin.jsp">
                        <i class="fas fa-th-large"></i>
                        Dashboard
                    </a>
                </li>
                <li>
   
                </li>
                
                <li>
                    <a href="addBranch.jsp" >
                        <i class="fas fa-users"></i>
                       Add Branch Details
                       
                    </a>
                    
                </li>
				 
				<li>
                    <a href="viewBranchDetails.jsp">
                        <i class="fas fa-eye"></i>
                       View Branch Details
                       
                    </a>
                    
                </li>
				<li>
                    <a href="viewmissingpeopleadmin.jsp">
                        <i class="fas fa-eye"></i>
                       View Missing People Details
                        
                    </a>
                    
                </li>
                <li>
                    <a href="viewcriminaladmin.jsp">
                        <i class="fas fa-eye"></i>
                       View Criminal Details
                        
                    </a>
                    
                </li>
                <li>
                    <a href="findLogAdmin.jsp" >
                        <i class="fas fa-eye"></i>
                       View Logs
                       
                    </a>
                    
                </li>
				
                
            </ul>
        </nav>

        <!-- Page Content Holder -->
        <div id="content">
            <!-- top-bar -->
            <nav class="navbar navbar-default mb-xl-5 mb-4">
                <div class="container-fluid">

                    <div class="navbar-header">
                        <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                            <i class="fas fa-bars"></i>
                        </button>
                    </div>
                     <!-- Search-from -->
                    <form action="#" method="post" class="form-inline mx-auto search-form">
                    <i class="fas fa-search">  </i>
                        <input class="form-control mr-sm-2" type="search" id="myInput" onkeyup="myFunction()" placeholder="Search Here" aria-label="Search" required="">
                        <!-- >button class="btn btn-style my-2 my-sm-0" onclick="myFunction()" type="submit" >Search</button-->
                   
                    </form>
                    <!--// Search-from -->
                    <ul class="top-icons-agileits-w3layouts float-right">
                        <li class="nav-item dropdown">
                            
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <i class="far fa-user"></i>
                            </a>
                            <div class="dropdown-menu drop-3">
                                <div class="profile d-flex mr-o">
                                    
                                </div>
                                
                                <a class="dropdown-item" href="Adminlogin.jsp">Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <!--// top-bar -->
          

            
            <div class="outer-w3-agile mt-3">
                <h4 class="tittle-w3-agileits mb-4">View Branch Details</h4>
                            
         		<div class="col-md-12">
          <table border="2" id="displaytable" class="table table-bordered" style="text-align:center" >
								          <thead>
								          <tr>
								          				   
								          				    <th>Branch_Name</th>
								          				    <th>Branch_Address</th>
								          				    <th>Mobile_Number</th>
								          				    <th>State</th>
								          				    <th>City</th>
								          				    <th>Email</th>
								          				    <th>Password</th>
								          				 	<th align="center">Action</th>
								         </tr>
								          <% 
                                          PreparedStatement ps = null;
                                          ResultSet rs = null;
                                          %>
                                          <%
                                          try{
                                          Connection conn=DbClass.getConnect();
                                          ps=conn.prepareStatement("select * from police");
                                          
                                          rs = ps.executeQuery();
                                         /* PreparedStatement ps2=conn.prepareStatement("ALTER TABLE police AUTO_INCREMENT = 1;");
                              			ps2.executeUpdate();*/
                                          while(rs.next()){
                                          %>
                                          <tbody>
                                                   <tr>
                                                   
    												<td><%=rs.getString(2)%></td>
    												<td><%=rs.getString(3)%></td>
    												<td><%=rs.getString(4)%></td>
    												<td><%=rs.getString(5)%></td>
    												<td><%=rs.getString(6)%></td>
												    <td><%=rs.getString(7)%></td>
												    <td><%=rs.getString(8)%></td>
												    
                                                   <td><a href="deleteBranch.jsp?id=<%=rs.getInt("id") %>">Delete</a></td>

                                                   </tr>
                                          </tbody>
                                                   <%
                                                   }
                                                   //connection.close();
                                                   } catch (Exception e) {
                                                   e.printStackTrace();
                                                   }
                                                   %>
								          
										</thead>
				 </table>
        
               
                
                 
            </div>
        </div>
         		</div>
                   
                </div>
               
            
            <!--// Bar-Chart -->
    <!-- Required common Js -->
    <script src='js/jquery-2.2.3.min.js'></script>
    <!-- //Required common Js -->
    
    <!-- loading-gif Js -->
    <script src="js/modernizr.js"></script>
    <script>
        //paste this code under head tag or in a seperate js file.
        // Wait for window load
        $(window).load(function () {
            // Animate loader off screen
            $(".se-pre-con").fadeOut("slow");;
        });
    </script>
    <!--// loading-gif Js -->

    <!-- Sidebar-nav Js -->
    <script>
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>
    <!--// Sidebar-nav Js -->
	<!-- Js for bootstrap working-->
    <script src="js/bootstrap.min.js"></script>
    <!-- //Js for bootstrap working -->
    <SCRIPT language=Javascript>
     function isNumberKey(evt)
{
var charCode = (evt.which) ? evt.which : event.keyCode;

if (charCode > 31 && (charCode<48 || charCode>57))
	return false;
	
return true;
}
       
</SCRIPT>
<script>

function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("displaytable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>


</body>
</html>