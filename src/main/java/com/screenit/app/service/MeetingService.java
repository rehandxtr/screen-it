package com.screenit.app.service;

import com.screenit.app.model.Meeting;
import org.springframework.stereotype.Service;

import java.util.Optional;

public interface MeetingService {

    boolean findByMeetingName(String meetingName);
    Long saveMeeting(String name, String password, String username);
    Meeting findByMeetingId(Long meetingId);
    Meeting findMeetingByUUID(String UUID);
    Meeting findMeeting(String meetingName);
}
