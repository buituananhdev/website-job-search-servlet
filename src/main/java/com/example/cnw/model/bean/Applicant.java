package com.example.cnw.model.bean;

public class Applicant {
    private int applicant_id;
    private int candidate_id;
    private int job_id;
    // Constructor
    public Applicant() {
        // Default constructor
    }
    public Applicant( int candidate_id, int job_id) {
        this.candidate_id = candidate_id;
        this.job_id  = job_id;
    }


    public int getApplicant_id() {
        return applicant_id;
    }

    public void setApplicant_id(int applicant_id) {
        this.applicant_id = applicant_id;
    }

    public int getCandidate_id() {
        return candidate_id;
    }

    public void setCandidate_id(int candidate_id) {
        this.candidate_id = candidate_id;
    }

    public int getJob_id() {
        return job_id;
    }

    public void setJob_id(int job_id) {
        this.job_id = job_id;
    }
}
