package org.board.jspboard.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;

/**
 * PackageName : org.board.jspboard.util
 * Author : Mo-Greene
 * Date : 2023/02/06
 * Description :
 */
public enum ConnectionUtil {

    INSTANCE;

    private final HikariDataSource dataSource;

    ConnectionUtil() {
        HikariConfig config = new HikariConfig();
        config.setDriverClassName("org.mariadb.jdbc.Driver");
        config.setJdbcUrl("jdbc:mariadb://localhost:3306/board");
        config.setUsername("root");
        config.setPassword("1234");

        dataSource = new HikariDataSource(config);
    }

    public Connection getConnection() throws Exception {
        return dataSource.getConnection();
    }
}
