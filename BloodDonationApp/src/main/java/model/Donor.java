package model;


public class Donor {
    private int sno;
    private String donorName;
    private String address;
    private String bloodgrp;
    private String email;
    private String phoneNumber;

    public Donor(int sno, String donorName, String address, String bloodgrp, String email, String phoneNumber) {
		// TODO Auto-generated constructor stub
    	this.sno = sno;
    	this.donorName = donorName;
    	this.address = address;
    	this.bloodgrp = bloodgrp;
    	this.email = email;
    	this.phoneNumber = phoneNumber;
    	
	}

	public Donor() {
		// TODO Auto-generated constructor stub
	}

	// Getters and setters
    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getDonorName() {
        return donorName;
    }

    public void setDonorName(String donorName) {
        this.donorName = donorName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getbloodgrp() {
    	return bloodgrp;
    }
    
    public void setbloodgrp(String bloodgrp) {
    	this.bloodgrp = bloodgrp;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
