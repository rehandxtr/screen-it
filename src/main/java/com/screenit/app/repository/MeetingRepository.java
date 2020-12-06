package com.screenit.app.repository;

import com.screenit.app.model.Meeting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MeetingRepository extends JpaRepository<Meeting, Long> {
    Meeting findByMeetingName(String meetingName);
    Meeting findMeetingByUUID(String UUID);
}
