package com.example.myofficecoworkingspace;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.TextView;
import android.widget.Toast;

public class ProfileActivity extends AppCompatActivity {

    TextView txtNama, txtNoHp, txtEmail;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        // calling the action bar
        ActionBar actionBar = getSupportActionBar();

        // showing the back button in action bar
        actionBar.setDisplayHomeAsUpEnabled(true);

        txtNama = findViewById(R.id.txtNama);
        txtNoHp = findViewById(R.id.txtNoHp);
        txtEmail = findViewById(R.id.txtEmail);

        Customer customer = SharedPrefManager.getInstance(this).getCustomer();
        txtNama.setText(customer.getName());
        txtNoHp.setText(customer.getPhone());
        txtEmail.setText(customer.getEmail());
    }

    public boolean onCreateOptionsMenu(Menu menu){
        // Inflate the menu; this adds items to the action bar if it is present.
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.profile_optionmenu, menu);
        //getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem item){
        if (item.getItemId() == R.id.produk_menu) {
            startActivity(new Intent(this, MainActivity.class));
        }else if (item.getItemId() == R.id.logout) {
            SharedPrefManager.getInstance(getApplicationContext()).logout();
        }else if (item.getItemId() == android.R.id.home) {
            finish();
        }

        return true;
    }
}