package com.example.cnw.controller;

import com.example.cnw.model.bean.Job;
import com.example.cnw.model.bo.JobBO;
import com.example.cnw.model.dao.JobDAO;
import com.example.cnw.model.dto.JobDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/jobs")
public class JobController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jobIdParam = request.getParameter("jobId");

        if (jobIdParam != null && !jobIdParam.isEmpty()) {
            // Nếu có param jobId, gọi đến detailJob
            int jobId = Integer.parseInt(jobIdParam);
            detailJob(request, response, jobId);
        } else {
            JobDAO jobDAO = new JobDAO();
            List<JobDTO> jobs = jobDAO.getAllJobs();

            request.setAttribute("jobList", jobs);

            RequestDispatcher rd = request.getRequestDispatcher("job/index.jsp");
            rd.forward(request, response);
        }
    }

    protected void detailJob(HttpServletRequest request, HttpServletResponse response, int jobId)
            throws ServletException, IOException {
            JobBO jobBO = new JobBO();
            Job job = jobBO.getJobById(jobId);

            if (job != null) {
                request.setAttribute("job", job);

                RequestDispatcher rd = request.getRequestDispatcher("job/detail.jsp");
                rd.forward(request, response);
            } else {
                response.getWriter().println("Job not found");
            }
    }

}
