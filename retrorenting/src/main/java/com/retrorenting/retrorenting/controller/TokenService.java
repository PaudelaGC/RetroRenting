package com.retrorenting.retrorenting.controller;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.util.Date;

public class TokenService {

    public String createToken (String id) {
        long sessionTime = 3600000;
        Date now = new Date();
        Date logoutTime = new Date(now.getTime() + sessionTime);
        String token = Jwts.builder()
                .setSubject(id)
                .setIssuedAt(now)
                .setExpiration(logoutTime)
                .signWith(SignatureAlgorithm.HS256, "83ykdhjflkdlDH338JDLHD23Djk$32234")
                .compact();
        return token;
    }
}

