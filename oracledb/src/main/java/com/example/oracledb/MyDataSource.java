package com.example.oracledb;

import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

public class MyDataSource {
@Bean
    public static DataSource getDataSource(){
    DriverManagerDataSource dataSource = new DriverManagerDataSource();
    dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
    dataSource.setUrl("jdbc:oracle:thin:@//localhost:1521/cinema_pdb");
    dataSource.setUsername("super_admin");
    dataSource.setPassword("Qwerty2000");

    return dataSource;
}
}
