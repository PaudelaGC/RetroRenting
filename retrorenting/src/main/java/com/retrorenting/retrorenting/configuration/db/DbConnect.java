/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.retrorenting.retrorenting.configuration.db;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public final class DbConnect {

    private static final String PROPERTIES_FILE = "/dbConnection.properties";
    private static String BD_URL;
    private static Properties props = new Properties();

    static {
        loadConnectionProperties();
    }

    private static void loadConnectionProperties() {
        try (InputStream input = DbConnect.class.getResourceAsStream(PROPERTIES_FILE)) {
            if (input == null) {
                throw new RuntimeException("Unable to find " + PROPERTIES_FILE);
            }
            props.load(input);
            BD_URL = props.getProperty("jdbc.protocol") +
                     props.getProperty("jdbc.host") + '/' +
                     props.getProperty("jdbc.dbname") +
                     props.getProperty("jdbc.options");
            Class.forName(props.getProperty("jdbc.driver"));
        } catch (IOException | ClassNotFoundException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, "Error loading database properties", ex);
        }
    }

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(BD_URL, props.getProperty("jdbc.user"), props.getProperty("jdbc.password"));
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, "Error getting database connection", ex);
        }
        return null;
    }
}
