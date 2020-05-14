package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BodyBuildingApplication {

    public static void main(String[] args) {
        // Programos kontrole deleguojama statiniam klases SpringApplication metodui run
        // nurodant aplikacijos saknini komponenta . Spring karkasas paleis aplikacija
        // t.y. startuos serveri su numatytaisiais parametrais
        SpringApplication.run(BodyBuildingApplication.class, args);
    }

}
