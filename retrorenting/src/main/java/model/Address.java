/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author 39348
 */
public class Address {
    
    private int id;
    private String street;
    private String number;
    private String block;
    private String door;
    private String floor;
    private String postalCode;
    private String city;
    private String state;
    private String country;
    
    public Address(int id, String street, String number, String block, String door, String floor, String postalCode, String city, String state, String country){
        this.id = id;
        this.street = street;
        this.number = number;
        this.block = block;
        this.door = door;
        this.floor = floor;
        this.postalCode = postalCode;
        this.city = city;
        this.state = state;
        this.country = country;
    }
    
    public Address(){
    }
 
    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public String getStreet(){
        return street;
    }
    
    public void setStreet(String street){
        this.street = street;
    }
    
    public String getNumber() {
        return number;
    }
    
    public void setNumber(String number) {
        this.number = number;    
    }
    
    public String getBlock(){
        return block;
    }
    
    public void setBlock(String block){
        this.block = block;
    }
    
    public String getDoor(){
        return door;
    }
    
    public void setDoor(String door){
        this.door = door;
    }
    
    public String getFloor(){
        return floor;
    }
    
    public void setFloor(String floor){
        this.floor = floor;
    }
    
    public String getPostalCode(){
        return postalCode;
    }
    
    public void setPostalCode(String postalCode){
        this.postalCode = postalCode;
    }
    
    public String getCity(){
        return city;
    }
    
    public void setCity(String city){
        this.city = city;
    }
    
    public String getState(){
        return state;
    }
    
    public void setState(String state){
        this.state = state;
    }
    
    public String getCountry(){
        return country;
    }
    
    public void setCountry(String country){
        this.country = country;
    }
}
