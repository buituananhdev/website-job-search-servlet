package com.example.cnw.controller;

import com.example.cnw.model.bean.Account;
import com.example.cnw.model.bean.Applicant;
import com.example.cnw.model.bo.ApplicantBO;
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
    ApplicantBO ApplicantBO = new ApplicantBO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String candidateIdParam = request.getParameter("candidate_id");
        String jobIdParam = request.getParameter("job_id");
        List<Applicant> applicants = null;
        if ( candidateIdParam !=null && !candidateIdParam.isEmpty()) {
            int candidate_id = Integer.parseInt(candidateIdParam);
            applicants = ApplicantBO.getApplicants(candidate_id, 0);
        } else if( jobIdParam !=null && !jobIdParam.isEmpty()) {
            int job_id = Integer.parseInt(jobIdParam);
            applicants = ApplicantBO.getApplicants(0, job_id);
        }
        request.setAttribute("applicants", applicants);
        RequestDispatcher rd = request.getRequestDispatcher("applicant/index.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        if( jobId > 0 ) {
            HttpSession session = request.getSession();
            Account currentUser = (Account) session.getAttribute("account");
            AccountDAO accountDAO = new AccountDAO();
            int candidateId = accountDAO.getIdCandidate(currentUser.getAccountId());

            Applicant newApplicant = new Applicant(candidateId, jobId);
            ApplicantBO.addApplicant(newApplicant);
            List<Applicant> applicants = ApplicantBO.getApplicants(newApplicant.getCandidate_id(), 0);
            request.setAttribute("applicants", applicants);
            RequestDispatcher rd = request.getRequestDispatcher("applicant/index.jsp");
            rd.forward(request, response);
        }

    }
}
