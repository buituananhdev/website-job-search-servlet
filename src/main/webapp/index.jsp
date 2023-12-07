<%@ page import="com.example.cnw.model.bo.JobBO" %>
<%@ page import="com.example.cnw.model.bean.Job" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%
  JobBO jobBO = new JobBO();
  List<Job> jobList = jobBO.getAllJobs();
%>
<html>
<head>
  <title>Job List</title>
  <link rel="stylesheet" type="text/css" href="./assets/css/main.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    .job-container {
      width: 100%;
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 16px;
      margin: 20px auto;
    }

    .job-card {
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 15px;
      border-radius: 5px;
      text-align: left;
    }

    .job-card div {
      display: flex;
    }
    .top-infor {
      flex-direction: column;
      justify-content: flex-start;
    }
    .bottom-infor {
      flex-direction: row;
      justify-content: flex-start;
      gap: 8px;
    }
    .title {
      color: #212f3f;
      font-size: 14px;
      font-weight: 600;
      line-height: 20px;
    }
    .company {
      color: #6f7882;
      font-size: 12px;
      font-weight: 500;
      line-height: 16px;
    }
    .bottom-infor span {
      background: #f4f5f5;
      border-radius: 4px;
      color: #212f3f;
      display: inline-flex;
      font-size: 12px;
      font-weight: 500;
      line-height: 16px;
      padding: 4px 8px;
      color: #212f3f;
      display: inline-flex;
      font-size: 12px;
      font-weight: 500;
      line-height: 16px;
    }
    .filter {
      width: 80%;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 20px;
    }
    .filter-box {
      height: 56px;
      width: 253px;
    }
    .filter-box input,
    select {
      border: none;
      border-radius: 6px!important;
      font-size: 14px;
      font-weight: 500;
      height: 100%;
      outline: none;
      padding: 19px;
      width: 100%;
      box-shadow: 0 10px 40px rgba(0,0,0,.03);
    }
    .search-title {
      position: relative;
    }
    .search-title img {
      width: 30px;
      height: 30px;
      position: absolute;
      top: 13px;
      left: 15px;
    }
    .search-title input {
      padding-left: 52px;
    }
    .filter button {
      width: 120px;
      height: 100%;
      font-size: 16px;
      font-weight: 600;
      line-height: 24px;
      margin-top: 0;
      min-width: 120px;
      padding-bottom: 15px;
      padding-top: 15px;
      transition: .3s;
      background: #00b14f;
      border-radius: 6px;
      color: #fff;
      padding: 6px 12px;
      margin-bottom: 0;
      border: 1px solid transparent;
    }
  </style>
</head>
<body>
<nav id="nav">

</nav>
<section id="jobs-area" class="container">
  <header>
    <h2 class="title">Tìm việc làm nhanh 24h, việc làm mới nhất trên toàn quốc.</h2>
    <p class="description">Tiếp cận 40,000+ tin tuyển dụng việc làm mỗi ngày từ hàng nghìn doanh nghiệp uy tín tại Việt Nam</p>
  </header>
  <form class="filter">
    <div class="search-title filter-box">
      <input type="text" placeholder="Vị trí tuyển dụng" id="keyword" autocomplete="off">
      <img src="./assets/icons/icn-search.svg" alt="">
    </div>
    <div class="search-location filter-box">
      <select name="search-location" id="search-location">
        <option value="all">Vị trí</option>
        <option value="all">Tất cả</option>
        <option value="Đà Nẵng">Đà Nẵng</option>
        <option value="Hà Nội">Hà Nội</option>
      </select>
    </div>
    <div class="search-salary filter-box">
      <select name="search-salary" id="search-salary">
        <option value="0">Mức lương</option>
        <option value="0">Tất cả mức lương</option>
        <option value="1">Dưới 10 triệu</option>
        <option value="2">10 - 15 triệu</option>
        <option value="3">15 - 20 triệu</option>
        <option value="4">20 - 25 triệu</option>
        <option value="5">Trên 25 triệu</option>
      </select>
    </div>
    <button>Tìm kiếm</button>
  </form>
  <section id="jobs-grid" class="job-container">
    <% for (Job job : jobList) { %>
      <div class="job-card">
        <div class="top-infor">
          <span class="title"><%= job.getTitle() %></span>
          <span class="company"><%= job.getCompanyId() %></span>
        </div>
        <div class="bottom-infor">
          <span class="salary"><%= job.getSalary() %></span>
          <span class="location"><%= job.getLocation() %></span>
        </div>
      </div>
    <% } %>
  </section>
</section>
</body>
</html>
