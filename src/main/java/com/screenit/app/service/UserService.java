package com.screenit.app.service;

import com.screenit.app.model.User;
import com.screenit.app.principal.UserPrincipal;
import com.screenit.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("userDetailsService")
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
  /*      System.out.println(email);*/
        User user =userRepository.findByEmail(email);if(user ==null)
            throw new UsernameNotFoundException("not found");
        return new UserPrincipal(user);
    }
    public void save(User user) {
 /*          if(userRepository.findByEmail(user.getEmail())!=null)
           System.out.println("hekkko");
       else {*/
           userRepository.save(user);
      /* }*/
    }
}
