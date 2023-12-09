package com.example.cnw.controller;

import com.example.cnw.model.bean.Account;
import com.example.cnw.model.bo.AccountBO;
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        Account account = accountBO.login(email, password);
        System.out.println(account);
        if (account != null) {
            session.setAttribute("account", account);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}
