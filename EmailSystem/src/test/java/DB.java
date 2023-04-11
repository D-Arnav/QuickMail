import java.sql.*;

public class DB {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmailBase", "root", "root");
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM users";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                System.out.println(rs.getString("email"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
