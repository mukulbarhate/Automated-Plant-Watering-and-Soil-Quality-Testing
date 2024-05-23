<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.servlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Smart Water Irrigation System</title>

<!-- BOOTSTRAP STYLES-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!--CUSTOM BASIC STYLES-->
<link href="assets/css/basic.css" rel="stylesheet" />
<!--CUSTOM MAIN STYLES-->
<link href="assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" >Welcome</a>
			</div>


		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">

					<li><a class="active-menu" href="adminhome.jsp"><i
							class="fa fa-dashboard " style="font-size: 20px; color: black"></i>Home</a>
					</li>
					<li><a href="addFarmer.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>Add Farmer</a></li>
					<li><a href="viewFarmer.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>View Farmer</a></li>
					<li><a href="addCropSugg.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>Add Crop Suggestion</a></li>
					<li><a href="addFerSugg.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>Add Fertilizer Suggestion</a></li>
				
					<li><a class="active-menu" href="home.jsp"><i class="fa fa-sign-out"
							style="font-size: 20px; color: black"></i>Logout</a></li>

				</ul>

			</div>
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-head-line">Add Farmer</h1><br><br>
						
						<form action="FarmerAdd" method="post">
                
					
								
							<div class="form-group row">
                			<input type="hidden" name="action" value="add"/>
    						<label for="inputEmail3" class="col-sm-3 form-control-label">Name :</label>
                	  		<div class="col-sm-9">
                    		<input type="text" cols="7" rows="1" class="form-control" name="nameTxt" placeholder="Enter Name of User" required></input>
                 			</div>
               			 	</div>
               			 	
               			 	<div class="form-group row">
                			<input type="hidden" name="action" value="add"/>
    						<label for="inputEmail3" class="col-sm-3 form-control-label">Email :</label>
                  			<div class="col-sm-9">
                    		<input type="email" cols="7" rows="1" class="form-control" name="emailTxt" placeholder="Enter Email ID" onblur="validateEmail(this);" required></input>
                 			</div>
                			</div> 
                			
                			<div class="form-group row">
                			<input type="hidden" name="action" value="add"/>
    						<label for="inputEmail3" class="col-sm-3 form-control-label">Contact :</label>
                 		 	<div class="col-sm-9">
                    		<input type="numbers" cols="7" rows="1" class="form-control" name="contactTxt" placeholder="Enter Contact Number" onkeypress="return isNumberKey(event)" minlength="10" maxlength="10" required></input>
                  			</div>
                			</div>
               			 	
               			 	 <div class="form-group row">
                			<input type="hidden" name="action" value="add"/>
    						<label for="inputEmail3" class="col-sm-3 form-control-label">Password :</label>
                  			<div class="col-sm-9">
             		 		<input type = "password" cols="7" rows="1" class="form-control" name="passwordTxt" placeholder="Enter Password" minlength="5" maxlength="20" required></input>
                  			</div>
                			</div>
                			
                			<div>		
							<label for="inputEmail3" class="col-sm-3 form-control-label">Select Gender :</label>
           					 <div class="col-sm-9">
           					 <select  class="form-control" name='genderDDL' required="required">
           					 <option value="Male">Male</option>
           					 <option value="Female">Female</option>
           					 <option value="Other">Other</option>
							</select>
							</div>
							</div>
							<br>
							<br>
                			
                			 <!-- <div class="form-group row">
                			<input type="hidden" name="action" value="add"/>
    						<label for="inputEmail3" class="col-sm-3 form-control-label">Select Gender :    </label>
                  			<select name='genderDDL' id='typeddl' required="required">
							<option>Select Gender</option>
							<option value='Male'>Male</option>
							<option value='Female'>Female</option>
							<option value='Other'>Other</option>
						</select>
                			</div> -->
               			 	
               			 	
                			
                			<div class="form-group mb-n">

									<center>
									<button type="submit" class="btn btn-primary">Add</button>
									</center>
								</div>
							</form>
							
<!-- 							<div class="register-form">
			<form action="FarmerAdd" method="post"
				onsubmit="return validation()">
				<div class="fields-grid">
					<div class="styled-input">
						<span class="fa fa-user" aria-hidden="true"></span> <input
							type="text" name="nameTxt" class="form-control round-form"
							placeholder="Farmer name"
							onkeypress="return onlyAlphabets(event,this)" required"/>
					</div>

					<div class="styled-input">
						<span class="fa fa-envelope-o" aria-hidden="true"></span> <input
							type="email" name="emailTxt" placeholder="Farmer's E-mail"
							class="form-control round-form" onblur="validateEmail(this);" required"/>
					</div>

					<div class="styled-input">
						<span class="fa fa-phone" aria-hidden="true"></span> <input
							type="text" placeholder="Contact Number" name="contactTxt"
							data-rule="required" data-msg="This field is required" required
							pattern="[7-9]{1}[0-9]{9}" MaxLength="10" />
					</div>
					<div class="styled-input">
						<span class="fa fa-user" aria-hidden="true"></span> <input
							type="password" placeholder="Password" name="passwordTxt"
							required />
					</div>

					<div class="styled-input">
						<span class="fa fa-user" aria-hidden="true"></span> <select
							name='genderDDL' id='typeddl' required="required">
							<option>Select Gender</option>
							<option value='Male'>Male</option>
							<option value='Female'>Female</option>
							<option value='Other'>Other</option>
						</select>
					</div>


					<input type="submit" value="Submit">
				</div>
			</form>


		</div>
							 -->


					</div>
				</div>
				<!-- /. ROW  -->
				<!--  <div class="row">
                    <div class="col-md-4">
                        <div class="main-box mb-dull">
                            <a href="#">
                                <i class="fa fa-home fa-3x"></i>
                                <h5>Extend Your Reach</h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="main-box mb-red">
                            <a href="#">
                                <i class="fa fa-user fa-3x"></i>
                                <h5>Improve Consumer Targeting</h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="main-box mb-pink">
                            <a href="#">
                                <i class="fa fa-dollar fa-3x"></i>
                                <h5>Increase Revenue</h5>
                            </a>
                        </div>
                    </div>

                </div>
                /. ROW  --
                        <!-- /. ROW 
                  

                        <div class="panel panel-default">

                            <div id="carousel-example" class="carousel slide" data-ride="carousel" style="border: 3px solid #ffe6f2;">

                                <div class="carousel-inner">
                                    <div class="item active">

                                        <img src="assets/img/slideshow/b1.jpg" alt="" />

                                    </div>
                                    <div class="item">
                                        <img src="assets/img/slideshow/b2.jpg" alt="" />

                                    </div>
                                    <div class="item">
                                        <img src="assets/img/slideshow/b3.jpg" alt="" />

                                    </div>
                                     <div class="item">
                                        <img src="assets/img/slideshow/b4.jpg" alt="" />

                                    </div>
                                     <div class="item">
                                        <img src="assets/img/slideshow/b5.jpg" alt="" />

                                    </div>
                                     <div class="item">
                                        <img src="assets/img/slideshow/b6.jpg" alt="" />

                                    </div>
                                </div>
                                INDICATORS
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example" data-slide-to="1"></li>
                                    <li data-target="#carousel-example" data-slide-to="2"></li>
                                    <li data-target="#carousel-example" data-slide-to="3"></li>
                                    <li data-target="#carousel-example" data-slide-to="4"></li>
                                    <li data-target="#carousel-example" data-slide-to="5"></li>
                                </ol>
                                PREVIUS-NEXT BUTTONS
                                <a class="left carousel-control" href="#carousel-example" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                    /.REVIEWS &  SLIDESHOW 
                     -->
				<!--/.Chat Panel End-->
			</div>
			<!-- /. ROW  -->



			<!--/.Row-->

			<!--/.Row-->

			<!-- /. WRAPPER  -->
		</div>
	</div>

	<div id="footer-sec"></div>
	<!-- /. FOOTER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>



</body>
</html>
