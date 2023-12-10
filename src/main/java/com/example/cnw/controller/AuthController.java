package com.example.cnw.controller;

import com.example.cnw.model.bean.Account;
import com.example.cnw.model.bo.AccountBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/auth")
public class AuthController extends HttpServlet {

    AccountBO accountBO = new AccountBO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,  IOException {
        String formType = request.getParameter("formType");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        switch (formType){
            case "login":
                Account account = accountBO.login(email, password);
                if (account != null) {
                    session.setAttribute("account", account);
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("auth/login.jsp");
                }
                break;
            case "signup_candidate":
                boolean isSuccess = accountBO.addAccount(email, password, "candidate");
                if (isSuccess) {
                    response.sendRedirect("auth/login.jsp");
                } else {
                    request.setAttribute("isFail", "fail");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("auth/signup.jsp");
                    dispatcher.forward(request, response);
                }
                break;
            default:
                break;
        }
    }
}
