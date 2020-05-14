package com.example.demo.model;

import java.util.List;

public interface BodyBuildingDAO {
    void insertEntity(BodyBuilding bodyBuilding);
    BodyBuilding findEntityByID(int id);
    List<BodyBuilding> findEntities();
    void updateEntity(BodyBuilding bodyBuilding);
    void removeEntityByID(int id);
}
