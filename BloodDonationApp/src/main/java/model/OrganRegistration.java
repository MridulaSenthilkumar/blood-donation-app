package model;

public class OrganRegistration {
    private String donorName;
    private String address;
    private String bloodGroup;  // Assuming you'll still collect blood group
    private String email;
    private String phoneNumber;
    private String donationChoice;  // All organs or some organs

    // Getters and Setters
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

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
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

    public String getDonationChoice() {
        return donationChoice;
    }

    public void setDonationChoice(String donationChoice) {
        this.donationChoice = donationChoice;
    }
}
