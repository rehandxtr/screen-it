package com.screenit.app.controller;


import com.screenit.app.model.ConfirmationToken;
import com.screenit.app.model.User;
import com.screenit.app.repository.ConfirmationTokenRepository;
import com.screenit.app.repository.UserRepository;
import com.screenit.app.service.EmailSenderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private EmailSenderService emailSenderService;

    @Autowired
    private ConfirmationTokenRepository confirmationTokenRepository;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @GetMapping(value="/register")
    public ModelAndView register()
    {
        return new ModelAndView("register");
    }
    @PostMapping(value="/register")
    public ModelAndView getRegister(@RequestParam("name") String name,@RequestParam("email") String email,@RequestParam("password") String password)
    {
        logger.info(email + "trying to register");
        ModelAndView modelAndView=new ModelAndView("message");
        modelAndView.addObject("msg","User Registered successfully please check your mail");

            User user=new User();
            User existingUser = userRepository.findByEmail(email);
            if(existingUser != null)
            {
                logger.info(email + "not in existing database");
                modelAndView.addObject("msg","This email already exists!");
                modelAndView.setViewName("register");
            }
            else
            {
                logger.info(email + "stored inside database");
                String pass= bCryptPasswordEncoder.encode(password);
                user.setUsername(name);
                user.setEmail(email);
                user.setPassword(pass);
                user.setRole("USER");
                userRepository.save(user);
                logger.info("generating token for "+email);
                ConfirmationToken confirmationToken = new ConfirmationToken(user);
                confirmationTokenRepository.save(confirmationToken);
                SimpleMailMessage mailMessage = new SimpleMailMessage();
                mailMessage.setTo(user.getEmail());
                mailMessage.setSubject("Complete Registration!");
                mailMessage.setFrom("myId");
                mailMessage.setText("To confirm your account, please click here : https://screen-it-git.herokuapp.com/confirm-account?token="+confirmationToken.getConfirmationToken());
                emailSenderService.sendEmail(mailMessage);
                logger.info("mail sended successfully "+email);
            }
            return modelAndView;
    }

    @RequestMapping(value="/confirm-account", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView confirmUserAccount(@RequestParam("token")String confirmationToken)
    {
        logger.info( "At Confirmation");
        ModelAndView modelAndView =new ModelAndView();
        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);
        Date date=new Date();
        if(token != null) {
            logger.info( "Token verified");
            if (date.getTime() - token.getCreatedDate().getTime() < 500000) {
                User user = userRepository.findByEmail(token.getUser().getEmail());
                user.setEnable(true);
                userRepository.save(user);
                modelAndView.setViewName("message");
                modelAndView.addObject("msg","User verified");
                confirmationTokenRepository.delete(token);
                return modelAndView;
            }
            else
            {
                logger.info( "token time exceeded");
                modelAndView.addObject("msg","Token already expired");
                modelAndView.setViewName("error");
            }
        }
        else
        {
            logger.info( "Invalid token");
            modelAndView.addObject("msg","The link is invalid or broken!");
            modelAndView.setViewName("error");
        }
        return modelAndView;
    }
}
