/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.util.Date;
import model.User;
import model.Post;
import model.Status;


/**
 *
 * @author 39348
 */
public class Request {
    private int id;
    private Status status;
    private User user;
    private Post post;
    private Date resquestDate;

    public Request(int id, Status status, User user, Post post, Date resquestDate) {
        this.id = id;
        this.status = status;
        this.user = user;
        this.post = post;
        this.resquestDate = resquestDate;
    }

    public Request() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Date getResquestDate() {
        return resquestDate;
    }

    public void setResquestDate(Date resquestDate) {
        this.resquestDate = resquestDate;
    }
    
    

}
