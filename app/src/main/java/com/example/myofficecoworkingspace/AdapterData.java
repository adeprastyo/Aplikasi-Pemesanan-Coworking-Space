package com.example.myofficecoworkingspace;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.widget.LinearLayoutCompat;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;

import java.net.InterfaceAddress;
import java.util.List;

public class AdapterData extends RecyclerView.Adapter<AdapterData.HolderData> {

    List<RoomModel> listData;
    LayoutInflater inflater;
    Context context;
    private OnAdapaterListener listener;

    public AdapterData(Context context, List<RoomModel> listData, OnAdapaterListener listener) {
        this.context = context;
        this.listData = listData;
        this.inflater = LayoutInflater.from(context);
        this.listener = listener;
    }

    @NonNull
    @Override
    public HolderData onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
          View view = inflater.inflate(R.layout.item_data, parent, false);
          return new HolderData(view);
    }

    @Override
    public void onBindViewHolder(@NonNull HolderData holder, int position) {
        holder.txtNamaRuangan.setText(listData.get(position).getRoomName());
        holder.txtJenis.setText(listData.get(position).getTypeName());
        Glide.with(context)
                .load(listData.get(position).getRoomImage())
                .into(holder.image);
        holder.txtHarga.setText(listData.get(position).getRoomPrice().toString());

        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                listener.onCLick(listData.get(position));
            }
        });
    }

    @Override
    public int getItemCount() {
        return listData.size();
    }

    public class HolderData extends RecyclerView.ViewHolder{
        TextView txtNamaRuangan, txtJenis, txtHarga;
        ImageView image;
        LinearLayout rvItem;

        public HolderData(@NonNull View itemView) {
            super(itemView);

            rvItem = itemView.findViewById(R.id.parentLayout);

            image = itemView.findViewById(R.id.imgRuangan);
            txtNamaRuangan = itemView.findViewById(R.id.txtNamaRuangan);
            txtJenis = itemView.findViewById(R.id.txtJenis);
            txtHarga = itemView.findViewById(R.id.txtHarga);
        }
    }

    interface OnAdapaterListener {
        void onCLick(RoomModel roomModel);
    }
}
