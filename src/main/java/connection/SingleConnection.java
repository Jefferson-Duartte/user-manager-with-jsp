package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection{

    private static String url = "jdbc:postgresql://localhost:5432/curso-jsp?autoReconnect=true";
    private static String user = "postgres";
    private static String password = "admin";
    private static Connection connection;

    static {
        connect();
    }

    public SingleConnection(){
        connect();
    }

    private static void connect(){
        try{

            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, user, password);
            connection.setAutoCommit(false);


        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        return connection;
    }
}
