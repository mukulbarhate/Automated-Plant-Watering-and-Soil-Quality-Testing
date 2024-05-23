<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.waterirrigation.*"%>
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
<title>SmartParivahan</title>

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
				<a class="navbar-brand" href="home.jsp">Smart Parivahan System</a>
			</div>


		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">

					<li><a class="active-menu" href="adminhome.jsp"><i
							class="fa fa-dashboard " style="font-size: 20px; color: black"></i>Home</a>
					</li>
					<li><a href="addHospital.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>add Hospital</a></li>
					<li><a href="viewHospitals.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>View Hospital</a></li>
					<li><a href="addRFIDUser.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>add RFID User</a></li>
					<li><a href="viewRFIDUsers.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>View RFID User</a></li>
							<li><a href="addVehicleDevice.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>add VehicleDevice</a></li>
					<li><a href="viewVehicleDevice.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>View VehicleDevice</a></li>
					<li><a  class="active-menu" href="home.jsp"><i class="fa fa-sign-out"
							style="font-size: 20px; color: black"></i>Logout</a></li>

				</ul>

			</div>
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-head-line">Welcome in Administration</h1>


					</div>
				</div>
				<H1>Fetching Data From a Database</H1>

				<%
					Connection connection = DBconnect.getConnect();

					Statement statement = connection.createStatement();

					String id1 = request.getParameter("id");

					ResultSet resultset = statement.executeQuery("select * from hospitaldetails where id = '" + id1 + "'");

					if (!resultset.next()) {
						out.println("Sorry, could not find that candidate. ");
					} else {
				%>

				<TABLE BORDER="1">

					<TR>
						<th>Id</th>
						<th>Name</th>
						<th>Email</th>
						<th>contact</th>
						<th>password</th>
						<th>HospitalAddress</th>
						<th>nameOfTheDoctor</th>
						<th>hospitalServices</th>
						<th>hospitalLocation</th>
						<th align="center">Action</th>
					</TR>
					<TR>
						<TD><%=resultset.getString(1)%></TD>
						<TD><%=resultset.getString(2)%></TD>
						<TD><%=resultset.getString(3)%></TD>
						<TD><%=resultset.getString(4)%></TD>
						<TD><%=resultset.getString(5)%></TD>
						<TD><%=resultset.getString(6)%></TD>
						<TD><%=resultset.getString(7)%></TD>
						<TD><%=resultset.getString(8)%></TD>
						<TD><%=resultset.getString(9)%></TD>

						<td><a
							href="removeHospital.jsp?id=<%=resultset.getString(1)%>"
							onclick="return confirm_alert(this);">Delete</a></td>
					</TR>
				</TABLE>
				<BR>
				<%
					}
				%>

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
