/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {

    Connection con;

    public Connection conectar() {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/sena adso",
                "root",
                "12345"
            );

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return con;
    }
}
