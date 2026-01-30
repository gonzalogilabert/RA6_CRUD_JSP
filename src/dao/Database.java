package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// clase para conectar con la bd
public class Database {

    // datos de conexion
    private static final String URL = "jdbc:mysql://localhost:3306/gestion_academica?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASS = "";

    private static Connection con = null;

    // metodo para obtener la conexion
    public static Connection getConnection() {
        try {
            // cargo el driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // creo la conexion
            con = DriverManager.getConnection(URL, USER, PASS);

        } catch (ClassNotFoundException e) {
            System.out.println("Error: no se encuentra el driver");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error al conectar con la BD");
            e.printStackTrace();
        }

        return con;
    }

    // cerrar conexion
    public static void closeConnection() {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
