<%@ page import="com.example.cnw.model.bean.Applicant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.cnw.model.bean.Job" %>
<%@ page import="com.example.cnw.model.bo.JobBO" %>
<%@ page import="com.example.cnw.model.bo.CompanyBO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .job-inf {
            box-shadow:0px 0px 11px 0px #e2e2e2;
        }
        .button-submit {
            margin: auto;
            width: 100%;
        }
        .job-salary, .job-location {
            box-shadow: 0px 0px 2px 0px #c3bdbd;
            width: 200px;
            padding: 8px 16px;
            color: #009643;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div>
    <%@ include file="../components/layouts/header.jsp" %>
    <% List<Applicant> applicantList = (List<Applicant>) request.getAttribute("applicants");%>
    <div class="bg-[#f4f4f4] p-[40px] mt-40px rounded-lg h-[100vh] w-full h-fit ">
        <div class="h-full p-[40px] max-w-[1000px] m-auto mt-40px rounded-2xl h-[100vh] bg-white h-fit ">
            <h2 class="title text-2xl w-full text-[#009643] font-bold mb-12">Công việc đã ứng tuyển</h2>
            <div class="list-job overflow-auto h-[650px] p-[20px]">
                <% for (Applicant applicant : applicantList) {
                    JobBO jobBO = new JobBO();
                    CompanyBO companyBO = new CompanyBO();
                    int jobId= applicant.getJob_id();
                    Job job = jobBO.getJobById(jobId);
                %>
                <div  class="job-inf p-8 rounded-lg bg-[white] w-full mb-10">
                    <h4 class="text-lg font-semibold pb-4 text-blue-900"><%= job.getTitle()%></h4>
                    <div class="job-content flex gap-5 mb-2">
                        <b>Công ty:</b>
                        <p><%=  companyBO.getCompanyById(job.getCompanyId()).getName()%></p>
                    </div>
                        <div class="job-content flex justify-between items-center py-1 mb-4">
                            <div class="job-content flex gap-10 py-1 mb-4 ">
                                <div class="job-salary px-3 py-2 ">
                                    <p>Mức lương:</p>
                                    <b><%=  job.getSalary()%></b>
                                </div>
                                <div class="job-location px-3 py-2 ">
                                    <p>Địa điểm:</p>
                                    <b><%=  job.getLocation()%></b>
                                </div>
                            </div>
                            <a href="jobs?jobId=<%= job.getJobId()%>" class="text-[#009634] hover:underline">View</a>
                        </div>
                </div>
                <% } %>
            </div>

        </div>
    </div>
</div>
</body>
</html>
