package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.ResultadoAprendizaje;

// dao para resultados de aprendizaje
public class ResultadoAprendizajeDAO {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    // listar todos los RA
    public List<ResultadoAprendizaje> listar() {
        List<ResultadoAprendizaje> lista = new ArrayList<>();

        try {
            con = Database.getConnection();
            String sql = "SELECT * FROM resultados_aprendizaje ORDER BY id";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                ResultadoAprendizaje ra = new ResultadoAprendizaje();
                ra.setId(rs.getInt("id"));
                ra.setDescripcion(rs.getString("descripcion"));
                ra.setIdAsignatura(rs.getInt("id_asignatura"));

                lista.add(ra);
            }

        } catch (SQLException e) {
            System.out.println("Error listando RA");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return lista;
    }

    // obtener RA por asignatura
    public List<ResultadoAprendizaje> obtenerPorAsignatura(int idAsignatura) {
        List<ResultadoAprendizaje> lista = new ArrayList<>();

        try {
            con = Database.getConnection();
            String sql = "SELECT * FROM resultados_aprendizaje WHERE id_asignatura = ? ORDER BY id";
            ps = con.prepareStatement(sql);
            ps.setInt(1, idAsignatura);
            rs = ps.executeQuery();

            while (rs.next()) {
                ResultadoAprendizaje ra = new ResultadoAprendizaje();
                ra.setId(rs.getInt("id"));
                ra.setDescripcion(rs.getString("descripcion"));
                ra.setIdAsignatura(rs.getInt("id_asignatura"));

                lista.add(ra);
            }

        } catch (SQLException e) {
            System.out.println("Error al obtener RA por asignatura");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return lista;
    }

    // obtener un ra por id
    public ResultadoAprendizaje obtenerPorId(int id) {
        ResultadoAprendizaje ra = null;

        try {
            con = Database.getConnection();
            String sql = "SELECT * FROM resultados_aprendizaje WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                ra = new ResultadoAprendizaje();
                ra.setId(rs.getInt("id"));
                ra.setDescripcion(rs.getString("descripcion"));
                ra.setIdAsignatura(rs.getInt("id_asignatura"));
            }

        } catch (SQLException e) {
            System.out.println("Error obteniendo RA");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ra;
    }

    // insertar nuevo ra
    public boolean insertar(ResultadoAprendizaje ra) {
        boolean ok = false;

        try {
            con = Database.getConnection();
            String sql = "INSERT INTO resultados_aprendizaje (descripcion, id_asignatura) VALUES (?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, ra.getDescripcion());
            ps.setInt(2, ra.getIdAsignatura());

            int filas = ps.executeUpdate();
            if (filas > 0)
                ok = true;

        } catch (SQLException e) {
            System.out.println("Error insertando RA");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ok;
    }

    // actualizar ra
    public boolean actualizar(ResultadoAprendizaje ra) {
        boolean ok = false;
        ;

        try {
            con = Database.getConnection();
            String sql = "UPDATE resultados_aprendizaje SET descripcion = ?, id_asignatura = ? WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, ra.getDescripcion());
            ps.setInt(2, ra.getIdAsignatura());
            ps.setInt(3, ra.getId());

            int filas = ps.executeUpdate();
            if (filas > 0) {
                ok = true;
            }

        } catch (SQLException e) {
            System.out.println("Error actualizando RA");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ok;
    }

    // eliminar ra
    public boolean eliminar(int id) {
        boolean ok = false;

        try {
            con = Database.getConnection();
            String sql = "DELETE FROM resultados_aprendizaje WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            int filas = ps.executeUpdate();
            if (filas > 0)
                ok = true;

        } catch (SQLException e) {
            System.out.println("Error eliminando RA");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ok;
    }

    // cerrar conexiones
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
