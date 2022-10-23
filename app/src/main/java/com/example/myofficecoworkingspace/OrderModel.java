package com.example.myofficecoworkingspace;

public class OrderModel {
    private String namaCustomer, noHp, namaRuangan, jenisRuangan, startDate, endDate, harga, bookingDate;
    private Integer idOrder;

    public OrderModel (String namaCustomer, String noHp, String namaRuangan, String jenisRuangan, String startDate, String endDate, String harga, String bookingDate){
        this.namaCustomer = namaCustomer;
        this.noHp = noHp;
        this.namaRuangan = namaRuangan;
        this.jenisRuangan = jenisRuangan;
        this.startDate = startDate;
        this.endDate = endDate;
        this.harga = harga;
        this.bookingDate = bookingDate;
    }

    public String getHarga() {
        return harga;
    }

    public void setHarga(String harga) {
        this.harga = harga;
    }

    public String getNamaCustomer() {
        return namaCustomer;
    }

    public void setNamaCustomer(String namaCustomer) {
        this.namaCustomer = namaCustomer;
    }

    public String getNoHp() {
        return noHp;
    }

    public void setNoHp(String noHp) {
        this.noHp = noHp;
    }

    public String getNamaRuangan() {
        return namaRuangan;
    }

    public void setNamaRuangan(String namaRuangan) {
        this.namaRuangan = namaRuangan;
    }

    public String getJenisRuangan() {
        return jenisRuangan;
    }

    public void setJenisRuangan(String jenisRuangan) {
        this.jenisRuangan = jenisRuangan;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }
}
