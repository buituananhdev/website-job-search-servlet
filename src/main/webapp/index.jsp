<%@ page import="com.example.cnw.model.bo.JobBO" %>
<%@ page import="com.example.cnw.model.bean.Job" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="com.example.cnw.model.dto.JobDTO" %>
<%
    String keyword = request.getParameter("keyword");
    String location = request.getParameter("search-location");
    String salary = request.getParameter("search-salary");

    JobBO jobBO = new JobBO();
    List<JobDTO> filteredJobList = jobBO.getFilteredJobs(keyword, location, salary);

    List<String> cityList = new ArrayList<>(List.of(
            "Hồ Chí Minh",
            "Hà Nội",
            "Đà Nẵng",
            "Hải Phòng",
            "An Giang",
            "Bà Rịa - Vũng Tàu",
            "Bắc Giang",
            "Bắc Kạn",
            "Bạc Liêu",
            "Bắc Ninh",
            "Bến Tre",
            "Bình Định",
            "Bình Dương",
            "Bình Phước",
            "Bình Thuận",
            "Cà Mau",
            "Cần Thơ",
            "Cao Bằng",
            "Đắk Lắk",
            "Đắk Nông",
            "Điện Biên",
            "Đồng Nai",
            "Đồng Tháp",
            "Gia Lai",
            "Hà Giang",
            "Hà Nam",
            "Hà Tĩnh",
            "Hải Dương",
            "Hậu Giang",
            "Hòa Bình",
            "Hưng Yên",
            "Khánh Hòa",
            "Kiên Giang",
            "Kon Tum",
            "Lai Châu",
            "Lâm Đồng",
            "Lạng Sơn",
            "Lào Cai",
            "Long An",
            "Nam Định",
            "Nghệ An",
            "Ninh Bình",
            "Ninh Thuận",
            "Phú Thọ",
            "Phú Yên",
            "Quảng Bình",
            "Quảng Nam",
            "Quảng Ngãi",
            "Quảng Ninh",
            "Quảng Trị",
            "Sóc Trăng",
            "Sơn La",
            "Tây Ninh",
            "Thái Bình",
            "Thái Nguyên",
            "Thanh Hóa",
            "Thừa Thiên Huế",
            "Tiền Giang",
            "Trà Vinh",
            "Tuyên Quang",
            "Vĩnh Long",
            "Vĩnh Phúc",
            "Yên Bái"
    ));
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="font-sans bg-gray-100">
<%@ include file="/components/layouts/header.jsp" %>
<section id="jobs-area" class="container mx-auto mt-8 pb-100 flex flex-col items-center">
    <header>
        <h2 class="text-3xl font-semibold text-[#009643] mb-2">Tìm việc làm nhanh 24h, việc làm mới nhất trên toàn quốc.</h2>
        <p class="text-gray-600 text-center">Tiếp cận 40,000+ tin tuyển dụng việc làm mỗi ngày từ hàng nghìn doanh nghiệp uy tín tại Việt Nam</p>
    </header>
    <form class="flex space-x-4 my-4" method="get" action="<%= request.getRequestURI() %>">
        <div class="h-full relative flex items-center rounded-lg">
            <input type="text" name="keyword" placeholder="Vị trí tuyển dụng" id="keyword" autocomplete="off"
                   value="<%= (keyword == null) ? "" : keyword %>" class="filter-box p-4 rounded border border-gray-300 px-10">
            <img src="./assets/icons/icn-search.svg" alt="" class="absolute left-4 top-1/2 transform -translate-y-1/2">
        </div>
        <div class="filter-box">
            <select name="search-location" id="search-location" class="w-full h-full border-none border rounded p-4 rounded-lg">
                <option value="all" disabled selected>Vị trí</option>
                <option value="all" <%=(location == null || "all".equals(location)) ? "selected" : ""%>>Toàn quốc</option>
                <% for (String city : cityList) { %>
                    <option value="<%= city %>" <%=(location != null && city.equals(location)) ? "selected" : ""%>> <%= city %></option>
                <% } %>
            </select>
        </div>
        <div class="filter-box">
            <select name="search-salary" id="search-salary" class="w-full h-full border-none border rounded p-4 rounded-lg">
                <option value="0" <%=(salary == null || "0".equals(salary)) ? "selected" : ""%>>Tất cả mức lương</option>
                <option value="1" <%=(salary != null && "1".equals(salary)) ? "selected" : ""%>>Dưới 10 triệu</option>
                <option value="2" <%=(salary != null && "2".equals(salary)) ? "selected" : ""%>>10 - 15 triệu</option>
                <option value="3" <%=(salary != null && "3".equals(salary)) ? "selected" : ""%>>15 - 20 triệu</option>
                <option value="4" <%=(salary != null && "4".equals(salary)) ? "selected" : ""%>>20 - 25 triệu</option>
                <option value="5" <%=(salary != null && "5".equals(salary)) ? "selected" : ""%>>Trên 25 triệu</option>
            </select>
        </div>
        <button type="submit" class="flex flex-row items-center justify-center w-full px-4 py-4 mb-4 text-sm font-bold bg-green-300 leading-6 capitalize duration-100 transform rounded-lg shadow cursor-pointer focus:ring-4 focus:ring-green-500 focus:ring-opacity-50 focus:outline-none sm:mb-0 sm:w-auto sm:mr-4 md:pl-8 md:pr-6 xl:pl-12 xl:pr-10   hover:shadow-lg hover:-translate-y-1 text-white">Tìm kiếm</button>
    </form>
    <section id="jobs-grid" class="grid grid-cols-1 md:grid-cols-4 gap-4" style="padding-bottom: 100px">
        <% for (JobDTO job : filteredJobList) { %>
        <a href=jobs?jobId=<%= job.getJobId()%>>
            <div class="job-card bg-white shadow-md p-4 rounded">
                <div class="flex flex-col">
                    <span class="title text-blue-900 font-semibold text-lg mb-2"><%= job.getTitle() %></span>
                    <span class="company text-gray-600"><%= job.getCompanyName() %></span>
                </div>
                <div class="flex items-center mt-2">
                    <span class="salary bg-gray-100 px-2 py-1 rounded text-gray-700 mr-2"><%= NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(job.getSalary()) %></span>
                    <span class="location text-gray-700"><%= job.getLocation() %></span>
                </div>
            </div>
        </a>
        <% } %>
    </section>
    <% if (filteredJobList.size() == 0) { %>
        <div class="w-full h-full flex justify-center items-center">
            <img class="w-[400px]" src="assets/icons/not-found.svg">
        </div>
    <% } %>
</section>
</body>
</html>
