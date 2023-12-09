package com.example.cnw.model.bean;

public class Company {
    private int companyId;
    private String name;
    private String description;
    private String location;
    private int accountId;

    // Constructors
    public Company() {
    }

    public Company(String name, String description, String location, int accountId) {
        this.name = name;
        this.description = description;
        this.location = location;
        this.accountId = accountId;
    }

    // Getters and Setters
    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    // toString method for easy debugging
    @Override
    public String toString() {
        return "Company{" +
                "companyId=" + companyId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", location='" + location + '\'' +
                ", accountId=" + accountId +
                '}';
    }
}
