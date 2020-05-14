package com.example.demo.service;

import com.example.demo.model.BodyBuilding;
import com.example.demo.model.BodyBuildingDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class BodyBuildingServiceImpl implements BodyBuildingService {

    @Autowired
    @Qualifier("NumberDAO")
    private BodyBuildingDAO bodyBuildingDAO;

    @Override
    public List <BodyBuilding> getAll() {
        return bodyBuildingDAO.findEntities();
    }

    @Override
    public void save(BodyBuilding bodyBuilding) {
        bodyBuildingDAO.insertEntity(bodyBuilding);
    }

    @Override
    public BodyBuilding getById(int id) {
        return bodyBuildingDAO.findEntityByID(id);
    }

    @Override
    public void update(BodyBuilding bodyBuilding) {
        bodyBuildingDAO.updateEntity(bodyBuilding);
    }

    @Override
    public void delete(int id) {
        bodyBuildingDAO.removeEntityByID(id);
    }

}
