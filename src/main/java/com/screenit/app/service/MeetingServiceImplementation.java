package com.screenit.app.service;

import com.screenit.app.config.SecurityConfig;
import com.screenit.app.model.Meeting;
import com.screenit.app.model.User;
import com.screenit.app.principal.UserPrincipal;
import com.screenit.app.repository.MeetingRepository;
import com.screenit.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@Service
public class MeetingServiceImplementation implements MeetingService {

    @Autowired
    MeetingRepository meetingRepository;

    @Autowired
    UserRepository userRepository;

    @Override
    public boolean findByMeetingName(String meetingName) {
        Meeting meetingOptional = meetingRepository.findByMeetingName(meetingName);
        if (meetingOptional != null) {
            return true;
        }
        return false;
    }

    public Long saveMeeting(String meetingName, String password, String username) {

        if (findByMeetingName(meetingName)) {
            return -1L;
        }

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        String userEmail = "";
        if (principal instanceof User) {
            userEmail = ((User) principal).getUsername();
        } else {
            userEmail = principal.toString();
        }

        User user = userRepository.findByEmail(userEmail);
        System.out.println("user = " + user.getUsername());
        String token = UUID.randomUUID().toString();
        Meeting meeting = new Meeting(user, meetingName, password,token);

        Long meetingId = meetingRepository.save(meeting).getMeetingId();
        return meetingId;
    }

    @Override
    public Meeting findByMeetingId(Long meetingId) {
        return meetingRepository.findById(meetingId).get();
    }

    @Override
    public Meeting findMeetingByUUID(String UUID) {
/*        System.out.println("finding TOken");*/
        return meetingRepository.findMeetingByUUID(UUID);
    }


    public Meeting findMeeting(String meetingName){
        return meetingRepository.findByMeetingName(meetingName);
    }
}
