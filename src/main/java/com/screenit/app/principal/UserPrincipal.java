package com.screenit.app.principal;

import com.screenit.app.model.User;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;

public class UserPrincipal implements UserDetails {
    private User user;
    private boolean enable;

    public UserPrincipal(User user) {
        super();
        this.user = user;
        this.enable=user.isEnable();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        if(user.getRole().equals("GUEST"))
        {
            System.out.println(Collections.singleton(new SimpleGrantedAuthority("ROLE_GUEST")));
            return Collections.singleton(new SimpleGrantedAuthority("ROLE_GUEST"));
        }
        else {
            System.out.println("USER granted");
            return Collections.singleton(new SimpleGrantedAuthority("ROLE_USER"));
        }
        }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public String toString() {
        return user.getEmail();
    }

    @Override
    public boolean isEnabled() {
        return enable;
    }
}

