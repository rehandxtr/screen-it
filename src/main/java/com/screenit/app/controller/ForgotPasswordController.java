package com.screenit.app.controller;

import com.screenit.app.model.ConfirmationToken;
import com.screenit.app.model.User;
import com.screenit.app.repository.ConfirmationTokenRepository;
import com.screenit.app.repository.UserRepository;
import com.screenit.app.service.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
public class ForgotPasswordController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ConfirmationTokenRepository confirmationTokenRepository;

    @Autowired
    private EmailSenderService emailSenderService;

    @RequestMapping(value="/forgot-password", method = RequestMethod.GET)
    public ModelAndView displayForgot(ModelAndView modelAndView)
    {
        modelAndView.setViewName("forgot-password");
        return modelAndView;
    }


    @RequestMapping(value="/forgot-password", method = RequestMethod.POST)
    public ModelAndView registerUser(@RequestParam("email") String email)
    {
        ModelAndView modelAndView=new ModelAndView("message");
        User existingUser = userRepository.findByEmail(email);
        if(existingUser == null)
        {
            modelAndView.addObject("msg", email+" Does not exists!");
            modelAndView.setViewName("register");
        }
        else
        {
            User user=userRepository.findByEmail(email);
            ConfirmationToken confirmationToken = new ConfirmationToken(user);
            confirmationTokenRepository.save(confirmationToken);
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(user.getEmail());
            mailMessage.setSubject("Change Password!");
            mailMessage.setFrom("Rehan");
            mailMessage.setText("To change password, please click here : https://screen-it-git.herokuapp.com/change-password?token="+confirmationToken.getConfirmationToken());
            emailSenderService.sendEmail(mailMessage);
            modelAndView.addObject("msg", "Email has been sent to "+user.getEmail()+" Please check your mail");
        }
        return modelAndView;
    }
    @RequestMapping(value="/change-password", method= RequestMethod.GET)
    public ModelAndView confirmUserAccount(@RequestParam("token")String confirmationToken)
    {
        System.out.println("here");
        ModelAndView modelAndView = new ModelAndView();
        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);
        Date date=new Date();
        if(token != null) {
            System.out.println("here again");
            if (date.getTime() - token.getCreatedDate().getTime() < 500000) {
                User user = userRepository.findByEmail(token.getUser().getEmail());
                modelAndView.setViewName("change-password");
                confirmationTokenRepository.delete(token);
                modelAndView.addObject("user",user.getEmail());
                return modelAndView;
            }
            else
            {
                modelAndView.addObject("msg","The link is expired!");
                modelAndView.setViewName("error");
                return modelAndView;
            }
        }
        else
        {
            modelAndView.addObject("msg","The link is invalid or broken!");
            modelAndView.setViewName("error");
            return modelAndView;
        }
    }
    @RequestMapping(value="/success-password", method= RequestMethod.POST)
    public ModelAndView change(@RequestParam("email") String email,@RequestParam("password") String password){
        User user=userRepository.findByEmail(email);
        user.setPassword(BCrypt.hashpw(password,BCrypt.gensalt()));
        userRepository.save(user);
       ModelAndView modelAndView = new ModelAndView("message");
       modelAndView.addObject("msg","Password changed successfully");
       return modelAndView;
    }
}
