import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * PackageName : PACKAGE_NAME
 * Author : Mo-Greene
 * Date : 2023/02/04
 * Description :
 */
public class ConnectTest {

    @Test
    public void testConnection() throws Exception {

        Class.forName("org.mariadb.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                "jdbc:mariadb://localhost:3306/board",
                "root",
                "1234"
        );

        Assertions.assertNotNull(con);

        con.close();
    }

    @Test
    public void testHikariCP() throws Exception {
        HikariConfig config = new HikariConfig();
        config.setDriverClassName("org.mariadb.jdbc.Driver");
        config.setJdbcUrl("jdbc:mariadb://localhost:3306/board");
        config.setUsername("root");
        config.setPassword("1234");
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");

        HikariDataSource dataSource = new HikariDataSource(config);
        Connection con = dataSource.getConnection();

        System.out.println(con);

        con.close();
    }
}
