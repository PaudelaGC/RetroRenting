/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mati
 */

import java.util.Date;
import model.Request;

public class BillingHistory {
    private int id;
    private Request request;
    private Date requestDate;

    public BillingHistory(int id, Request request, Date requestDate){
        this.id = id;
        this.request = request;
        this.requestDate = requestDate;
    }
    
    public BillingHistory(){
    
    }
    
    public int getId(int id){
        return id;
    }
    
    public void setId(){
        this.id = id;
    }
    
    public Request getRequest(Request request){
        return request;
    }
    
    public void setRequest(){
        this.request = request;
    }
    
    public Date getDate(Date requestDate){
        return requestDate;
    }
    
    public void setDate(){
        this.requestDate = requestDate;
    }
    
}
