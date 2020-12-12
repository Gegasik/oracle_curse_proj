package com.example.oracledb.entity;

import javax.persistence.*;
import java.sql.Time;
import java.util.Collection;

@Entity
@Table(name = "SESSION", schema = "SUPER_ADMIN", catalog = "")
public class SessionEntity {
    private long id;
    private long filmId;
    private long cinemaHallId;
    private long addedCoast;
    private Time date;
    private FilmEntity filmByFilmId;
    private CinemaHallEntity cinemaHallByCinemaHallId;
    private Collection<TicketEntity> ticketsById;

    @Id
    @Column(name = "ID", nullable = false, precision = 0)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "FILM_ID",insertable = false,nullable = false ,updatable = false, precision = 0)
    public long getFilmId() {
        return filmId;
    }

    public void setFilmId(long filmId) {
        this.filmId = filmId;
    }

    @Basic
    @Column(name = "CINEMA_HALL_ID",insertable = false,updatable = false, nullable = false, precision = 0)
    public long getCinemaHallId() {
        return cinemaHallId;
    }

    public void setCinemaHallId(long cinemaHallId) {
        this.cinemaHallId = cinemaHallId;
    }

    @Basic
    @Column(name = "ADDED_COAST", nullable = false, precision = 0)
    public long getAddedCoast() {
        return addedCoast;
    }

    public void setAddedCoast(long addedCoast) {
        this.addedCoast = addedCoast;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Time getDate() {
        return date;
    }

    public void setDate(Time date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SessionEntity that = (SessionEntity) o;

        if (id != that.id) return false;
        if (filmId != that.filmId) return false;
        if (cinemaHallId != that.cinemaHallId) return false;
        if (addedCoast != that.addedCoast) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (int) (filmId ^ (filmId >>> 32));
        result = 31 * result + (int) (cinemaHallId ^ (cinemaHallId >>> 32));
        result = 31 * result + (int) (addedCoast ^ (addedCoast >>> 32));
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "FILM_ID",insertable = false,updatable = false, referencedColumnName = "ID", nullable = false)
    public FilmEntity getFilmByFilmId() {
        return filmByFilmId;
    }

    public void setFilmByFilmId(FilmEntity filmByFilmId) {
        this.filmByFilmId = filmByFilmId;
    }

    @ManyToOne
    @JoinColumn(name = "CINEMA_HALL_ID",insertable = false,updatable = false, referencedColumnName = "ID", nullable = false)
    public CinemaHallEntity getCinemaHallByCinemaHallId() {
        return cinemaHallByCinemaHallId;
    }

    public void setCinemaHallByCinemaHallId(CinemaHallEntity cinemaHallByCinemaHallId) {
        this.cinemaHallByCinemaHallId = cinemaHallByCinemaHallId;
    }

    @OneToMany(mappedBy = "sessionBySessionId")
    public Collection<TicketEntity> getTicketsById() {
        return ticketsById;
    }

    public void setTicketsById(Collection<TicketEntity> ticketsById) {
        this.ticketsById = ticketsById;
    }
}
