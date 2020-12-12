package com.example.oracledb.controller;

import com.example.oracledb.entity.FilmEntity;
import com.example.oracledb.service.FilmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class FilmController {
    @Autowired
    FilmsService filmsService;

    @GetMapping("/films")
    public List getFilms(){
       return   filmsService.getFilms();

    }
    @GetMapping("/save")
    public void saveFilm() {
     filmsService.saveFilm("aaa","ccc");
    }

}
