<!DOCTYPE html>
<html class="bootstrap-layout">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Accident Prevention Using IOT</title>

  <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
  <meta name="robots" content="noindex">

  <!-- Material Design Icons  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <!-- Roboto Web Font -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">

  <!-- App CSS -->
  <link type="text/css" href="assets/css/wizard/style.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet" type="text/css" media="all">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<!-- //css files -->
<script type="text/javascript" src="js/valid.js">
</script>
<style>
  body {
    background:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url('images/36.jpg') no-repeat 0% 12% fixed;
    background-size: cover;
	font-family: 'Oswald', sans-serif;
	text-align:center;
}
  </style>
</head>

<body class="layout-container ls-top-navbar si-l3-md-up">

  <!-- Navbar -->
  <nav class="navbar navbar-dark bg-primary navbar-full navbar-fixed-top">

  
    <!-- Brand -->
 
   <a href="home.jsp" class="navbar-brand"><i class="material-icons"></i>Accident Prevention Using IOT</a>

    <ul class="nav navbar-nav pull-xs-right">

      <li class="nav-item dropdown">
             <a href="admin.jsp"><font color="White">Admin Login</font></a>
      
      </li>
   	<li class="nav-item dropdown">
        
        <a href="AdvLogin.jsp"><font color="White">Police Login</font></a>
      
      </li>
  <li class="nav-item dropdown">
             <a href="tmologin.jsp"><font color="White">TMO Login</font></a>
      
      </li>
  
    </ul>
    <!-- // END Menu -->

  </nav>
  <!-- Content -->
  <div class="layout-content" data-scrollable="">
    <div class="container-fluid">

      <div class="card" style="width: 60%; margin-top:150px;margin-left:60px;border:1px solid white; background-color:transparent;">
            <div class="card-block">
            
            	<h2 class="sub-head" style="margin-left:50px;">TMO LOGIN</h2>
             
              <form name="myform" action="tmologin" onsubmit="return validateUser()" method="post">
                <div class="form-group row">
                  <label for="inputEmail3" class="col-sm-3 form-control-label" style="color:white;">Email</label>
                  <div class="col-sm-9">
                    <input type="email" class="form-control" id="inputEmail3" name="email" placeholder="Email" 
                    required="required" style="background-color:transparent;border:1px solid white;color:white;">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="inputPassword3" class="col-sm-3 form-control-label" style="color:white;">Password</label>
                  <div class="col-sm-9">
                    <input type="password" class="form-control" id="inputPassword3" name="pass" placeholder="Password" 
                    required="required" style="background-color:transparent;border:1px solid white;color:white">
                  </div>
                </div>
               
                <div class="form-group row m-b-0">
                  <div class="col-sm-offset-3 col-sm-9">
                    <button type="submit" class="btn btn-primary" style="margin-right:100px;">Sign in</button>
                  </div>
                </div>
                
                
                 <div class="form-group row m-b-0">
                  <div class="col-sm-offset-3 col-sm-9">
                   
                  </div>
                </div>
                
                 <div class="form-group row">
                 
                  <div class="col-sm-9">
                  
                   
                  </div>
                </div>
                
              </form>
            </div>
          </div>
    </div>
  </div>

  <!-- jQuery -->
  <script src="assets/vendor/jquery.min.js"></script>

  <!-- Bootstrap -->
  <script src="assets/vendor/tether.min.js"></script>
  <script src="assets/vendor/bootstrap.min.js"></script>

  <!-- AdminPlus -->
  <script src="assets/vendor/adminplus.js"></script>

  <!-- App JS -->
  <script src="assets/js/main.min.js"></script>

</body>

</html>