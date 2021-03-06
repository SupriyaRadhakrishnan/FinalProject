package co.grandcircus.YelpFusion;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class YelpFusionApplication {

	public static void main(String[] args) {
		SpringApplication.run(YelpFusionApplication.class, args);
		System.out.println("MMT RUN");
	}

}
