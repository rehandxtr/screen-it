package com.screenit.app.repository;

import com.screenit.app.model.ConfirmationToken;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ConfirmationTokenRepository extends JpaRepository<ConfirmationToken, String> {
        ConfirmationToken findByConfirmationToken(String confirmationToken);
    }

