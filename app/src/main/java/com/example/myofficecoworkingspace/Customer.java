package com.example.myofficecoworkingspace;

public class Customer {
    private int id;
    private String name, instansi, email, password, phone;

    public Customer(int id, String name, String instansi, String email, String password, String phone) {
        this.id = id;
        this.name = name;
        this.instansi = instansi;
        this.email = email;
        this.password = password;
        this.phone = phone;
    }

    public String getInstansi() {
        return instansi;
    }

    public void setInstansi(String instansi) {
        this.instansi = instansi;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}


