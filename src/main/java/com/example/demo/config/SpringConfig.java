package com.example.demo.config;

import com.example.demo.model.BodyBuildingDAO;
import com.example.demo.model.BodyBuildingDAOImpl;
import com.example.demo.service.BodyBuildingService;
import com.example.demo.service.BodyBuildingServiceImpl;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration

public class SpringConfig {


    @Bean

    @Qualifier("NumberDAO")
    public BodyBuildingDAO getNumberDAO() {
        return new BodyBuildingDAOImpl();
    }

    @Bean
    @Qualifier("NumberService")
    public BodyBuildingService getNumberService() {
        return new BodyBuildingServiceImpl();
    }
}
