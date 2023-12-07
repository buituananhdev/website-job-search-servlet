package com.example.cnw.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.example.cnw.utils.DButils;
import com.example.cnw.model.bean.Job;

public class JobDAO {
    private final String GET_ALL_JOBS = "SELECT * FROM Jobs";
    private final String GET_JOB_BY_ID = "SELECT * FROM Jobs WHERE job_id=?";
    private final String ADD_JOB = "INSERT INTO Jobs (title, description, requirements, salary, location, company_id) VALUES (?, ?, ?, ?, ?, ?)";
    private final String UPDATE_JOB = "UPDATE Jobs SET title=?, description=?, requirements=?, salary=?, location=?, company_id=? WHERE job_id=?";
    private final String DELETE_JOB = "DELETE FROM Jobs WHERE job_id=?";

    public List<Job> getAllJobs() {
        List<Job> jobs = new ArrayList<>();
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_JOBS);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Job job = new Job();
                job.setJobId(resultSet.getInt("job_id"));
                job.setTitle(resultSet.getString("title"));
                job.setDescription(resultSet.getString("description"));
                job.setRequirements(resultSet.getString("requirements"));
                job.setSalary(resultSet.getDouble("salary"));
                job.setLocation(resultSet.getString("location"));
                job.setCompanyId(resultSet.getInt("company_id"));
                jobs.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobs;
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
