package com.trinity;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableAutoConfiguration
@ComponentScan(basePackages={"com.trinity"})
public class TrinityApplication {

	public static void main(String[] args) {
		SpringApplication.run(TrinityApplication.class, args);
	}
}
