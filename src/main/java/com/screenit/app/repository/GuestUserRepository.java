package com.screenit.app.repository;

import com.screenit.app.model.GuestUser;
import com.screenit.app.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GuestUserRepository extends JpaRepository<GuestUser, Integer> {
    GuestUser findByEmail(String email);
}
