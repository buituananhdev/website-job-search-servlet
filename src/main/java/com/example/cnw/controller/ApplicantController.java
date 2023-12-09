package com.example.cnw.controller;

import com.example.cnw.model.bean.Account;
import com.example.cnw.model.bean.Applicant;
import com.example.cnw.model.dao.AccountDAO;
import com.example.cnw.model.dao.ApplicantDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/applicants")
public class ApplicantController extends HttpServlet {
    ApplicantDAO ApplicantDAO = new ApplicantDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int candidate_id = Integer.parseInt(request.getParameter("candidate_id"));
        List<Applicant> applicants = ApplicantDAO.getApplicantsByCandidateId(candidate_id);
        request.setAttribute("applicants", applicants);
        RequestDispatcher rd = request.getRequestDispatcher("applicant/index.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("job_id"));

        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("account");
        AccountDAO accountDAO = new AccountDAO();
        int candidateId = accountDAO.getIdCandidate(currentUser.getAccountId());

        Applicant newApplicant = new Applicant(candidateId, jobId);
        ApplicantDAO.addApplication(newApplicant);
        List<Applicant> applicants = ApplicantDAO.getApplicantsByCandidateId(newApplicant.getCandidate_id());
        request.setAttribute("applicants", applicants);
        RequestDispatcher rd = request.getRequestDispatcher("applicant/index.jsp");
        rd.forward(request, response);
    }
}
