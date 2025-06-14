package cv.igrp.platform.igrpeureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class IgrpEurekaApplication {

    public static void main(String[] args) {
        SpringApplication.run(IgrpEurekaApplication.class, args);
    }

}
