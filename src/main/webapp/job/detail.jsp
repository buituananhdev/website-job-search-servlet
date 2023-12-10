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
        <form method="POST" action="applicants" class="flex flex-col gap-[16px] job-inf p-8 rounded-lg bg-[white] w-full mb-10">
            <h4 class="text-xl font-bold text-[#263a4d]"><%= job.getTitle()%></h4>
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
                <div class="job-salary px-3 py-2 flex gap-[16px] items-center">
                    <div class="flex flex-col items-center justify-center gap-10 h-[40px] w-[40px] p-2 bg-gradient-to-r from-green-500 to-teal-700 rounded-full">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <path d="M21.92 16.75C21.59 19.41 19.41 21.59 16.75 21.92C15.14 22.12 13.64 21.68 12.47 20.82C11.8 20.33 11.96 19.29 12.76 19.05C15.77 18.14 18.14 15.76 19.06 12.75C19.3 11.96 20.34 11.8 20.83 12.46C21.68 13.64 22.12 15.14 21.92 16.75Z" fill="white"></path>
                            <path d="M9.99 2C5.58 2 2 5.58 2 9.99C2 14.4 5.58 17.98 9.99 17.98C14.4 17.98 17.98 14.4 17.98 9.99C17.97 5.58 14.4 2 9.99 2ZM9.05 8.87L11.46 9.71C12.33 10.02 12.75 10.63 12.75 11.57C12.75 12.65 11.89 13.54 10.84 13.54H10.75V13.59C10.75 14 10.41 14.34 10 14.34C9.59 14.34 9.25 14 9.25 13.59V13.53C8.14 13.48 7.25 12.55 7.25 11.39C7.25 10.98 7.59 10.64 8 10.64C8.41 10.64 8.75 10.98 8.75 11.39C8.75 11.75 9.01 12.04 9.33 12.04H10.83C11.06 12.04 11.24 11.83 11.24 11.57C11.24 11.22 11.18 11.2 10.95 11.12L8.54 10.28C7.68 9.98 7.25 9.37 7.25 8.42C7.25 7.34 8.11 6.45 9.16 6.45H9.25V6.41C9.25 6 9.59 5.66 10 5.66C10.41 5.66 10.75 6 10.75 6.41V6.47C11.86 6.52 12.75 7.45 12.75 8.61C12.75 9.02 12.41 9.36 12 9.36C11.59 9.36 11.25 9.02 11.25 8.61C11.25 8.25 10.99 7.96 10.67 7.96H9.17C8.94 7.96 8.76 8.17 8.76 8.43C8.75 8.77 8.81 8.79 9.05 8.87Z" fill="white"></path>
                        </svg>
                    </div>
                    <div>
                        <p>Mức lương:</p>
                        <p class="font-semibold"><%=  job.getSalary()%></p>
                    </div>
                </div>
                <div class="job-location px-3 py-2 flex gap-[16px] items-center">
                    <div class="flex flex-col items-center justify-center gap-10 h-[40px] w-[40px] p-2 bg-gradient-to-r from-green-500 to-teal-700 rounded-full">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="24" viewBox="0 0 25 24" fill="none">
                            <path d="M21.2866 8.45C20.2366 3.83 16.2066 1.75 12.6666 1.75C12.6666 1.75 12.6666 1.75 12.6566 1.75C9.1266 1.75 5.0866 3.82 4.0366 8.44C2.8666 13.6 6.0266 17.97 8.8866 20.72C9.9466 21.74 11.3066 22.25 12.6666 22.25C14.0266 22.25 15.3866 21.74 16.4366 20.72C19.2966 17.97 22.4566 13.61 21.2866 8.45ZM12.6666 13.46C10.9266 13.46 9.5166 12.05 9.5166 10.31C9.5166 8.57 10.9266 7.16 12.6666 7.16C14.4066 7.16 15.8166 8.57 15.8166 10.31C15.8166 12.05 14.4066 13.46 12.6666 13.46Z" fill="white"></path>
                        </svg>
                    </div>
                    <div>
                        <p>Địa điểm:</p>
                        <p><%=  job.getLocation()%></p>
                    </div>
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
        <div class="job-inf p-8 rounded-lg bg-[white] mb-8 flex flex-col gap-[20px]">
            <h4 class="req-title text-xl border-[#00b14f] border-s-[6px] font-bold pl-2 ">  Chi tiết tin tuyển dụng</h4>
            <div class="job-inf-description pl-4">
                <b>Mô tả công viêc</b>
                <p class="pl-4"><%= job.getDescription()%></p>
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
