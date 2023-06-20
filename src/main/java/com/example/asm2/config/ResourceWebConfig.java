package com.example.asm2.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ResourceWebConfig implements WebMvcConfigurer {
    private Environment environment;

    @Autowired
    public ResourceWebConfig(Environment environment) {
        this.environment = environment;
    }

    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        String location = environment.getProperty("app.file.storage.mapping");

        registry.addResourceHandler("/uploads/**").addResourceLocations(location);
    }
}
