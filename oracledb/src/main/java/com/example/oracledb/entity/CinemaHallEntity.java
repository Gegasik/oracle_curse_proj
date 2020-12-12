package com.example.oracledb.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "CINEMA_HALL", schema = "SUPER_ADMIN", catalog = "")
public class CinemaHallEntity {
    private long id;
    private String title;
    private long capacity;
    private Collection<PlaceEntity> placesById;
    private Collection<SessionEntity> sessionsById;

    @Id
    @Column(name = "ID", nullable = false, precision = 0)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "TITLE", nullable = false, length = 255)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "CAPACITY", nullable = false, precision = 0)
    public long getCapacity() {
        return capacity;
    }

    public void setCapacity(long capacity) {
        this.capacity = capacity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CinemaHallEntity that = (CinemaHallEntity) o;

        if (id != that.id) return false;
        if (capacity != that.capacity) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (int) (capacity ^ (capacity >>> 32));
        return result;
    }

    @OneToMany(mappedBy = "cinemaHallByCinemaHallId")
    public Collection<PlaceEntity> getPlacesById() {
        return placesById;
    }

    public void setPlacesById(Collection<PlaceEntity> placesById) {
        this.placesById = placesById;
    }

    @OneToMany(mappedBy = "cinemaHallByCinemaHallId")
    public Collection<SessionEntity> getSessionsById() {
        return sessionsById;
    }

    public void setSessionsById(Collection<SessionEntity> sessionsById) {
        this.sessionsById = sessionsById;
    }
}
