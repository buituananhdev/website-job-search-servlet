<%@ page import="com.example.cnw.model.bo.AccountBO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String isFail = (String) session.getAttribute("isFail");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<section class="bg-gray-50">
    <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
        <div class="w-full bg-white rounded-lg shadow md:mt-0 sm:max-w-md xl:p-0">
            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl">
                    Create an Candidate Account
                </h1>
                <form class="space-y-4 md:space-y-6" action="../auth" method="post">
                    <div>
                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900">Your email <span class="text-red-700">*</span></label>
                        <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="name@company.com" required="">
                    </div>
                    <div>
                        <label for="password" class="block mb-2 text-sm font-medium text-gray-900">Password <span class="text-red-700">*</span></label>
                        <input type="password" name="password" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required="">
                    </div>
                    <div>
                        <label for="confirm_password" class="block mb-2 text-sm font-medium text-gray-900">Confirm Password <span class="text-red-700">*</span></label>
                        <input type="password" name="confirm_password" id="confirm_password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required="">
                    </div>
                    <% if (isFail != null && !isFail.isEmpty()) { %>
                        <span>Fail</span>
                    <% } %>

                    <input type="hidden" name="formType" value="signup_candidate">
                    <button type="submit" class="w-full text-white flex flex-row items-center justify-center w-full px-2 py-2 mb-4 text-sm font-bold bg-[#00b14f] leading-6 capitalize duration-100 transform rounded-lg shadow cursor-pointer focus:ring-4 focus:ring-green-500 focus:ring-opacity-50 focus:outline-none sm:mb-0 sm:mr-4 md:pl-8 md:pr-6 xl:pl-12 xl:pr-10 hover:shadow-lg hover:-translate-y-1">Sign Up</button>
                    <p class="text-sm font-light text-gray-500">
                        Already have an account? <a href="login.jsp" class="font-medium text-primary-600 hover:underline">Log in</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
</section>

</body>
</html>