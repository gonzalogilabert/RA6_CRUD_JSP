package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelo.Asignatura;

// dao para las asignaturas
public class AsignaturaDAO {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    // listar todas las asignaturas
    public List<Asignatura> listar() {
        List<Asignatura> lista = new ArrayList<>();

        try {
            con = Database.getConnection();
            String sql = "SELECT * FROM asignaturas ORDER BY id";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            // recorro los resultados
            while (rs.next()) {
                Asignatura asig = new Asignatura();
                asig.setId(rs.getInt("id"));
                asig.setNombre(rs.getString("nombre"));
                asig.setCodigo(rs.getString("codigo"));

                lista.add(asig);
            }

        } catch (SQLException e) {
            System.out.println("Error al listar asignaturas");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return lista;
    }

    // obtener una asignatura por id
    public Asignatura obtenerPorId(int id) {
        Asignatura asig = null;

        try {
            con = Database.getConnection();
            String sql = "SELECT * FROM asignaturas WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                asig = new Asignatura();
                asig.setId(rs.getInt("id"));
                asig.setNombre(rs.getString("nombre"));
                asig.setCodigo(rs.getString("codigo"));
            }

        } catch (SQLException e) {
            System.out.println("Error al obtener asignatura");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return asig;
    }

    // insertar nueva asignatura
    public boolean insertar(Asignatura asig) {
        boolean ok = false;

        try {
            con = Database.getConnection();
            String sql = "INSERT INTO asignaturas (nombre, codigo) VALUES (?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, asig.getNombre());
            ps.setString(2, asig.getCodigo());

            int filas = ps.executeUpdate();
            if (filas > 0) {
                ok = true;
            }

        } catch (SQLException e) {
            System.out.println("Error al insertar asignatura");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ok;
    }

    // actualizar asignatura
    public boolean actualizar(Asignatura asig) {
        boolean ok = false;

        try {
            con = Database.getConnection();
            String sql = "UPDATE asignaturas SET nombre = ?, codigo = ? WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, asig.getNombre());
            ps.setString(2, asig.getCodigo());
            ps.setInt(3, asig.getId());

            int filas = ps.executeUpdate();
            if (filas > 0) {
                ok = true;
            }

        } catch (SQLException e) {
            System.out.println("Error al actualizar");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ok;
    }

    // eliminar asignatura
    public boolean eliminar(int id) {
        boolean ok = false;

        try {
            con = Database.getConnection();
            String sql = "DELETE FROM asignaturas WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            int filas = ps.executeUpdate();
            if (filas > 0) {
                ok = true;
            }

        } catch (SQLException e) {
            System.out.println("Error al eliminar asignatura");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ok;
    }

    // metodo auxiliar para cerrar conexiones
    private void cerrarConexiones() {
        try {
            if (rs != null)
                rs.close();
            if (ps != null)
                ps.close();
            if (con != null)
                con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
