/**
 * Created by lrz0927 on 10/3/17.
 */

import java.sql.*;

class Test {
    public static void main(String args[]) {
        //String username = "admi";
        //String password = "password";

        //new Test().sign_up(username, password);
        //new MysqlCon().login(username, password);

        String token = "flag{0ff3nsiVE_cY6eR_0pERAT1oN}";

        new Test().token(token);
    }


    public void connector() {

    }

    public void sign_up(String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/account", "root", "1234567890");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT username FROM userinfo WHERE username = '" + username + "'");
            if (!rs.next()){
                stmt.executeUpdate("INSERT INTO userinfo VALUES ('" + username + "','" + password + "')");
            }else {
                System.out.println("gndy");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void login(String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/account", "root", "1234567890");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT password FROM userinfo WHERE username = '" + username + "'");
            while (rs.next()) {
                if (rs.getString(1).equals(password)) {
                    System.out.println("Pass");
                } else {
                    System.out.println("SB");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void token(String token) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/account", "root", "1234567890");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT score FROM token WHERE token = '" + token + "'");
            if (rs.next()) {
                System.out.println(rs.getString(1));
            }else {
                System.out.println("0");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}