<%@page import="com.waterirrigation.*"%>
<%@page import="com.servlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Statement statement = null;
ResultSet resultSet = null;
%>

<%
try{
Connection conn=DBconnect.getConnect();
statement=conn.createStatement();
String id1=request.getParameter("id");
java.sql.PreparedStatement ps=conn.prepareStatement("update farmer set motorstatus=? where id=?");
ps.setString(1,"9");
ps.setString(2,id1);
int i=ps.executeUpdate();
if(i==1)
{
	response.sendRedirect("motorOnOff.jsp");
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>