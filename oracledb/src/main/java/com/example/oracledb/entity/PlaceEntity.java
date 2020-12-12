package com.example.oracledb.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "PLACE", schema = "SUPER_ADMIN", catalog = "")
public class PlaceEntity {
    private long id;
    private long coast;
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
    @Column(name = "COAST", nullable = false, precision = 0)
    public long getCoast() {
        return coast;
    }

    public void setCoast(long coast) {
        this.coast = coast;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PlaceEntity that = (PlaceEntity) o;

        if (id != that.id) return false;
        if (coast != that.coast) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (int) (coast ^ (coast >>> 32));
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "CINEMA_HALL_ID",insertable = false,updatable = false, referencedColumnName = "ID", nullable = false)
    public CinemaHallEntity getCinemaHallByCinemaHallId() {
        return cinemaHallByCinemaHallId;
    }

    public void setCinemaHallByCinemaHallId(CinemaHallEntity cinemaHallByCinemaHallId) {
        this.cinemaHallByCinemaHallId = cinemaHallByCinemaHallId;
    }

    @OneToMany(mappedBy = "placeByPlaceId")
    public Collection<TicketEntity> getTicketsById() {
        return ticketsById;
    }

    public void setTicketsById(Collection<TicketEntity> ticketsById) {
        this.ticketsById = ticketsById;
    }
}
