/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.retrorenting.retrorenting.configuration.db;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Encapsulates data for database connection.
 */
public final class DbConnect {

    // Database connection parameters
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String PROTOCOL = "jdbc:mysql:";
    private static final String HOST = "localhost";
    private static final String BD_NAME = "retrorenting";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";
    private static final String OPTIONS = "?autoReconnect=true&useSSL=false";
    private static final String BD_URL = String.format("%s//%s/%s%s", PROTOCOL, HOST, BD_NAME, OPTIONS);

    static {
        try {
            loadDriver();
        } catch (ClassNotFoundException e) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, "Driver not found", e);
            throw new ExceptionInInitializerError(e);
        }
    }

    /**
     * Loads the database driver.
     * @throws ClassNotFoundException if the JDBC driver class is not found.
     */
    private static void loadDriver() throws ClassNotFoundException {
        Class.forName(DRIVER);
    }

    /**
     * Gets and returns a connection to the database.
     * @return Connection to the database.
     */
    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(BD_URL, USER, PASSWORD);
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, "Error getting database connection", ex);
        }
        return conn;
    }
}
