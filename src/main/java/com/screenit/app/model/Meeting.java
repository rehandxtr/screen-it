package com.screenit.app.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@Entity
@Getter
@Setter
public class Meeting {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="meeting_id")
    private long meetingId;

    @Column(name="meeting_name")
    private String meetingName;

    @Column(name="password")
    private String password;

    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;

    private boolean isEnable;

    private String UUID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id" , insertable = true , updatable = false)
    @JsonIgnore
    private User user;

    public Meeting(User user, String meetingName, String password,String UUID) {
        this.user = user;
        this.meetingName = meetingName;
        this.password = password;
        createdDate = new Date();
        this.isEnable = true;
        this.UUID=UUID;
    }


    @Override
    public String toString() {
        return meetingName;
    }

    public Meeting() {
    }
}