package com.example.cnw.controller;

import com.example.cnw.model.bean.Account;
import com.example.cnw.model.bean.Job;
import com.example.cnw.model.bo.JobBO;
import com.example.cnw.model.dao.AccountDAO;
import com.example.cnw.model.dao.JobDAO;
import com.example.cnw.model.dto.JobDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/jobs")
public class JobController extends HttpServlet {
    JobBO jobBO = new JobBO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jobIdParam = request.getParameter("jobId");
        String companyIdParam = request.getParameter("companyId");
        if (jobIdParam != null && !jobIdParam.isEmpty()) {
            // Nếu có param jobId, gọi đến detailJob
            int jobId = Integer.parseInt(jobIdParam);
            detailJob(request, response, jobId);
        } else if (companyIdParam != null && !companyIdParam.isEmpty()) {
            int companyId = Integer.parseInt(companyIdParam);
            List<JobDTO> jobs = jobBO.getFilteredJobs(companyId, "", "", "");
            request.setAttribute("jobList", jobs);

            RequestDispatcher rd = request.getRequestDispatcher("jobs/listJobs.jsp");
            rd.forward(request, response);
        } else  {
            List<JobDTO> jobs = jobBO.getAllJobs();

            request.setAttribute("jobList", jobs);

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }

    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String salary = request.getParameter("salary");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String requirement = request.getParameter("requirement");

        double salaryParam = Double.parseDouble(salary);
        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("account");
        AccountDAO accountDAO = new AccountDAO();
        int idCompany = accountDAO.getIdCompany(currentUser.getAccountId());
        Job job = new Job(title, description,requirement,salaryParam, location, idCompany);
        jobBO.addJob(job);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    protected void detailJob(HttpServletRequest request, HttpServletResponse response, int jobId)
            throws ServletException, IOException {
            Job job = jobBO.getJobById(jobId);

            if (job != null) {
                request.setAttribute("job", job);

                RequestDispatcher rd = request.getRequestDispatcher("jobs/detail.jsp");
                rd.forward(request, response);
            } else {
                response.getWriter().println("Job not found");
            }
    }

}
