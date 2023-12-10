package com.example.cnw.model.bo;

import com.example.cnw.model.bean.Applicant;
import com.example.cnw.model.dao.ApplicantDAO;

import java.util.List;

public class ApplicantBO {
    private ApplicantDAO ApplicantDAO;

    public ApplicantBO() {
        this.ApplicantDAO = new ApplicantDAO();
    }

    public List<Applicant> getApplicants(int candidateId, int jobId) {
        return ApplicantDAO.getApplicants(candidateId, jobId);
    }

    public void addApplicant(Applicant applicant) {
        ApplicantDAO.addApplication(applicant);
    }

    public boolean isApplicantExist(int jobId, int candidateId) { return ApplicantDAO.isApplicantExists(jobId, candidateId); }
}
