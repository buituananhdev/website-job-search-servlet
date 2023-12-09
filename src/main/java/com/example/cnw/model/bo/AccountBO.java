package com.example.cnw.model.bo;

import com.example.cnw.model.bean.Account;
import com.example.cnw.model.dao.AccountDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class AccountBO {
    private AccountDAO accountDAO;

    // Initialize the accountDAO in the constructor or using dependency injection
    public AccountBO() {
        this.accountDAO = new AccountDAO();
    }

    public Account login(String email, String password) {
        return accountDAO.isValidUser(email, password);
    }

    public void logout(HttpServletRequest request) {
        // Invalidate the session to perform logout
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }

    public Account getAccountDetail(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Retrieve the account from the session
            return (Account) session.getAttribute("account");
        }
        return null; // No account found in the session
    }
}
