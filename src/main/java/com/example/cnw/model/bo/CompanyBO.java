package com.example.cnw.model.bo;
import com.example.cnw.model.bean.Company;
import com.example.cnw.model.dao.CompanyDAO;

import java.util.List;
public class CompanyBO {
    private CompanyDAO companyDAO;

    public CompanyBO() {
        this.companyDAO = new CompanyDAO();
    }

    public List<Company> getAllCompanies() {
        return companyDAO.getAllCompanies();
    }

    public Company getCompanyById(int companyId) {
        return companyDAO.getCompanyById(companyId);
    }

    public void addCompany(Company company) {
        companyDAO.addCompany(company);
    }

    public void updateCompany(Company company) {
        companyDAO.updateCompany(company);
    }

    public void deleteCompany(int companyId) {
        companyDAO.deleteCompany(companyId);
    }
}
