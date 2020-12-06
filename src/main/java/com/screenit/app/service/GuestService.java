package com.screenit.app.service;


import com.screenit.app.model.GuestUser;

import com.screenit.app.model.User;
import com.screenit.app.principal.GuestPrincipal;
import com.screenit.app.repository.GuestUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class GuestService implements UserDetailsService {
@Autowired
GuestUserRepository guestUserRepository;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        GuestUser guestUser = guestUserRepository.findByEmail(s);
        if(guestUser ==null)
            throw new UsernameNotFoundException("not found");
        return new GuestPrincipal(guestUser);
    }
    public void save(GuestUser guestUser) {
        guestUserRepository.save(guestUser);
    }

}
