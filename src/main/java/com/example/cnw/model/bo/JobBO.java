package com.example.cnw.model.bo;
import com.example.cnw.model.bean.Job;
import com.example.cnw.model.dao.JobDAO;
import com.example.cnw.model.dto.JobDTO;

import java.util.List;

public class JobBO {
    private JobDAO jobDAO;

    public JobBO() {
        this.jobDAO = new JobDAO();
    }

    public List<JobDTO> getAllJobs() {
        return jobDAO.getAllJobs();
    }

    public List<JobDTO> getFilteredJobs(String keyword, String location, String salary) {
        return jobDAO.getFilteredJobs(keyword, location, salary);
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
