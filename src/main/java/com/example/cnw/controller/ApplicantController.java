package com.example.cnw.controller;

import com.example.cnw.model.bean.Applicant;
import com.example.cnw.model.bo.ApplicantBO;
import com.example.cnw.model.dao.ApplicantDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/applicants")
public class ApplicantController extends HttpServlet {
    ApplicantDAO ApplicantDAO = new ApplicantDAO();
    protected void getApplicantsById(HttpServletRequest request, HttpServletResponse response, int candidate_id)
            throws ServletException, IOException {
        String isApply = request.getParameter("Apply");
        if (isApply != null && isApply != null) {
            try {
                int candidateId = Integer.parseInt(request.getParameter("candidate_id"));
                int jobId = Integer.parseInt(request.getParameter("job_id"));

                Applicant newApplicant = new Applicant(candidateId, jobId);
                addApplicant(request, response, newApplicant);

            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        } else {
            List<Applicant> applicants = ApplicantDAO.getApplicantsByCandidateId(candidate_id);
            request.setAttribute("applicants", applicants);
            RequestDispatcher rd = request.getRequestDispatcher("applicant/index.jsp");
            rd.forward(request, response);
        }
    }

    protected void addApplicant(HttpServletRequest request, HttpServletResponse response, Applicant applicant)
            throws ServletException, IOException {
            ApplicantDAO.addApplication(applicant);
            List<Applicant> applicants = ApplicantDAO.getApplicantsByCandidateId(applicant.getCandidate_id());
            request.setAttribute("applicants", applicants);
            RequestDispatcher rd = request.getRequestDispatcher("applicant/index.jsp");
            rd.forward(request, response);
    }
}
