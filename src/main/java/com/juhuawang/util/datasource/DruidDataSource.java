package com.juhuawang.util.datasource;


import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import javax.sql.DataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

/**
 * Created by pwj  on 2015/11/17 0017.
 * Druid数据源获取方式
 */

public class DruidDataSource {
    private static DataSource ds = null;

    static {
        try {
            InputStream in = DruidDataSource.class.getClassLoader()
                    .getResourceAsStream("jdbc.properties");
            Properties props = new Properties();
            props.load(in);
            ds = DruidDataSourceFactory.createDataSource(props);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static Connection openConnection() throws SQLException {
        return ds.getConnection();
    }

}