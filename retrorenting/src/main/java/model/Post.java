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

public class Post {
    private int id;
    private int idUser;
    private String title;
    private String description;
    private String image;
    private double price;
    private int duration;
    private boolean available;
    private Date lastRentDate;
    private Date lastReturnDate;

    // Constructor con todos los atributos
    public Post(String title, String description, String image, double price, int duration){
        this.title = title;
        this.description = description;
        this.image = image;
        this.price = price;
        this.duration = duration;
        this.available = true;
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
    
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
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
    
    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", idUser=" + idUser +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", duration=" + duration +
                ", available=" + available +
                ", lastRentDate=" + lastRentDate +
                ", lastReturnDate=" + lastReturnDate +
                '}';
    }
}
