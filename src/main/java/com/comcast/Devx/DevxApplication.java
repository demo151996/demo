package com.comcast.Devx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.graphql.GraphQlSourceBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.graphql.data.federation.FederationSchemaFactory;


@Configuration
@PropertySource(value = "classpath:application.properties")
@SpringBootApplication(scanBasePackages = {"com.comcast.Devx"})
public class DevxApplication {

    public static void main(String[] args){
        SpringApplication.run(DevxApplication.class, args);
    }

}
