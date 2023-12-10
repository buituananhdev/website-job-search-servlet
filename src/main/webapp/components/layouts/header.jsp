<%@ page import="com.example.cnw.model.bean.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Account currentUser = (Account) session.getAttribute("account");
%>
<html>
<head>
</head>
<body>
<header>
    <nav class="bg-white border-gray-200 px-4 lg:px-6 py-4">
        <div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl">
            <a href="" class="flex items-center">
                <span class="self-center text-xl font-semibold whitespace-nowrap">CNW</span>
            </a>
            <div class="flex items-center lg:order-2">
                <% if (currentUser == null) { %>
                <div class="flex space-x-4">
                    <a href="auth/login.jsp"
                       class="text-green-700 hover:text-white border border-green-300 hover:bg-green-300 focus:ring-4 focus:outline-none focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Đăng
                        nhập</a>
                    <a href="auth/signup.jsp"
                       class="text-white bg-green-300 focus:ring-4 focus:ring-green-500 focus:ring-opacity-50 focus:outline-none font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2">Đăng
                        ký</a>
                    <a href="auth/signup_company.jsp"
                       class="text-white bg-[#24292F] hover:bg-[#24292F]/90 focus:ring-4 focus:outline-none focus:ring-[#24292F]/50 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center">Đăng
                        ký tuyển dụng</a>
                    <button data-collapse-toggle="mobile-menu-2" type="button"
                            class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200"
                            aria-controls="mobile-menu-2" aria-expanded="false">
                        <span class="sr-only">Open main menu</span>
                        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                                  clip-rule="evenodd"></path>
                        </svg>
                        <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                  clip-rule="evenodd"></path>
                        </svg>
                    </button>
                </div>
                <% } else { %>
                <div class="flex space-x-4">
                    <p><%= currentUser.getEmail() %>
                    </p>
                    <p><%= currentUser.getRole() %>
                    </p>
                </div>
                <% } %>
            </div>
            <div class="justify-between items-center lg:flex lg:order-1" id="mobile-menu-2">
                <ul class="flex flex-col mt-4 font-medium lg:flex-row lg:space-x-8 lg:mt-0">
                    <% if (currentUser != null) { %>
                    <% if (currentUser.getRole().equals("candidate")) { %>
                    <li>
                        <a href="#" class="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-primary-700 lg:p-0">Trang chủ</a>
                    </li>
                    <li>
                        <a href="#" class="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-primary-700 lg:p-0">Việc làm của tôi</a>
                    </li>
                    <% } else { %>
                    <li>
                        <a href="#" class="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-primary-700 lg:p-0">Tuyển dụng của tôi</a>
                    </li>
                    <% } %>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
</header>
</body>
</html>
