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
					Police Department
                    <!--a href="index.html">Modernize</a-->
                </h1>
                <span>PD</span>
            </div>
            <div class="profile-bg"></div>
            <ul class="list-unstyled components">
                <li>
                    <a href="welcomeBranch.jsp">
                        <i class="fas fa-th-large"></i>
                        Dashboard
                    </a>
                </li>
                <li>
   
                </li>
                
                <li>
                    <a href="addMissingPeople.jsp" >
                        <i class="fas fa-users"></i>
                       Add Missing People Details
                       
                    </a>
                    
                </li>
				 <li>
                    <a href="addCriminals.jsp" >
                        <i class="fas fa-users"></i>
                       Add Criminal Details
                        
                    </a>
                    
                </li>
				<li>
                    <a href="viewmissingpeople.jsp">
                        <i class="fas fa-eye"></i>
                       View Missing People Details
                       
                    </a>
                    
                </li>
				<li>
                    <a href="viewcriminal.jsp">
                        <i class="fas fa-eye"></i>
                       View Criminals Details
                        
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
                                
                                <a class="dropdown-item" href="Branchlogin.jsp">Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <!--// top-bar -->
          

            
            <div class="outer-w3-agile mt-3">
                <h4 class="tittle-w3-agileits mb-4">Add Missing Person's Details</h4>
                            
         		 <div class="col-md-12">
          
      <form action="Uploaddoc" method="post" enctype="multipart/form-data">

    <!-- FIX: Pass ID so Uploaddoc knows which record to update -->
    <input type="hidden" name="id" value="<%= servlets.Getvalues.getId() %>">

    <div class="form-group row">
        <label class="col-sm-3 form-control-label">Upload ID Proof:</label>
        <div class="col-sm-9">
            <input type="file" class="form-control" name="doc"
                   accept=".pdf,.jpg,.jpeg,.png" required>
        </div>
    </div>

    <div class="form-group row m-b-0">
        <div class="col-sm-offset-3 col-sm-9">
            <button type="submit" class="btn btn-primary">Upload</button>
        </div>
    </div>

</form>

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

</body>
</html>