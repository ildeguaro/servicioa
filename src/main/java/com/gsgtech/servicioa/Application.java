package com.gsgtech.servicioa;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.SpringVersion;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@Configuration
@SpringBootApplication
@EnableJpaRepositories
@RestController
public class Application {
	
	private static final Logger logger = LoggerFactory.getLogger(Application.class);
	public static void main(String[] args) {		
		SpringApplication.run(Application.class, args);
		logger.info("\n\nIniciado Micro Servicio A con Spring Boot {}", SpringVersion.getVersion());
	}
	
	@RequestMapping("/")
    @ResponseBody
    String home() {    	 
        return "Micro Servicio A";
    }
}
