
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    private static final String URL =
        "jdbc:mysql://localhost:3306/adso_sena"
        + "?useSSL=false&allowPublicKeyRetrieval=true"
        + "&serverTimezone=UTC&characterEncoding=UTF-8";

    private static final String USUARIO = "root";
    private static final String PASSWORD = "12345";

    public static Connection conectar() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver MySQL no encontrado", e);
        }
        return DriverManager.getConnection(URL, USUARIO, PASSWORD);
    }
}