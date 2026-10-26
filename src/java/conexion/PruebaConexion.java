
package conexion;

import java.sql.Connection;
import java.sql.SQLException;

public class PruebaConexion {

    public static void main(String[] args) {

        try (Connection cn = ConexionBD.conectar()) {

            System.out.println(
                "CONEXION EXITOSA A MYSQL"
            );

        } catch (SQLException e) {

            System.out.println(
                "ERROR DE CONEXION: "
                + e.getMessage()
            );
        }
    }
}
