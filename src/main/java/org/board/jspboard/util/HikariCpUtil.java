package org.board.jspboard.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;

/**
 * PackageName : org.board.jspboard.util
 * Author : Mo-Greene
 * Date : 2023/02/09
 * Description : Hikari Config
 */
public enum HikariCpUtil {

    INSTANCE;

    private HikariDataSource dataSource;

    HikariCpUtil() {
        HikariConfig config = new HikariConfig();
        config.setDriverClassName("org.mariadb.jdbc.Driver");
        config.setJdbcUrl("jdbc:mariadb://localhost:3306/board");
        config.setUsername("root");
        config.setPassword("1234");
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");

        dataSource = new HikariDataSource(config);
    }

    public Connection getConnection() throws Exception {
        return dataSource.getConnection();
    }
}
