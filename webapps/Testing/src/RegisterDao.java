import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RegisterDao {
	
	private String dbUrl = "jdbc:mysql://localhost:3306/std_data";
	private String dbUname = "root";
	private String dbPassword = "qwer123#";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver)
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection()
	{
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public String insert(Member member)
	{
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into member values(?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, member.getUname());
			ps.setString(2, member.getPassword());
			ps.setString(3, member.getEmail());
			ps.setString(4, member.getPhone());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Data not entered";
		}
		
		return result;
	}
	
	public List<Member> getAllMembers()
	{
		loadDriver(dbDriver);
		Connection con = getConnection();
		List<Member> members = new ArrayList<>();
		String sql = "select * from member";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String uname = rs.getString(1);
				String password = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				Member member = new Member(uname, password, email, phone);
				members.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return members;
	}

}
