package com.example.oracledb.entity;

import javax.persistence.*;

@Entity
@Table(name = "TICKET", schema = "SUPER_ADMIN", catalog = "")
public class TicketEntity {
    private long id;
    private long sessionId;
    private long placeId;
    private long totalCoast;
    private long userId;
    private SessionEntity sessionBySessionId;
    private PlaceEntity placeByPlaceId;
    private UserEntity userByUserId;

    @Id
    @Column(name = "ID", nullable = false, precision = 0)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "SESSION_ID",insertable = false,updatable = false, nullable = false, precision = 0)
    public long getSessionId() {
        return sessionId;
    }

    public void setSessionId(long sessionId) {
        this.sessionId = sessionId;
    }

    @Basic
    @Column(name = "PLACE_ID",insertable = false,updatable = false, nullable = false, precision = 0)
    public long getPlaceId() {
        return placeId;
    }

    public void setPlaceId(long placeId) {
        this.placeId = placeId;
    }

    @Basic
    @Column(name = "TOTAL_COAST", nullable = false, precision = 0)
    public long getTotalCoast() {
        return totalCoast;
    }

    public void setTotalCoast(long totalCoast) {
        this.totalCoast = totalCoast;
    }

    @Basic
    @Column(name = "USER_ID",insertable = false,updatable = false, nullable = false, precision = 0)
    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TicketEntity that = (TicketEntity) o;

        if (id != that.id) return false;
        if (sessionId != that.sessionId) return false;
        if (placeId != that.placeId) return false;
        if (totalCoast != that.totalCoast) return false;
        if (userId != that.userId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (int) (sessionId ^ (sessionId >>> 32));
        result = 31 * result + (int) (placeId ^ (placeId >>> 32));
        result = 31 * result + (int) (totalCoast ^ (totalCoast >>> 32));
        result = 31 * result + (int) (userId ^ (userId >>> 32));
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "SESSION_ID",insertable = false,updatable = false, referencedColumnName = "ID", nullable = false)
    public SessionEntity getSessionBySessionId() {
        return sessionBySessionId;
    }

    public void setSessionBySessionId(SessionEntity sessionBySessionId) {
        this.sessionBySessionId = sessionBySessionId;
    }

    @ManyToOne
    @JoinColumn(name = "PLACE_ID",insertable = false,updatable = false, referencedColumnName = "ID", nullable = false)
    public PlaceEntity getPlaceByPlaceId() {
        return placeByPlaceId;
    }

    public void setPlaceByPlaceId(PlaceEntity placeByPlaceId) {
        this.placeByPlaceId = placeByPlaceId;
    }

    @ManyToOne
    @JoinColumn(name = "USER_ID",insertable = false,updatable = false, referencedColumnName = "ID", nullable = false)
    public UserEntity getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(UserEntity userByUserId) {
        this.userByUserId = userByUserId;
    }
}
