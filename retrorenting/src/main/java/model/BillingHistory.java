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
    private Date billingDate;

    public BillingHistory(int id, Request request, Date billingDate){
        this.id = id;
        this.request = request;
        this.billingDate = billingDate;
    }
    
    public BillingHistory(){
    
    }
    
    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public Request getRequest(){
        return request;
    }
    
    public void setRequest(Request request){
        this.request = request;
    }
    
    public Date getBillingDate(){
        return billingDate;
    }
    
    public void setBillingDate(Date billingDate){
        this.billingDate = billingDate;
    }
    
}
