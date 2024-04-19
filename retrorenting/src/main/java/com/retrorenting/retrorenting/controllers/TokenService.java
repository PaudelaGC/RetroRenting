/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.retrorenting.retrorenting.controllers;

/**
 *
 * @author Mati
 */
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.util.Date;

public class TokenService {

    public String createToken (String user/*User user*/) {
        long sessionTime = 3600000;
        Date now = new Date();
        Date logoutTime = new Date(now.getTime() + sessionTime);
        String token = Jwts.builder()
                /*.setSubject(user.getId())*/
                .setSubject("1")/*user*/
                .setIssuedAt(now)
                .setExpiration(logoutTime)
                .signWith(SignatureAlgorithm.HS256, "83ykdhjflkdlDH338JDLHD23Djk$32234")
                .compact();
        return token;
    }
}

