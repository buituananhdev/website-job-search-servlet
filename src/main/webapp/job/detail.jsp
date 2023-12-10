<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/9/2023
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cnw.model.bean.Job" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cnw.controller.ApplicantController" %>
<%@ page import="com.example.cnw.model.bo.CompanyBO" %>
<%@ page import="com.example.cnw.model.bo.ApplicantBO" %>
<%@ page import="com.example.cnw.model.bo.AccountBO" %>
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
        .button-applied {
            box-shadow: 0px 0px 11px 0px #d9ded4;
        }
    </style>
</head>
<body>
<%@ include file="../components/layouts/header.jsp" %>
<% Job job = (Job) request.getAttribute("job");%>
<div class="bg-[#f4f4f4] p-[40px] mt-40px rounded-lg h-[100vh] w-full overflow-hidden h-fit ">
    <div class="h-full p-[40px] max-w-[1000px] m-auto mt-40px rounded-2xl h-[100vh] bg-white overflow-hidden h-fit ">
        <h2 class="title text-2xl w-full text-[#009643] font-bold mb-12">Thông tin công ty</h2>
        <form method="POST" action="applicants" class="job-inf p-8 rounded-lg bg-[white] w-full mb-10">
            <h4 class="text-lg font-semibold pb-4 text-blue-900"><%= job.getTitle()%></h4>
            <input type="number" hidden="hidden" value="<%= job.getJobId()%>" name="jobId" id="jobId">
            <div class="job-content flex gap-5 mb-2">
                <b>Công ty:</b>
                <%
                    CompanyBO companyBO = new CompanyBO();
                    ApplicantBO applicantBO = new ApplicantBO();
                    AccountBO accountBO = new AccountBO();
                %>
                <p><%=  companyBO.getCompanyById(job.getCompanyId()).getName()%></p>
            </div>
            <div class="job-content flex gap-10 py-1 mb-4">
                <div class="job-salary px-3 py-2 ">
                    <p>Mức lương:</p>
                    <b><%=  job.getSalary()%></b>
                </div>
                <div class="job-location px-3 py-2 ">
                    <p>Địa điểm:</p>
                    <b><%=  job.getLocation()%></b>
                </div>
            </div>
            <% if(currentUser == null ) { %>
            <a href="auth/login.jsp" class="flex flex-row items-center justify-center w-full px-4 py-4 mb-4 text-sm
                font-bold bg-[#009634] leading-6 capitalize duration-100 transform rounded-lg shadow cursor-pointer focus:ring-4
                focus:ring-green-500 focus:ring-opacity-50 focus:outline-none sm:mb-0 sm:w-auto sm:mr-4
                md:pl-8 md:pr-6 xl:pl-12 xl:pr-10 hover:shadow-lg hover:-translate-y-1 text-white"
            > Đăng nhập để ứng tuyển </a>
            <% } else if(applicantBO.isApplicantExist(job.getJobId(), accountBO.getCandidateId(currentUser.getAccountId())) == true) {%>
            <div class="button-applied flex flex-row items-center justify-center w-full px-4 py-4 mb-4 text-sm
                font-bold bg-white leading-6 capitalize duration-100 transform rounded-lg cursor-pointer sm:mb-0 sm:w-auto sm:mr-4
                md:pl-8 md:pr-6 xl:pl-12 xl:pr-10 text-[#009634]">Đã ứng tuyển</div>
            <%} else {%>
            <button type="submit" class="flex flex-row items-center justify-center w-full px-4 py-4 mb-4 text-sm
                font-bold bg-[#009643] leading-6 capitalize duration-100 transform rounded-lg shadow cursor-pointer focus:ring-4
                focus:ring-green-500 focus:ring-opacity-50 focus:outline-none sm:mb-0 sm:w-auto sm:mr-4
                md:pl-8 md:pr-6 xl:pl-12 xl:pr-10  hover:shadow-lg hover:-translate-y-1 text-white"
            >Ứng tuyển</button>
            <%}%>

        </form>
        <div class="job-inf p-8 rounded-lg bg-[white] mb-8">
            <h4 class="req-title text-lg border-[#009643] border-s-4 font-semibold py-2 pl-2 ">  Chi tiết tin tuyển dụng</h4>
            <div class="job-inf-description mb-4 pl-4">
                <b>Mô tả công viêc</b>
                <p class="pl-4"><%=  job.getDescription()%></p>
            </div>
            <div class="job-inf-requirement pl-4">
                <b>Yêu cầu công việc:</b>
                <p class="pl-4"><%= job.getRequirements()%></p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
