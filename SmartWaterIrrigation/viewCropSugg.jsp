
<%@page import="com.waterirrigation.*"%>
<%@page import="com.servlet.*"%>

<%@page import="com.servlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
	<ul class="nav" id="main-menu">

					<li><a class="active-menu" href="farmerhome.jsp"><i
							class="fa fa-dashboard " style="font-size: 20px; color: black"></i>Home</a>
					</li>
					<li><a href="viewFarmValue.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>View Farm Sensor Value</a></li>
							
					<li><a href="motorOnOff.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>Motor ON/OFF</a></li>
				
				<li><a href="viewCropSugg.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>View Crop Suggestion</a></li>
				
				
				<li><a href="viewFerSugg.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>View Fertilizer Suggestion</a></li>
				
				<li><a href="updateFarmer.jsp"><i class="fa fa-user"
							style="font-size: 20px; color: white"></i>Update Farmer</a></li>
				
				
				
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
						<h1 class="page-head-line"></h1>


					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading"><h3><b><i>Crop Suggestion</i></b></h3></div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Crop Name</th>
												<th>Suggestion</th>

											</tr>
										</thead>

										<tbody>
											<%
											String temp = FarmerGetSet.getTemp();
											String hum = FarmerGetSet.getHum();
											String soil = FarmerGetSet.getSoil();
											String ph = FarmerGetSet.getPh();
											
											System.out.println("temp : " +temp);
											System.out.println("Humidity : " +hum);
											System.out.println("soil : " +soil);
											System.out.println("ph : " +ph);
											
									Connection con = DBconnect.getConnect();
									Statement statement = null;
									ResultSet resultSet = null;
								%>

								<%
								try {
									
									statement = con.createStatement();
									String sql = "select * FROM `cropsugg` WHERE '"+temp+"' BETWEEN templow AND temphigh OR '"+hum+"' BETWEEN humiditylow AND humidityhigh OR '"+soil+"' BETWEEN soillow AND soilhigh OR '"+ph+"' BETWEEN phlow AND phhigh";
									
									resultSet = statement.executeQuery(sql);
									while (resultSet.next()) {
										System.out.println("************");
								%>
											<tr>
												<td><%=resultSet.getString(2)%></td>
												<td><%=resultSet.getString(11)%></td>

											</tr>

											<%
												}

												} catch (Exception e) {
													e.printStackTrace();
												}
											%>


										</tbody>
									</table>
								</div>

							</div>
						</div>
						<!--End Advanced Tables -->
					</div>
				</div>
				<!-- /. ROW  -->

			</div>
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
