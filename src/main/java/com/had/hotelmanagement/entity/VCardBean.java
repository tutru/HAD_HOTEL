package com.had.hotelmanagement.entity;

public class VCardBean {
	
    private static final String NAME = "NAME:";

    private static final String GOVERNMENTID = "GOVERNMENTID:";

    private static final String ADDRESS = "ADDRESS:";

    private static final String PHONE = "PHONE:";

    private static final String EMAIL = "EMAIL:";


    private String name;

    private String governmentid;

    private String address;

    private String phone;

    private String email;


    @SuppressWarnings("UnusedDeclaration")
    public VCardBean() {
    }

    public VCardBean setName(String name) {
        this.name = name;
        return this;
    }

    public VCardBean setGovernmentid(String governmentid) {
        this.governmentid = governmentid;
        return this;
    }


    public VCardBean setAddress(String address) {
        this.address = address;
        return this;
    }

    public VCardBean setPhone(String phone) {
        this.phone = phone;
        return this;
    }


    public VCardBean setEmail(String email) {
        this.email = email;
        return this;
    }


    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("BEGIN:VCARD\n");
        sb.append("VERSION:4.0\n");
        if (name != null) {
            sb.append(NAME)
                    .append(name);
        }
        if (governmentid != null) {
            sb.append("\n" + GOVERNMENTID)
                    .append(governmentid);
        }
        if (address != null) {
            sb.append("\n" + ADDRESS)
                    .append(address);
        }
        if (phone != null) {
            sb.append("\n" + PHONE)
                    .append(phone);
        }
        if (email != null) {
            sb.append("\n" + EMAIL)
                    .append(email);
        }
        sb.append("\nEND:VCARD");
        return sb.toString();
    }
}
