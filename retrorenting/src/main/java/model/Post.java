/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author 39348
 */
package model;

import java.util.Date;
import model.User;

public class Post {
    private int id;
    private User user;
    private String title;
    private String description;
    private String image;
    private double price;
    private int duration;
    private boolean available;
    private Date lastRentDate;
    private Date lastReturnDate;

    // Constructor con todos los atributos
    public Post(int id, User user, String title, String description, String image, double price, int duration, boolean available, Date lastRentDate, Date lastReturnDate) {
        this.id = id;
        this.user = user;
        this.title = title;
        this.description = description;
        this.image = image;
        this.price = price;
        this.duration = duration;
        this.available = available;
        this.lastRentDate = lastRentDate;
        this.lastReturnDate = lastReturnDate;
    }

    // Constructor vacío
    public Post() {
    }

    // Getters y setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public Date getLastRentDate() {
        return lastRentDate;
    }

    public void setLastRentDate(Date lastRentDate) {
        this.lastRentDate = lastRentDate;
    }

    public Date getLastReturnDate() {
        return lastReturnDate;
    }

    public void setLastReturnDate(Date lastReturnDate) {
        this.lastReturnDate = lastReturnDate;
    }
}
