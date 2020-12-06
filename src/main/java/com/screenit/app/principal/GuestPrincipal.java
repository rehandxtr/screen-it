package com.screenit.app.principal;

import com.screenit.app.model.GuestUser;
import com.screenit.app.model.User;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;

public class GuestPrincipal implements UserDetails {
    private GuestUser guestUser;
    private boolean enable;

    public GuestPrincipal(GuestUser guestUser) {
        super();
        this.guestUser = guestUser;
        this.enable=guestUser.isEnable();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
            return Collections.singleton(new SimpleGrantedAuthority("ROLE_GUEST"));
        }

    @Override
    public String getPassword() {
        return guestUser.getPassword();
    }

    @Override
    public String getUsername() {
        return guestUser.getUsername();
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
        return guestUser.getEmail();
    }

    @Override
    public boolean isEnabled() {
        return enable;
    }
}

