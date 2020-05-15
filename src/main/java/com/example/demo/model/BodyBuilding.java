package com.example.demo.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "bodybuildingspring")
public class BodyBuilding {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id")
        private int id;

    @Column(name = "name")
    @Pattern(regexp = "^[a-zA-Z]+$", message = "Only Letters allowed")
    private String name;

    @Column(name = "surname")
    @Pattern(regexp = "^[a-zA-Z]+$", message = "Only Letters allowed")
    private String surname;

    @Column(name = "age")
    @Pattern(regexp = "^-?\\d+$", message = "Only numbers allowed")
    private String age;


    @Column(name = "groups")
    private String groups;



    public BodyBuilding() {
    }

    public BodyBuilding(String name, String surname, String age, String groups) {
        this.name = name;
        this.surname = surname;
        this.age = age;
        this.groups = groups;
    }



    public BodyBuilding(int id, String name, String surname, String age, String groups){
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.age = age;
        this.groups = groups;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGroups() {
        return groups;
    }

    public void setGroups(String groups) {
        this.groups = groups;
    }

    @Override
    public String toString() {
        return "Number{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", age='" + age + '\'' +
                '}';
    }
}
