<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driverName = "org.postgresql.Driver";
String connectionUrl = "jdbc:postgresql://localhost:5432/covid";
String userId = "postgres";
String password = "Sweety0608@";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 style="font-family:'Montserrat'; padding-top: 25px; padding-bottom: 25px;" align="center" ><font size="10"><strong>COVID DATA TABLE</strong></font></h2>

<link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Ubuntu:wght@300&display=swap"
    rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
<table class="table table-striped" width="90%" align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr>
<td style="font-family:'Montserrat';"><b><font size="5">  
Location    
</font> </b></td>
<td style="font-family:'Montserrat';"><b><b><font size="5">  
Total Cases   
</font> </b></td></b></td>
</tr>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT location, total_cases FROM latestCovidData WHERE new_cases> 300 GROUP BY location,total_cases, new_cases ORDER BY  new_cases;";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td style="font-family:'Montserrat';"><%=resultSet.getString("location") %></td>
<td style="font-family:'Montserrat';"><%=resultSet.getString("total_cases") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
