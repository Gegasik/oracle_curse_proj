package com.example.oracledb.service;

import com.example.oracledb.FilmRepository;
import com.example.oracledb.entity.FilmEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.SessionFactoryBuilder;
import org.hibernate.internal.SessionFactoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import javax.persistence.PersistenceContext;
import javax.sql.DataSource;
import java.util.List;

@Service
public class FilmsService {

    @Autowired
    FilmRepository repository;
    @Autowired
    DataSource dataSource;
    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    public FilmsService(EntityManagerFactory entityManagerFactory) {

    }

    public void updateFilm(String newName, String newDescription, int filmId) {
        Session session = sessionFactory.openSession();
        session.createSQLQuery("CALL UpdateFilm(:newName,:newDescription,:filmId)")
                .setParameter("newName", newName)
                .setParameter("newDescription", newDescription)
                .setParameter("filmId", filmId);
    }

    public void saveFilm(String name, String description) {
        Session session = sessionFactory.openSession();
        session.createSQLQuery("CALL CreateFilm(:name,:description)")
                .setParameter("name", name)
                .setParameter("description", description);
    }

    public List getFilms() {
      return (List) repository.findAll();
    }
}
