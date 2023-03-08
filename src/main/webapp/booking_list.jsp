<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String booking_id = request.getParameter("booking_id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "hydrae";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html lang="en-US">
<head>
	<title>
		Appointment List	
	</title>
	<style>
		body {
			background-image: url("images/homebg.png");
			background-repeat: no-repeat;
			background-size: cover;
			background-attachment: fixed;
		}
		table, th, td {
			border: 1px solid;
			margin-left:auto;
			margin-right:auto;
			font-size: 20px;
		}
		th,td {
			padding: 15px;
			text-align: left;
		}
		h3 {
			text-align: center;
		}
		caption {
			font-size: 30px;
		}
		tr:hover {
			background-color: gray;
		}
	</style>
</head>
<body>
	<div style="padding: 100px;">
		                                 
	</div>
<table style="border:1px solid black;margin-left:auto;margin-right:auto;">
	<caption>
		List of Appointments
	</caption>
<tr>
<td>booking_id</td>
<td>booking_details</td>
<td>booking_time</td>
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from booking";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("booking_id") %></td>
<td><%=resultSet.getString("booking_details") %></td>
<td><%=resultSet.getString("booking_time") %></td>

<td><a href="edit_appointment.jsp?booking_id=<%=resultSet.getString("booking_id")%>">Update</a></td>
<td><a href="delete_booking.jsp?booking_id=<%=resultSet.getString("booking_id") %>">Delete</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<h3>
	Want to book an appointment? Click <a href="book_appointment.jsp">here</a>
</h3>


</body>
</html>