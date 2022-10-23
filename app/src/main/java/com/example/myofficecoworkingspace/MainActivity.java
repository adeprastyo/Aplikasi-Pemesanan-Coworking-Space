package com.example.myofficecoworkingspace;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.ClipData;
import android.content.Intent;
import android.os.Bundle;
import android.view.GestureDetector;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationBarView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements View.OnClickListener{

    Button btnLogout;
    RecyclerView recyclerView;
    LinearLayoutManager linearLayoutManager;
    AdapterData adapterData;
    List<RoomModel> listData;
    RoomModel roomModel;
    ActionBar actionBar;
    LinearLayout rvItem;

    BottomNavigationView bottomNavigationView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        recyclerView = findViewById(R.id.rvData);
        rvItem = findViewById(R.id.parentLayout);

        if (SharedPrefManager.getInstance(this).isLoggedIn()){
            Customer customer = SharedPrefManager.getInstance(this).getCustomer();
            getData();
        }else{
            Intent intent = new Intent(MainActivity.this, Login.class);
            startActivity(intent);
            finish();
        }
    }

    public boolean onCreateOptionsMenu(Menu menu){
        // Inflate the menu; this adds items to the action bar if it is present.
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.optionmenu, menu);
        //getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem item){
        if (item.getItemId() == R.id.profile_menu) {
            startActivity(new Intent(this, ProfileActivity.class));
        }else if (item.getItemId() == R.id.logout) {
            SharedPrefManager.getInstance(getApplicationContext()).logout();
        }else if (item.getItemId() == R.id.detail_menu) {
            startActivity(new Intent(this, DetailRuangan.class));
        }

        return true;
    }

    private  void getData(){
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        StringRequest stringRequest = new StringRequest(Request.Method.GET, URLs.URL_ROOM_GET_ALL, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                listData = new ArrayList<>();
                try {
                    JSONObject jsonObject = new JSONObject(response);
                    JSONArray jsonArray =  jsonObject.getJSONArray("room");
//                    JSONArray jsonArrayFacilities = jsonObject.optJSONArray("facilities2");
                    for (int i=0; i<jsonArray.length(); i++){
                        roomModel = new RoomModel();
                        JSONObject data = jsonArray.getJSONObject(i);
                        roomModel.setIdRoom(data.getInt("room_id"));
                        roomModel.setRoomName(data.getString("room_name"));
                        roomModel.setTypeName(data.getString("type_name"));
                        roomModel.setRoomPrice(data.getInt("type_price"));
                        roomModel.setTypeDesc(data.getString("type_description"));
                        roomModel.setRoomImage(data.getString("room_image"));
//                        for (int j=0; j<jsonArrayFacilities.length(); j++) {
//                            roomModel.setRoomFac(data.getString("facility_name"));
//                        }
                        listData.add(roomModel);
                    }

                    linearLayoutManager = new LinearLayoutManager(MainActivity.this, LinearLayoutManager.VERTICAL, false);
                    recyclerView.setLayoutManager(linearLayoutManager);

                    adapterData = new AdapterData(MainActivity.this, listData, new AdapterData.OnAdapaterListener() {
                        @Override
                        public void onCLick(RoomModel roomModel) {
                            Intent intent =  new Intent(MainActivity.this, Pemesanan.class);
                            intent.putExtra("id", roomModel.getIdRoom());
                            intent.putExtra("name", roomModel.getRoomName());
                            intent.putExtra("type", roomModel.getTypeName());
                            intent.putExtra("price", roomModel.getRoomPrice());
                            intent.putExtra("desc", roomModel.getTypeDesc());
                            startActivity(intent);
                        }
                    });

                    recyclerView.setAdapter(adapterData);
                    adapterData.notifyDataSetChanged();

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });
        requestQueue.add(stringRequest);
    }

    @Override
    public void onClick(View view) {
        if (view.equals(btnLogout)){
//            SharedPrefManager.getInstance(getApplicationContext()).logout();
//            startActivity(new Intent(this, Login.class));
        }
    }
}