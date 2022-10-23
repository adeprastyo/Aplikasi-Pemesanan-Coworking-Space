package com.example.myofficecoworkingspace;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.NavUtils;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Pembayaran extends AppCompatActivity {

    TextView txtNama, txtInstansi, txtNoHp, txtRoom, txtJenis, txtStart, txtEnd, txtBooking, txtHarga;
    Button btnWa;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pembayaran);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        txtNama = findViewById(R.id.txtNama);
        txtInstansi = findViewById(R.id.txtInstansi);
        txtNoHp = findViewById(R.id.txtNoHp);
        txtRoom = findViewById(R.id.txtRuangan);
        txtJenis = findViewById(R.id.txtJenis);
        txtStart = findViewById(R.id.txtStart);
        txtEnd = findViewById(R.id.txtEnd);
        txtHarga = findViewById(R.id.txtHarga);
        txtBooking = findViewById(R.id.txtTglPesan);
        btnWa =  findViewById(R.id.btnWa);

        String namaCustomer = getIntent().getStringExtra("customer_name");
        String instansiCustomer = getIntent().getStringExtra("customer_instansi");
        String noHp = getIntent().getStringExtra("customer_phone");
        String namaRuangan = getIntent().getStringExtra("room_name");
        String jenisRuangan = getIntent().getStringExtra("type_name");
        String start = getIntent().getStringExtra("start_date");
        String end = getIntent().getStringExtra("end_date");
        String price = getIntent().getStringExtra("type_price");
        String booking = getIntent().getStringExtra("booking_date");

        txtNama.setText(namaCustomer);
        txtInstansi.setText(instansiCustomer);
        txtNoHp.setText(noHp);
        txtRoom.setText(namaRuangan);
        txtJenis.setText(jenisRuangan);
        txtStart.setText(start);
        txtEnd.setText(end);
        txtHarga.setText(price);
        txtBooking.setText(booking);

        btnWa.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String nomorHp = "+6281273644717";
                String url = "https://api.whatsapp.com/send?phone=" + nomorHp;
                Intent i = new Intent(Intent.ACTION_VIEW);
                i.setData(Uri.parse(url));
                startActivity(i);
            }
        });
    }
}