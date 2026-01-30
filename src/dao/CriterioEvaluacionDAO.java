package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.CriterioEvaluacion;

// dao para criterios de evaluacion
public class CriterioEvaluacionDAO {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    // listar todos
    public List<CriterioEvaluacion> listar() {
        List<CriterioEvaluacion> lista = new ArrayList<>();

        try {
            con = Database.getConnection();
            String sql = "SELECT * FROM criterios_evaluacion ORDER BY id";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                CriterioEvaluacion ce = new CriterioEvaluacion();
                ce.setId(rs.getInt("id"));
                ce.setDescripcion(rs.getString("descripcion"));
                ce.setIdResultado(rs.getInt("id_resultado"));

                lista.add(ce);
            }

        } catch (SQLException e) {
            System.out.println("Error listando criterios");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return lista;
    }

    // obtener criterios por resultado de aprendizaje
    public List<CriterioEvaluacion> obtenerPorRA(int idResultado) {
        List<CriterioEvaluacion> lista = new ArrayList<>();

        try {
            con = Database.getConnection();
            String sql = "SELECT * FROM criterios_evaluacion WHERE id_resultado = ? ORDER BY id";
            ps = con.prepareStatement(sql);
            ps.setInt(1, idResultado);
            rs = ps.executeQuery();

            while (rs.next()) {
                CriterioEvaluacion ce = new CriterioEvaluacion();
                ce.setId(rs.getInt("id"));
                ce.setDescripcion(rs.getString("descripcion"));
                ce.setIdResultado(rs.getInt("id_resultado"));

                lista.add(ce);
            }

        } catch (SQLException e) {
            System.out.println("Error obteniendo criterios por RA");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return lista;
    }

    // obtener por id
    public CriterioEvaluacion obtenerPorId(int id) {
        CriterioEvaluacion ce = null;

        try {
            con = Database.getConnection();
            String sql = "SELECT * FROM criterios_evaluacion WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                ce = new CriterioEvaluacion();
                ce.setId(rs.getInt("id"));
                ce.setDescripcion(rs.getString("descripcion"));
                ce.setIdResultado(rs.getInt("id_resultado"));
            }

        } catch (SQLException e) {
            System.out.println("Error obteniendo criterio");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ce;
    }

    // insertar criterio
    public boolean insertar(CriterioEvaluacion ce) {
        boolean ok = false;

        try {
            con = Database.getConnection();
            String sql = "INSERT INTO criterios_evaluacion (descripcion, id_resultado) VALUES (?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, ce.getDescripcion());
            ps.setInt(2, ce.getIdResultado());

            int filas = ps.executeUpdate();
            if (filas > 0)
                ok = true;

        } catch (SQLException e) {
            System.out.println("Error insertando criterio");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ok;
    }

    // actualizar
    public boolean actualizar(CriterioEvaluacion ce) {
        boolean ok = false;

        try {
            con = Database.getConnection();
            String sql = "UPDATE criterios_evaluacion SET descripcion = ?, id_resultado = ? WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, ce.getDescripcion());
            ps.setInt(2, ce.getIdResultado());
            ps.setInt(3, ce.getId());

            int filas = ps.executeUpdate();
            if (filas > 0)
                ok = true;

        } catch (SQLException e) {
            System.out.println("Error actualizando criterio");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ok;
    }

    // eliminar
    public boolean eliminar(int id) {
        boolean ok = false;

        try {
            con = Database.getConnection();
            String sql = "DELETE FROM criterios_evaluacion WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            int filas = ps.executeUpdate();
            if (filas > 0)
                ok = true;

        } catch (SQLException e) {
            System.out.println("Error eliminando criterio");
            e.printStackTrace();
        } finally {
            cerrarConexiones();
        }

        return ok;
    }

    // cerrar
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
