package com.example.cnw.model.bo;
import com.example.cnw.model.bean.Job;
import com.example.cnw.model.dao.JobDAO;

import java.util.List;

public class JobBO {
    private JobDAO jobDAO;

    public JobBO() {
        this.jobDAO = new JobDAO();
    }

    public List<Job> getAllJobs() {
        return jobDAO.getAllJobs();
    }

    public Job getJobById(int jobId) {
        return jobDAO.getJobById(jobId);
    }

    public void addJob(Job job) {
        jobDAO.addJob(job);
    }

    public void updateJob(Job job) {
        jobDAO.updateJob(job);
    }

    public void deleteJob(int jobId) {
        jobDAO.deleteJob(jobId);
    }
}
