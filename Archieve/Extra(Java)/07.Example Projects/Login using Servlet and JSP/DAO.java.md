
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
	
	public class DAO {
		
		String url = "jdbc:mysql://localhost:3306/myDB", userName = "root", password = "revansheykh2005";
		String query = "SELECT * FROM LoginCredentials where username=? and pass=?";
		public boolean check(String uname, String pass) throws Exception, SQLException {
	
	        Class.forName("com.mysql.cj.jdbc.Driver"); 
	     	Connection con = DriverManager.getConnection(url, userName, password);
	     	
	     	PreparedStatement ps = con.prepareStatement(query);
	        
	     	ps.setString(1, uname);
	     	ps.setString(2, pass);
	        
	     	ResultSet rs = ps.executeQuery();
	     	
	     	if (rs.next()) {
	     		return true;
	     	}
	     	
	        return false;
		}
	}
