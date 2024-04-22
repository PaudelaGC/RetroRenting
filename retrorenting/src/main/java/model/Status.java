/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mati
 */
public class Status {
    private int id;
    private String name;
    
    public Status(int id, String name){
        this.id = id;
        this.name = name;
    }
    
    public Status(){
    }
    
    public int getId(int id){
        return id;
    }
    
    public void setId(){
        this.id = id;
    }
    
    public String getName(String name){
        return name;
    }
    
    public void setName(){
        this.name = name;
    }
}
