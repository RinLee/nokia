package com.nokia.tudms.DAO;

import java.io.*;
import java.net.URL;
import java.sql.SQLException;
import java.util.Properties;
import com.alibaba.druid.pool.*;

public class DBPool {
    private static DBPool dbPool = null;
    private static DruidDataSource druidDataSource = null;
    static {
        Properties properties = loadPropertyFile("/jdbc.properties");
        try {
            druidDataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private DBPool() {}
    public static synchronized DBPool getInstance() {
        if (null == dbPool) {
            dbPool = new DBPool();
        }
        return dbPool;
    }
    public DruidPooledConnection getConnection() throws SQLException {
        return druidDataSource.getConnection();
    }
    public static Properties loadPropertyFile(String file) {
        if(file == null || file.equals("")){
            System.out.println("FileName can not be null");
        }
        Properties properties = new Properties();

        URL url = DBPool.class.getResource(file);
        System.out.println(url);
        InputStream in = DBPool.class.getResourceAsStream(file);
        if(in == null){
            System.out.println("File not find");
        }

        try {
            properties.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties;
    }
}