/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test.fptblog.database;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import test.fptblog.model.userModel;
import test.fptblog.repositories.userRepository;

/**
 *
 * @author pc
 */
@Configuration
public class database {

    private static final Logger logger = LoggerFactory.getLogger(database.class);

    @Bean
    CommandLineRunner initDatabase(userRepository userrep) {
        return new CommandLineRunner() {
            @Override
            public void run(String... args) throws Exception {
                //  userModel a = new userModel("khai","123","user");
                // userModel b = new userModel("admin","1","admin");
                // logger.info("insert data: " + userrep.save(a));
                // logger.info("insert data: " + userrep.save(b));
                userModel adminUser = new userModel("SE000000", "Admin", "1", "admin", "9-9-9999", 0, 0, 0, "admin account", "", null);
                List<userModel> userList = userrep.findAll();
                if (userList.size() == 0) {
                    logger.info("insert data: " + userrep.save(adminUser));
                }

            }
        };
    }
}
