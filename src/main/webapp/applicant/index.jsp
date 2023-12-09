<%@ page import="com.example.cnw.model.bean.Applicant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.cnw.model.dao.JobDAO" %>
<%@ page import="com.example.cnw.model.bean.Job" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/9/2023
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body>
<div>
    <%@ include file="../components/layouts/header.jsp" %>
    <% List<Applicant> applicantList = (List<Applicant>) request.getAttribute("applicants");%>
    <div class="bg-[#f4f4f4] p-[40px] mt-40px rounded-lg h-[100vh] w-full overflow-hidden h-fit ">
        <div class="h-full p-[40px] max-w-[1000px] m-auto mt-40px rounded-2xl h-[100vh] bg-white overflow-hidden h-fit ">
            <h2 class="title text-2xl w-full text-[#009643] font-bold mb-12">Công việc đã ứng tuyển</h2>
            <% for (Applicant applicant : applicantList) {
                JobDAO jobDAO = new JobDAO();
                int jobId= applicant.getJob_id();
                Job job = jobDAO.getJobById(jobId);
            %>
            <div method="POST" action="applicants?job_id=<%= job.getJobId()%>" class="job-inf p-8 rounded-lg bg-[white] w-full mb-10">
                <h4 class="text-lg font-semibold pb-4"><%= job.getTitle()%></h4>
                <div class="job-content flex gap-5 mb-2">
                    <b>Công ty:</b>
                    <p><%=  job.getCompanyId()%></p>
                </div>
                <div class="job-content flex gap-10 py-1 mb-4">
                    <div class="job-salary px-3 py-2 ">
                        <p>Mức lương:</p>
                        <b><%=  job.getSalary()%></b>
                    </div>
                    <div class="location-salary px-3 py-2 ">
                        <p>Địa điểm:</p>
                        <b><%=  job.getLocation()%></b>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
