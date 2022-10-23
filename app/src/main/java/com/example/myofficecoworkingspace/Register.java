package com.example.myofficecoworkingspace;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.WindowManager;
import android.widget.EditText;

import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Register extends AppCompatActivity {

    EditText editTextNama, editTextInstansi, editTextNoHp, editTextEmail, editTextPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        getSupportActionBar().hide();
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);

        if (SharedPrefManager.getInstance(this).isLoggedIn()){
            finish();
            startActivity(new Intent(this, MainActivity.class));
            return;
        }

        editTextNama = findViewById(R.id.etNama);
        editTextInstansi = findViewById(R.id.etInstansi);
        editTextNoHp = findViewById(R.id.etNoHp);
        editTextEmail = findViewById(R.id.etEmail);
        editTextPassword = findViewById(R.id.etPassword);

        findViewById(R.id.btnRegister).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                registerCustomer();
            }
        });

        findViewById(R.id.tvLogin).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent iLogin = new Intent(getApplicationContext(),Login.class);
                startActivity(iLogin);
            }
        });

    }

    private void registerCustomer(){
        final String namaCust = editTextNama.getText().toString().trim();
        final String instansiCust = editTextInstansi.getText().toString().trim();
        final String noHpCust = editTextNoHp.getText().toString().trim();
        final String emailCust = editTextEmail.getText().toString().trim();
        final String passCust = editTextPassword.getText().toString().trim();

        if (TextUtils.isEmpty(namaCust)){
            editTextNama.setError("Masukkan Nama Anda!");
            editTextNama.requestFocus();
            return;
        }

        if (TextUtils.isEmpty(instansiCust)){
            editTextInstansi.setError("Masukkan Asal Instansi Anda!");
            editTextInstansi.requestFocus();
            return;
        }

        if (TextUtils.isEmpty(noHpCust)){
            editTextNoHp.setError("Masukkan No Handphone Anda!");
            editTextNoHp.requestFocus();
            return;
        }

        if (TextUtils.isEmpty(emailCust)){
            editTextEmail.setError("Masukkan Email Anda!");
            editTextEmail.requestFocus();
            return;
        }

        if (!android.util.Patterns.EMAIL_ADDRESS.matcher(emailCust).matches()) {
            editTextEmail.setError("Enter a valid email");
            editTextEmail.requestFocus();
            return;
        }

        if (TextUtils.isEmpty(passCust)) {
            editTextPassword.setError("Enter a password");
            editTextPassword.requestFocus();
            return;
        }

        StringRequest stringRequest = new StringRequest(Request.Method.POST, URLs.URL_REGISTER, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject obj = new JSONObject(response);

                            if (!obj.getBoolean("error")) {
                                Toast.makeText(getApplicationContext(), obj.getString("message"), Toast.LENGTH_SHORT).show();

                                JSONObject customerJson = obj.getJSONObject("customer");

                                Customer customer = new Customer(
                                        customerJson.getInt("id"),
                                        customerJson.getString("name"),
                                        customerJson.getString("instansi"),
                                        customerJson.getString("email"),
                                        customerJson.getString("password"),
                                        customerJson.getString("phone")
                        );

                                SharedPrefManager.getInstance(getApplicationContext()).customerLogin(customer);

                                finish();
                                startActivity(new Intent(getApplicationContext(), MainActivity.class));
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
                protected Map<String, String> getParams() throws AuthFailureError{
                    Map<String, String> params = new HashMap<>();
                    params.put("name", namaCust);
                    params.put("instansi", instansiCust);
                    params.put("phone", noHpCust);
                    params.put("email", emailCust);
                    params.put("password", passCust);
                    return params;
                }
        };

        VolleySingleton.getInstance(this).addToRequestQueue(stringRequest);
    }
}