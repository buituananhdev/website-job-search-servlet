package com.example.cnw.controller;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.cnw.model.dao.JobDAO;
import com.example.cnw.model.bean.Job;

@WebServlet("/jobs")
public class JobController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JobDAO jobDAO = new JobDAO();
        List<Job> jobs = jobDAO.getAllJobs();

        request.setAttribute("jobList", jobs);

        RequestDispatcher rd = request.getRequestDispatcher("job/index.jsp");
        rd.forward(request, response);
    }
}
