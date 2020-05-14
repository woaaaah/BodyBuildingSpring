package com.example.demo.service;

import com.example.demo.model.BodyBuilding;

import java.util.List;

public interface BodyBuildingService {
    List<BodyBuilding> getAll();
    void save (BodyBuilding bodyBuilding);
    BodyBuilding getById(int id);
    void update (BodyBuilding bodyBuilding);
    void delete(int id);
}
