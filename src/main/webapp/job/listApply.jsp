<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/9/2023
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cnw.model.bo.JobBO" %>
<%@ page import="com.example.cnw.model.bean.Job" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<style>
  .container {
    background-color: #f4f4f4;
    width: 100%;
    height: 100vh;
    overflow: hidden;
  }
  .content {
    height: 100%;
    padding: 40px;
    max-width: 1000px;
    margin: auto;
  }
  .title {
    color: #009643;
  }
  .apply-button {
    background-color: #009643;
  }
  .req-title {
    border-left: 4px solid #009643  ;
  }
  .job-inf {
    background-color: #ffff;
  }
</style>
<body>

</body>
</html>
<%@ page import="com.example.cnw.model.bean.Job" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.cnw.model.bean.Applicant" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 12/7/2023
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Job Detail</title>
</head>
<body>
<% Job job = (Job) request.getAttribute("job");%>
<table border="1">
  <thead>
  <tr>
    <th>Job ID</th>
    <th>Title</th>
    <th>Description</th>
  </tr>
  </thead>
  <tbody>
  <% for (Applicant applicant : (List<Applicant>) request.getAttribute("applicants")) { %>
  <tr>
    <td><%= applicant.getCandidate_id() %></td>
  </tr>
  <% } %>
  </tbody>
</table>
</body>
</html>
