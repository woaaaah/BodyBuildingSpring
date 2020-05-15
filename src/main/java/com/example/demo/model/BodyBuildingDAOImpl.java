package com.example.demo.model;

import com.example.demo.config.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class BodyBuildingDAOImpl implements BodyBuildingDAO {
    public void insertEntity(BodyBuilding bodyBuilding) {
        EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();

        entityManager.persist(bodyBuilding);

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public BodyBuilding findEntityByID(int id) {
        EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
        entityManager.getTransaction().begin();

        List<BodyBuilding> bodyBuildings = entityManager.
                createQuery("Select n FROM BodyBuilding n WHERE n.id = :id")
                .setParameter("id", id)
                .getResultList();

        entityManager.getTransaction().commit();
        entityManager.close();

        return bodyBuildings.get(0);
    }

    public List<BodyBuilding> findEntities() {
        EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
        entityManager.getTransaction().begin();

        List<BodyBuilding> bodyBuildings = entityManager.createQuery("SELECT n FROM BodyBuilding n")
                .getResultList();

        return bodyBuildings;
    }

    public void updateEntity(BodyBuilding bodyBuilding) {
        EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
        entityManager.getTransaction().begin();

        BodyBuilding bodyBuilding2 = entityManager.find(BodyBuilding.class, bodyBuilding.getId());
        bodyBuilding2.setName(bodyBuilding.getName());
        bodyBuilding2.setSurname(bodyBuilding.getSurname());
        bodyBuilding2.setAge(bodyBuilding.getAge());
        bodyBuilding2.setGroups(bodyBuilding.getGroups());

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public void removeEntityByID(int id) {
        EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
        entityManager.getTransaction().begin();

        BodyBuilding bodyBuilding = entityManager.find(BodyBuilding.class, id);
        entityManager.remove(bodyBuilding);

        entityManager.getTransaction().commit();
        entityManager.close();
    }
    

}
