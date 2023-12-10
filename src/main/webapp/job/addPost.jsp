<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/10/2023
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String location = request.getParameter("location");
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
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%@ include file="../components/layouts/header.jsp" %>
<div class="post-container bg-[#f4f4f4f4]">
    <div class="max-w-[1000px] m-auto pt-10" 1000px="">
        <h4 class="text-xl font-bold">Thông tin đăng tuyển</h4>
        <form action="../jobs" method="POST" class="list-items p-[40px] flex flex-col gap-6">
            <div class="req-item w-full flex flex-col gap-[16px] p-[20px] bg-white rounded-lg">
                <div class="flex gap-2 items-center">
                    <div class="p-2 rounded-full bg-[#f4f4f4]">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg>
                    </div>
                    <p class="req-item-title">Tiêu đề thông tin tuyển dụng</p>
                </div>
                <input class="p-2 border-b focus:outline-none" type="text" placeholder="Nhập thông tin tuyển dụng" name="title" id="title">
            </div>
            <div class="req-item w-full flex flex-col gap-[16px] p-[20px] bg-white rounded-lg">
                <div class="flex gap-2 items-center">
                    <div class="p-2 rounded-full bg-[#f4f4f4]">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="10" viewBox="0 0 320 512"><path d="M160 0c17.7 0 32 14.3 32 32V67.7c1.6 .2 3.1 .4 4.7 .7c.4 .1 .7 .1 1.1 .2l48 8.8c17.4 3.2 28.9 19.9 25.7 37.2s-19.9 28.9-37.2 25.7l-47.5-8.7c-31.3-4.6-58.9-1.5-78.3 6.2s-27.2 18.3-29 28.1c-2 10.7-.5 16.7 1.2 20.4c1.8 3.9 5.5 8.3 12.8 13.2c16.3 10.7 41.3 17.7 73.7 26.3l2.9 .8c28.6 7.6 63.6 16.8 89.6 33.8c14.2 9.3 27.6 21.9 35.9 39.5c8.5 17.9 10.3 37.9 6.4 59.2c-6.9 38-33.1 63.4-65.6 76.7c-13.7 5.6-28.6 9.2-44.4 11V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V445.1c-.4-.1-.9-.1-1.3-.2l-.2 0 0 0c-24.4-3.8-64.5-14.3-91.5-26.3c-16.1-7.2-23.4-26.1-16.2-42.2s26.1-23.4 42.2-16.2c20.9 9.3 55.3 18.5 75.2 21.6c31.9 4.7 58.2 2 76-5.3c16.9-6.9 24.6-16.9 26.8-28.9c1.9-10.6 .4-16.7-1.3-20.4c-1.9-4-5.6-8.4-13-13.3c-16.4-10.7-41.5-17.7-74-26.3l-2.8-.7 0 0C119.4 279.3 84.4 270 58.4 253c-14.2-9.3-27.5-22-35.8-39.6c-8.4-17.9-10.1-37.9-6.1-59.2C23.7 116 52.3 91.2 84.8 78.3c13.3-5.3 27.9-8.9 43.2-11V32c0-17.7 14.3-32 32-32z"/></svg>
                    </div>
                    <p>Mức lương</p>
                </div>
                <input class="p-2 border-b focus:outline-none" type="number" name="salary" placeholder="Nhập mức lương" id="salary">
            </div>
            <div class="req-item w-full flex flex-col gap-[16px] p-[20px] bg-white rounded-lg">
                <div class="flex gap-2 items-center">
                    <div class="p-2 rounded-full bg-[#f4f4f4]">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="12" viewBox="0 0 384 512"><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                    </div>
                    <p>Địa điểm cần tuyển dụng:</p>
                </div>
                <select name="location" id="location" class="w-full h-full border rounded p-4 rounded-lg">
                    <option value="all" <%=(location == null || "all".equals(location)) ? "selected" : ""%>>Toàn quốc</option>
                    <% for (String city : cityList) { %>
                    <option value="<%= city %>" <%=(location != null && city.equals(location)) ? "selected" : ""%>> <%= city %></option>
                    <% } %>
                </select>
            </div>
            <div class="req-item w-full flex flex-col gap-[16px] p-[20px] bg-white rounded-lg">
                <div class="flex gap-2 items-center">
                    <div class="p-2 rounded-full bg-[#f4f4f4]">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><path d="M64 80c-8.8 0-16 7.2-16 16V416c0 8.8 7.2 16 16 16H288V352c0-17.7 14.3-32 32-32h80V96c0-8.8-7.2-16-16-16H64zM288 480H64c-35.3 0-64-28.7-64-64V96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V320v5.5c0 17-6.7 33.3-18.7 45.3l-90.5 90.5c-12 12-28.3 18.7-45.3 18.7H288z"/></svg>
                    </div>
                    <p>Mô tả công việc</p>
                </div>
                <textarea class="border rounded-lg h-[100px]" name="description" id="description" cols="30" rows="10"></textarea>
            </div>
            <div class="req-item w-full flex flex-col gap-[16px] p-[20px] bg-white rounded-lg">
                <div class="flex gap-2 items-center">
                    <div class="p-2 rounded-full bg-[#f4f4f4]">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24V264c0 13.3-10.7 24-24 24s-24-10.7-24-24V152c0-13.3 10.7-24 24-24zM224 352a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z"/></svg>
                    </div>
                    <p>Yêu cầu công việc</p>
                </div>
                <textarea class="border rounded-lg h-[100px]" name="requirement" id="requirement" cols="30" rows="10"></textarea>
            </div>
            <input type="submit" class="py-2 mb-8 w-full bg-[#00b14f] rounded-lg text-white" value="Đăng bài tuyển dụng">
        </form>
    </div>
</div>
</body>
</html>
