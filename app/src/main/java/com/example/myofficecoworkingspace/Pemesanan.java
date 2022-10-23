package com.example.myofficecoworkingspace;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.text.InputType;
import android.text.TextUtils;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class Pemesanan extends AppCompatActivity {

    EditText start_dt, end_dt, etNama, etInstansi, etNoHp, etRoom, etHarga, etJenis;
    Button btnPesan;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pemesanan);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
//        // calling the action bar
//        ActionBar actionBar = getSupportActionBar();
//
//        // showing the back button in action bar
//        actionBar.setDisplayHomeAsUpEnabled(true);

        etNama = findViewById(R.id.editNama);
        etInstansi = findViewById(R.id.editInstansi);
        etNoHp = findViewById(R.id.editNoHp);
        etRoom = findViewById(R.id.editRoom);
        etHarga = findViewById(R.id.harga);
        etJenis = findViewById(R.id.jenis);
        start_dt = findViewById(R.id.start_datetime);
        end_dt = findViewById(R.id.end_datetime);
        btnPesan = findViewById(R.id.btnpesan);

        //get data customer berdasarkan akun customer yang login
        Customer customer = SharedPrefManager.getInstance(this).getCustomer();
        etNama.setText(customer.getName());
        etInstansi.setText(customer.getInstansi());
        etNoHp.setText(customer.getPhone());

        //get data ruangan berdasarkan item yang diklik
        String nama = getIntent().getStringExtra("name");
        String jenis = getIntent().getStringExtra("type");
        int harga = getIntent().getIntExtra("price",0);
        String formatHarga = formatRupiah(Double.parseDouble(String.valueOf(harga)));

        //set data ruangan
        etRoom.setText(nama);
        etJenis.setText(jenis);
        etHarga.setText(""+formatHarga);

        //tanggal dan waktu
        start_dt.setInputType(InputType.TYPE_NULL);
        start_dt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ShowDateTimeDialog(start_dt);
            }
        });

        end_dt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ShowDateTimeDialog(end_dt);
            }
        });

        //button pesan diklik
        btnPesan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                pesan();
            }
        });
    }

    private String formatRupiah(Double number){
        Locale localeID = new Locale("in", "ID");
        NumberFormat formatRupiah = NumberFormat.getCurrencyInstance(localeID);
        return formatRupiah.format(number);
    }

//    @Override
//    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
//        switch (item.getItemId()){
//            case android.R.id.home:
//                this.finish();
//                return true;
//        }
//        return super.onOptionsItemSelected(item);
//    }

    private void pesan(){
        final String namaCust = etNama.getText().toString().trim();
        final String instansiCust = etInstansi.getText().toString().trim();
        final String noHpCust = etNoHp.getText().toString().trim();
        final String namaRoom = etRoom.getText().toString().trim();
        final String jenisRoom = etJenis.getText().toString().trim();
        final String start = start_dt.getText().toString();
        final String end = end_dt.getText().toString().trim();
        final String harga = etHarga.getText().toString().trim();

        //get tanggal dan waktu sekarang (current datetime)
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH-mm");
        final String booking = sdf.format(calendar.getTime());

        if (TextUtils.isEmpty(start)){
            Toast.makeText(this, "MASUKKAN TANGGAL DAN WAKTU MULAI !", Toast.LENGTH_LONG).show();
            return;
        }

        if (TextUtils.isEmpty(end)){
            Toast.makeText(this, "MASUKKAN TANGGAL DAN WAKTU SELESAI !", Toast.LENGTH_LONG).show();
            return;
        }

        StringRequest stringRequest = new StringRequest(Request.Method.POST, URLs.URL_INSERT_ROOM, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONObject obj = new JSONObject(response);

                    if (!obj.getBoolean("error")) {
                        Toast.makeText(getApplicationContext(), obj.getString("message"), Toast.LENGTH_SHORT).show();

                        JSONObject orderJson = obj.getJSONObject("orders");

                        OrderModel orderModel = new OrderModel(
                                orderJson.getString("customer_name"),
                                orderJson.getString("customer_phone"),
                                orderJson.getString("room_name"),
                                orderJson.getString("type_name"),
                                orderJson.getString("start_date"),
                                orderJson.getString("end_date"),
                                orderJson.getString("type_price"),
                                orderJson.getString("booking_date")
                        );

                        finish();
                        Intent intent =  new Intent(Pemesanan.this, Pembayaran.class);
                        intent.putExtra("customer_name", namaCust);
                        intent.putExtra("customer_instansi", instansiCust);
                        intent.putExtra("customer_phone", noHpCust);
                        intent.putExtra("room_name", namaRoom);
                        intent.putExtra("type_name", jenisRoom);
                        intent.putExtra("start_date", start);
                        intent.putExtra("end_date", end);
                        intent.putExtra("type_price", harga);
                        intent.putExtra("booking_date", booking);
                        startActivity(intent);
                    } else {
                        Toast.makeText(getApplicationContext(), obj.getString("message"), Toast.LENGTH_SHORT).show();
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT).show();
                    }
                }){
            //mengirimkan data dari form
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("nama_customer", namaCust);
                params.put("instansi_customer", instansiCust);
                params.put("no_hp", noHpCust);
                params.put("nama_ruangan", namaRoom);
                params.put("jenis_ruangan", jenisRoom);
                params.put("start_date", start);
                params.put("end_date", end);
                params.put("type_price", harga);
                params.put("booking_date", booking);
                return params;
            }
        };

        VolleySingleton.getInstance(this).addToRequestQueue(stringRequest);
    }

    private void ShowDateTimeDialog(EditText start_dt) {
        Calendar calendar = Calendar.getInstance();
        DatePickerDialog.OnDateSetListener dateSetListener = new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker datePicker, int year, int month, int dayOfMonth) {
                calendar.set(Calendar.YEAR, year);
                calendar.set(Calendar.MONTH, month);
                calendar.set(Calendar.DAY_OF_MONTH, dayOfMonth);

                TimePickerDialog.OnTimeSetListener timeSetListener = new TimePickerDialog.OnTimeSetListener() {
                    @Override
                    public void onTimeSet(TimePicker timePicker, int hourOfDay, int minute) {
                        calendar.set(Calendar.HOUR_OF_DAY, hourOfDay);
                        calendar.set(Calendar.MINUTE, minute);

                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy-MM-dd HH-mm");
                        start_dt.setText(simpleDateFormat.format(calendar.getTime()));
                    }
                };
                new TimePickerDialog(Pemesanan.this, timeSetListener, calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE), false).show();
            }
        };

        new DatePickerDialog(Pemesanan.this, dateSetListener, calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH)).show();
    }
}