/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test.fptblog.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author pc
 */
@Entity
public class userModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    
    private Long id;
    private String username;
    private String password;
    private String roleid;
    
    public userModel(){
        
    }

    public userModel(String username, String password, String roleid) {
        this.username = username;
        this.password = password;
        this.roleid = roleid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }
    
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password=" + password +
                ", roleid=" + roleid + '\'' +
                '}';
    }
    }
    
