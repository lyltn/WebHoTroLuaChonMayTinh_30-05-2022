package connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Dao {
	Connetct cn = new Connetct();
	Connection conn = cn.getConnection();
	public boolean checkLogin(String u, String p) throws SQLException {
		String query = " select name, pass from nd " + "where name=? and pass=?";
		try (

				Connection conn = cn.getConnection();
				PreparedStatement stm = conn.prepareStatement(query);) {
			stm.setString(1, u);
			stm.setString(2, p);
			try {
				ResultSet rs = stm.executeQuery();
				while (rs.next()) {
					
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	public Vector listHV() {
		String sqly = "SELECT * FROM mail";
		PreparedStatement stmy;
		Vector vD2 = new Vector();
		try {
			stmy = conn.prepareStatement(sqly);
			ResultSet rs = stmy.executeQuery();
			while (rs.next()) {
				Vector t = new Vector();
				t.add(rs.getInt(1));
				t.add(rs.getString(2));
				t.add(rs.getString(3));
				t.add(rs.getString(4));
				t.add(rs.getString(5));
				vD2.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vD2;
	}
	public boolean delete(int a) {
		try {
			String sql = "DELETE FROM mail WHERE stt =(?)";
			PreparedStatement stm = conn.prepareStatement(sql);

			stm.setInt(1, a);

			System.out.println(a);
			stm.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	public void add( String b, String c, String d, String e) {
		try {
			String sql = "INSERT INTO `mail` (`stt`, `ten`, `chude`, `mail`, `noidung`) VALUES (NULL, ?, ?, ?, ?)";
			PreparedStatement stm = conn.prepareStatement(sql);
			
			stm.setString(1, b);
			stm.setString(2, c);
			stm.setString(3, d);
			stm.setString(4, e);
			stm.execute();
		} catch (Exception e2) {
			// TODO: handle exception
		}
	}
}
