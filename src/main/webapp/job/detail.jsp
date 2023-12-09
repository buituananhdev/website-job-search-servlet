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
<html>
<head>
    <title>Title</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">--%>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<style>
    /*.container {*/
    /*    background-color: #f4f4f4;*/
    /*    width: 100%;*/
    /*    height: 100vh;*/
    /*    overflow: hidden;*/
    /*}*/
    .content {
        height: 100%;
        padding: 40px;
        max-width: 1000px;
        margin: auto;
    }
</style>
<body>
<% Job job = (Job) request.getAttribute("job");%>
<div class="bg-[#f4f4f4] h-[100vh] w-full overflow-hidden">
    <div class="h-full p-[40px] max-w-[1000px] m-auto">
        <h2 class="title text-2xl text-[#009643] font-bold mb-10">Thông tin công ty</h2>
        <div class="job-inf p-4 rounded-lg bg-[white] mb-6 shadow-sm">
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
            <a href="/applicants?job_id=<%job.getJobId();%>&candidate_id" class="apply-button w-full bg-[#009643] text-white rounded-md py-1.5 ">Ứng tuyển</a>
        </div>

        <div class="job-inf p-4 rounded-lg bg-[white] shadow-sm mb-8">
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
