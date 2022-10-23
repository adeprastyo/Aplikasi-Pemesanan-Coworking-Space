package com.example.myofficecoworkingspace;

public class RoomModel {
    private String roomName, roomImage, typeName, typeDesc, roomFac;
    private String [] facilites;

    public String[] getFacilites() {
        return facilites;
    }

    public void setFacilites(String[] facilites) {
        this.facilites = facilites;
    }

    public String getRoomFac() {
        return roomFac;
    }

    public void setRoomFac(String roomFac) {
        this.roomFac = roomFac;
    }

    public Integer getIdRoom() {
        return idRoom;
    }

    public void setIdRoom(Integer idRoom) {
        this.idRoom = idRoom;
    }

    private Integer idRoom,roomPrice;

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getRoomImage() {
        return roomImage;
    }

    public void setRoomImage(String roomImage) {
        this.roomImage = roomImage;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTypeDesc() {
        return typeDesc;
    }

    public void setTypeDesc(String typeDesc) {
        this.typeDesc = typeDesc;
    }

    public Integer getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(Integer roomPrice) {
        this.roomPrice = roomPrice;
    }
}
