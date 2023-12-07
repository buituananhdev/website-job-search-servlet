<%@ page import="com.example.cnw.model.bean.Job" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 12/7/2023
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Job List</title>
</head>
<body>
<h2>Job List</h2>
<table border="1">
    <thead>
    <tr>
        <th>Job ID</th>
        <th>Title</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <% for (Job job : (List<Job>) request.getAttribute("jobList")) { %>
    <tr>
        <td><%= job.getJobId() %></td>
        <td><%= job.getTitle() %></td>
        <td><%= job.getDescription() %></td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
