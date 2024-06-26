/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.time.LocalDate;
import java.sql.Date;


/**
 *
 * @author 39348
 */
public class Request {
    private int id;
    private int idStatus;
    private int idUser;
    private int idPost;
    private Date requestDate;
    

    public Request(int idUser, int idPost) {
        this.idStatus = 1;
        this.idUser = idUser;
        this.idPost = idPost;
        LocalDate currentDate = LocalDate.now();
        this.requestDate = Date.valueOf(currentDate);
    }

    public Request() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(int idStatus) {
        this.idStatus = idStatus;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdPost() {
        return idPost;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }
    
    @Override
    public String toString() {
        return "Request{" +
                "id=" + id +
                ", idStatus=" + idStatus +
                ", idUser=" + idUser +
                ", idPost=" + idPost +
                ", requestDate=" + requestDate +
                '}';
    }

}
