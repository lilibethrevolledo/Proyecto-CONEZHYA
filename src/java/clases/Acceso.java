/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Acceso {
    
public String validar(String cedula, String contra) {
    String nombre = null;

try {
    Database db = new Database();
    Connection con = db.conectar();


    String sql = "SELECT NOMBRES FROM registro WHERE CEDULA = ? AND CONTRASEÑA = ?";

    PreparedStatement ps = con.prepareStatement(sql);

    ps.setString(1, cedula);
    ps.setString(2, contra);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        nombre = rs.getString("NOMBRE"); 
    }

    rs.close();
    ps.close();
    con.close();

} 
catch (Exception e) {
    e.printStackTrace();
}

return nombre;
}


/* reaizar registro de usuarios */

public boolean registrar(String nombre, String cedula, String correo, String celular, String contra) {
    boolean registro = false;

    try {
        Database db = new Database();
        Connection con = db.conectar();

        String sql = "INSERT INTO registro (Nombre, Cedula, Correo, Celular, Contraseña) VALUES (?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, nombre);
        ps.setString(2, cedula);
        ps.setString(3, correo);
        ps.setString(4, celular);
        ps.setString(5, contra);

registro = ps.executeUpdate() > 0;
ps.close();
}
catch (Exception e) {
    e.printStackTrace();
}

return registro;
}
}