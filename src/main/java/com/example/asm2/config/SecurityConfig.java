package com.example.asm2.config;

import com.example.asm2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    private UserService userService;

    @Autowired
    public SecurityConfig(UserService userService) {
        this.userService = userService;
    }

    //bcrypt bean definition
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    //authenticationProvider bean definition
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
        auth.setUserDetailsService(userService); //set the custom user details service
        auth.setPasswordEncoder(passwordEncoder()); //set the password encoder - bcrypt
        return auth;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(configurer ->
                configurer
                        .requestMatchers("/assets/**").permitAll()
                        .requestMatchers("/").permitAll()
                        .requestMatchers("/home").permitAll()
                        .requestMatchers("/register").permitAll()
                        .requestMatchers("/verify").permitAll()
                        .requestMatchers("/candidate/**").hasRole("CANDIDATE")
                        .requestMatchers("/employer/**").hasRole("EMPLOYER")
                        .anyRequest().authenticated()
                )
                .formLogin(form ->
                        form
                                .loginPage("/showLoginPage")       // by default: .usernameParameter("username")
                                .loginProcessingUrl("/authenticateTheUser")
                                .defaultSuccessUrl("/home") // if not set defaultSuccessUrl, it will return "/"
                                .permitAll()
                )
                .sessionManagement(session ->
                        session
                                .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                                .invalidSessionUrl("/logout")        // set Url when session invalid
                                .maximumSessions(1)
                                .maxSessionsPreventsLogin(false)     // second login will cause the first to be invalidated
                )
                .logout(logout -> logout.permitAll()          // add logout support for default url "/logout"
                        .logoutSuccessUrl("/showLoginPage")   // it means: permitAll access to "/showLoginPage" too
                        .deleteCookies("JSESSIONID")
                        .invalidateHttpSession(true)          // delete Cookies and invalidate Session when logout
                );

        // use Http Basic authentication
        http.httpBasic();

        http.csrf().disable();

        return http.build();
    }
}
