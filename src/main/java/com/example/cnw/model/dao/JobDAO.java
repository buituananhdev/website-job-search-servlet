package com.example.cnw.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.cnw.model.bean.Company;
import com.example.cnw.model.bo.CompanyBO;
import com.example.cnw.model.dto.JobDTO;
import com.example.cnw.utils.DButils;
import com.example.cnw.model.bean.Job;

public class JobDAO {
    private final String GET_ALL_JOBS = "SELECT * FROM Jobs";
    private final String GET_JOB_BY_ID = "SELECT * FROM Jobs WHERE job_id=?";
    private final String ADD_JOB = "INSERT INTO Jobs (title, description, requirements, salary, location, company_id) VALUES (?, ?, ?, ?, ?, ?)";
    private final String UPDATE_JOB = "UPDATE Jobs SET title=?, description=?, requirements=?, salary=?, location=?, company_id=? WHERE job_id=?";
    private final String DELETE_JOB = "DELETE FROM Jobs WHERE job_id=?";

    public List<JobDTO> getAllJobs() {
        List<JobDTO> jobs = new ArrayList<>();
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_JOBS);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            CompanyBO companyBO = new CompanyBO();
            while (resultSet.next()) {
                JobDTO job = new JobDTO();
                job.setJobId(resultSet.getInt("job_id"));
                job.setTitle(resultSet.getString("title"));
                job.setDescription(resultSet.getString("description"));
                job.setRequirements(resultSet.getString("requirements"));
                job.setSalary(resultSet.getDouble("salary"));
                job.setLocation(resultSet.getString("location"));
                Company company = companyBO.getCompanyById(resultSet.getInt("company_id"));
                job.setCompanyName(company.getName());
                jobs.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobs;
    }

    public List<JobDTO> getFilteredJobs(String keyword, String location, String salary) {
        List<JobDTO> filteredJobList = new ArrayList<>();

        keyword = (keyword != null) ? keyword.trim() : "";
        location = (location != null && !"all".equals(location)) ? location.trim() : "";
        salary = (salary != null && !"0".equals(salary)) ? salary.trim() : "";

        String filteredQuery = GET_ALL_JOBS;

        if (!keyword.isEmpty() || !location.isEmpty() || !salary.isEmpty()) {
            filteredQuery += " WHERE ";
            if (!keyword.isEmpty()) {
                filteredQuery += "title LIKE ? AND ";
            }
            if (!location.isEmpty()) {
                filteredQuery += "location = ? AND ";
            }
            if (!salary.isEmpty()) {
                filteredQuery += getSalaryRangeCondition(Integer.parseInt(salary)) + " AND ";
            }

            filteredQuery = filteredQuery.replaceAll(" AND $", "");
        }

        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(filteredQuery)) {

            int parameterIndex = 1;
            if (!keyword.isEmpty()) {
                preparedStatement.setString(parameterIndex++, "%" + keyword + "%");
            }
            if (!location.isEmpty()) {
                preparedStatement.setString(parameterIndex++, location);
            }

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    JobDTO job = new JobDTO();
                    job.setJobId(resultSet.getInt("job_id"));
                    job.setTitle(resultSet.getString("title"));
                    job.setDescription(resultSet.getString("description"));
                    job.setRequirements(resultSet.getString("requirements"));
                    job.setSalary(resultSet.getDouble("salary"));
                    job.setLocation(resultSet.getString("location"));
                    CompanyBO companyBO = new CompanyBO();
                    Company company = companyBO.getCompanyById(resultSet.getInt("company_id"));
                    job.setCompanyName(company.getName());
                    filteredJobList.add(job);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return filteredJobList;
    }

    private String getSalaryRangeCondition(int salaryCode) {
        switch (salaryCode) {
            case 1:
                return "salary < 10000000"; // Dưới 10 triệu
            case 2:
                return "salary BETWEEN 10000000 AND 15000000"; // 10 - 15 triệu
            case 3:
                return "salary BETWEEN 15000000 AND 20000000"; // 15 - 20 triệu
            case 4:
                return "salary BETWEEN 20000000 AND 25000000"; // 20 - 25 triệu
            case 5:
                return "salary > 25000000"; // Trên 25 triệu
            default:
                return ""; // Handle the default case or throw an exception based on your requirements
        }
    }

    public Job getJobById(int jobId) {
        Job job = null;
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_JOB_BY_ID)) {
            preparedStatement.setInt(1, jobId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    job = new Job();
                    job.setJobId(resultSet.getInt("job_id"));
                    job.setTitle(resultSet.getString("title"));
                    job.setDescription(resultSet.getString("description"));
                    job.setRequirements(resultSet.getString("requirements"));
                    job.setSalary(resultSet.getDouble("salary"));
                    job.setLocation(resultSet.getString("location"));
                    job.setCompanyId(resultSet.getInt("company_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return job;
    }

    public void addJob(Job job) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_JOB)) {
            preparedStatement.setString(1, job.getTitle());
            preparedStatement.setString(2, job.getDescription());
            preparedStatement.setString(3, job.getRequirements());
            preparedStatement.setDouble(4, job.getSalary());
            preparedStatement.setString(5, job.getLocation());
            preparedStatement.setInt(6, job.getCompanyId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateJob(Job job) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_JOB)) {
            preparedStatement.setString(1, job.getTitle());
            preparedStatement.setString(2, job.getDescription());
            preparedStatement.setString(3, job.getRequirements());
            preparedStatement.setDouble(4, job.getSalary());
            preparedStatement.setString(5, job.getLocation());
            preparedStatement.setInt(6, job.getCompanyId());
            preparedStatement.setInt(7, job.getJobId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteJob(int jobId) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_JOB)) {
            preparedStatement.setInt(1, jobId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
