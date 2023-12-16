package com.example.cnw.model.bo;

import com.example.cnw.model.bean.Account;
import com.example.cnw.model.bean.Candidate;
import com.example.cnw.model.bean.Company;
import com.example.cnw.model.bean.Job;
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

    public int getCandidateId(int accountId) {
        return accountDAO.getIdCandidate(accountId);
    }

    public int getCompanyId(int accountId) {
        return accountDAO.getIdCompany(accountId);
    }

    public Account getAccountDetail(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Retrieve the account from the session
            return (Account) session.getAttribute("account");
        }
        return null; // No account found in the session
    }

    public boolean addAccountCompany(String email, String password, String name, String description, String location) {
        Account account = new Account(email, password, "company");
        Account newAccount =  accountDAO.addAccount(account);
        Company company = new Company(name, description, location, newAccount.getAccountId());
        CompanyBO companyBO = new CompanyBO();
        companyBO.addCompany(company);
        return newAccount != null;
    }

    public boolean addAccountCandidate(String email, String password, String name, String phone) {
        Account account = new Account(email, password, "candidate");
        Account newAccount =  accountDAO.addAccount(account);
        Candidate candidate = new Candidate(name, email, phone, password, newAccount.getAccountId());
        CandidateBO candidateBO = new CandidateBO();
        candidateBO.addCandidate(candidate);
        return newAccount != null;
    }
}
