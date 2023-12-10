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
                    <div class="relative inline-block text-left">
                        <div>
                            <button onclick="setStatusDropDown()" type="button" class="dropbtn inline-flex w-full justify-center gap-x-1.5 rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50" id="menu-button" aria-expanded="true" aria-haspopup="true">
                                <img src="../assets/icons/default-user.svg" alt="">
                                <%= currentUser.getEmail() %>
                                <svg class="-mr-1 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z" clip-rule="evenodd" />
                                </svg>
                            </button>
                        </div>
                        <div id="myDropdown" class="dropdown-content hidden absolute right-0 z-10 mt-2 w-56 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="menu-button" tabindex="-1">
                            <div class="py-1" role="none">
                                <% if (currentUser.getRole().equals("candidate")) { %>
                                    <a href="../index.jsp" class="text-gray-700 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">Trang chủ</a>
                                    <a href="../applicant/index.jsp" class="text-gray-700 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-1">Đơn ứng tuyển tôi</a>
                                <% } else { %>
                                    <a href="#" class="text-gray-700 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">Tin tuyển dụng của tôi</a>
                                <% } %>
                                <form method="POST" action="../auth" role="none">
                                    <input type="hidden" name="formType" value="signout">
                                    <button type="submit" class="text-gray-700 block w-full px-4 py-2 text-left text-sm" role="menuitem" tabindex="-1" id="menu-item-3">Sign out</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </nav>
</header>
<script>
    function setStatusDropDown() {
        document.getElementById("myDropdown").classList.toggle("hidden");
    }

    window.onclick = function(event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (!openDropdown.classList.contains('hidden')) {
                    openDropdown.classList.add('hidden');
                }
            }
        }
    }
</script>
</body>
</html>
