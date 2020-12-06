package com.screenit.app.schedule;

import com.screenit.app.model.ConfirmationToken;
import com.screenit.app.model.User;
import com.screenit.app.repository.ConfirmationTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Component
public class Scheduler {
/*    @Autowired
    private UserRepository userRepository;*/

    @Autowired
    private ConfirmationTokenRepository confirmationTokenRepository;

    @Scheduled(fixedRate = 30000)
    public void resetDb()
    {
        Date date=new Date();
        List<ConfirmationToken> userId=new ArrayList<>();
        List<ConfirmationToken> confirmationTokenList =confirmationTokenRepository.findAll();
       for(ConfirmationToken confirmationToken:confirmationTokenList)
       {
           User user=confirmationToken.getUser();
           if(!user.isEnable() && (date.getTime() - confirmationToken.getCreatedDate().getTime() >500000) )
           {
               confirmationTokenRepository.delete(confirmationToken);
           }
       }
    }
}
