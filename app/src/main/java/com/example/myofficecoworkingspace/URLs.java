package com.example.myofficecoworkingspace;

public class URLs {
//    private static final String CUST_URL = "http://192.168.80.111/myoffice_coworking_space/api/api_customers.php?apicall=";
    private static final String CUST_URL = "http://192.168.58.86/api_myoffice/api/api_customers.php?apicall=";
    public static final String URL_REGISTER = CUST_URL + "register";
    public static final String URL_LOGIN= CUST_URL + "login";

    public static final String URL_ROOM= "http://192.168.58.86/api_myoffice/api/api_rooms.php?f=";
    public static final String URL_ROOM_GET_ALL= URL_ROOM + "getall";

    public static final String URL_ORDER= "http://192.168.58.86/api_myoffice/api/api_orders.php?f=";
    public static final String URL_INSERT_ROOM = URL_ORDER + "insert";
}
