package com.screenit.app.controller;

import com.screenit.app.model.Meeting;
import com.screenit.app.model.User;
import com.screenit.app.repository.UserRepository;
import com.screenit.app.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Random;

@RestController
public class Home {
    @Autowired
    MeetingService meetingService;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public ModelAndView hello()
    {
        return new ModelAndView("index");
    }
    @GetMapping("/login")
    public ModelAndView loginPage() {
        return new ModelAndView("login");
    }
    @GetMapping("/left")
    public ModelAndView leave()
    {
        return new ModelAndView("leave");
    }
    @GetMapping("/chat")
    public ModelAndView chat()
    {
        return new ModelAndView("chat");
    }
    @GetMapping("/video-sharing")
    public ModelAndView videoSharing(){
        return new ModelAndView("video-sharing");
    }

    @GetMapping("/about-us")
    public ModelAndView aboutUs(){
        return new ModelAndView("about-us");
    }
    @GetMapping("/screen-sharing-room")
    public ModelAndView screenSharingRoom(){
        return new ModelAndView("screen-sharing-room");
    }

    @CrossOrigin(origins = "*")
    @GetMapping("/screen-sharing")
    public ModelAndView screenSharing(){
        return new ModelAndView("screen-sharing");
    }
    /* @GetMapping("/meeting")
     public ModelAndView renderMeeting(){
         return new ModelAndView("meeting");
     }
 */
    @GetMapping("/meeting/{roomId}/guest")
    public ModelAndView stalk(@PathVariable("roomId") String meetingName,@RequestParam("token") String token){

        if(meetingService.findMeetingByUUID(token)!=null) {
            System.out.println("at if");
            ModelAndView modelAndView= new ModelAndView("guest");
            modelAndView.addObject("roomId", meetingName);
            /*       modelAndView.addObject("meetingDetail","Verified");*/
            return modelAndView;
        }
        else {
            System.out.println("else");
            ModelAndView modelAndView= new ModelAndView("error");
            modelAndView.addObject("msg","NOT VALID TOKEN");
            System.out.println("after else");
            return modelAndView;
        }

    }
    @PostMapping("/generate")
    public ModelAndView getGuestName(@RequestParam("name") String name,@RequestParam("meetingName") String meetingName)
    {
        User user=new User();
        Random random=new Random();
        int r=random.nextInt(100000);
        ModelAndView modelAndView=new ModelAndView();
        if(userRepository.findByUsername(name)!=null)
        {
            modelAndView.setViewName("guest");
            modelAndView.addObject("msg","Choose a different username, username already exist");
        }
        else {
            String mail = r + "@screen-it.com";
            String hash = bCryptPasswordEncoder.encode(String.valueOf(r));
            user.setUsername(name);
            user.setEmail(mail);
            user.setPassword(hash);
            user.setEnable(true);
            user.setRole("GUEST");
            user.setMeetingName(meetingName);
            userRepository.save(user);
            modelAndView.setViewName("login");
            modelAndView.addObject("roomId", meetingName);
            modelAndView.addObject("guest", "enable");
            modelAndView.addObject("mail", mail);
            modelAndView.addObject("password", r);
        }
        return modelAndView;
    }
    @GetMapping("/meeting/{roomId}")
    public ModelAndView renderMeetingWithRoomId(@PathVariable("roomId")String meetingName){
        System.out.println("GET: /meeting/{roomId}");
        Meeting meeting=meetingService.findMeeting(meetingName);
        ModelAndView modelAndView = new ModelAndView("meeting");
        modelAndView.addObject("meetingName",meeting.getMeetingName());
        modelAndView.addObject("meetingPassword",meeting.getPassword());
        modelAndView.addObject("meetingUUID",meeting.getUUID());
        if(bCryptPasswordEncoder.matches("",meeting.getPassword()))
        {
            System.out.println(true);
            modelAndView.addObject("meetingPassword","");
            modelAndView.addObject("meetingDetail","Verified");
        }
        return modelAndView;
    }
    @PostMapping("/meeting/{roomId}")
    public ModelAndView renderMeetingWithRoomIdAndPassword(@RequestParam("password") String password, @PathVariable String roomId){
        Meeting meeting=meetingService.findMeeting(roomId);
        if(bCryptPasswordEncoder.matches(password,meeting.getPassword()))
        {
            ModelAndView modelAndView = new ModelAndView("meeting");
            modelAndView.addObject("meetingName",meeting.getMeetingName());
            modelAndView.addObject("meetingUUID",meeting.getUUID());
            modelAndView.addObject("meetingPassword","");
            modelAndView.addObject("meetingDetail","Verified");
            return modelAndView;
        }
        else {
            ModelAndView modelAndView = new ModelAndView("error");
            modelAndView.addObject("msg","Invalid Meeting password");
            return modelAndView;
        }
    }

    /*    @GetMapping("/meeting/{id}")
        public ModelAndView renderMeeting(){
            return new ModelAndView("meeting");
        }*/
    @GetMapping("/user")
    public ModelAndView renderUser(){
        ModelAndView modelAndView = new ModelAndView("user-dashboard");
        modelAndView.addObject("userRepository",userRepository);
        return modelAndView;
    }
    /*@GetMapping("/dashboard")
    public ModelAndView renderDashboard(){
        return new ModelAndView("user-dashboard");
    }*/

    @PostMapping("/user")
    public ModelAndView renderChangeUrl(@RequestParam( "username") String username, @RequestParam(value = "roomId", required = false) String roomId, @RequestParam(value = "password", required = false, defaultValue = "") String password){
/*
        User user=userRepository.findByUsername(username);
*/
        String encryptPassword=bCryptPasswordEncoder.encode(password);
        Long errorOrSuccessId = meetingService.saveMeeting(roomId,encryptPassword,username);
        System.out.println(errorOrSuccessId);
        ModelAndView modelAndView = new ModelAndView();
        /*modelAndView.setViewName("user-dashboard");*/
/*        System.out.println("here");
        System.out.println(user.getEmail());*/
        /*modelAndView.addObject("user",user);*/
        String message = "";
        if(errorOrSuccessId < 0) {
            modelAndView.setViewName("error");
            modelAndView.addObject("msg","Room already exists");
            /* message = "Room already exists";*/
            return modelAndView;
        }
        else {
            Meeting meeting = meetingService.findByMeetingId(errorOrSuccessId);
//            modelAndView.setViewName("meeting/"+roomId);
            System.out.println("SENDING meetingName and meetingUUID:  " + meeting.getMeetingName() + " " + meeting.getUUID());
            modelAndView.addObject("meetingName",meeting.getMeetingName());
            modelAndView.addObject("meetingUUID",meeting.getUUID());
            modelAndView.setViewName("redirect:/meeting/"+roomId);
           /* System.out.println("Room Created");
            message = "Success";
            modelAndView.addObject("meetingName",meetingService.findByMeetingId(errorOrSuccessId));*/
            return modelAndView;
        }
/*        modelAndView.addObject("message",message);
        System.out.println("all set");
        System.out.println(message);
        System.out.println("wefhbehfbejhfbejhfbehfhefhehfe");
        return modelAndView;*/
    }
}
