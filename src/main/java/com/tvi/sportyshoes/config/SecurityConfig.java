package com.tvi.sportyshoes.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.server.Http2;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;



@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	PasswordEncoder passwordEncoder;

	

	  @Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		  auth
		  .inMemoryAuthentication()
		  .passwordEncoder(passwordEncoder)
		  .withUser("user").password(passwordEncoder.encode("user1234")).roles("USER")
		  .and()
		  .withUser("admin").password(passwordEncoder.encode("admin1234")).roles("USER","ADMIN");
		  
	  }
	  
	  @Bean
	  public PasswordEncoder  passwordEncoder() {
		  return new BCryptPasswordEncoder();
	  }



	@Override
	    protected void configure(HttpSecurity httpSecurity) throws Exception {
		  
		  httpSecurity
		
		  .authorizeRequests()
		  .antMatchers("/login").permitAll()
		  .antMatchers("/**").hasAnyRole("ADMIN","USER")
		  .and()
		  .formLogin().loginPage("/login")
		  .defaultSuccessUrl("/productlist")
		  .failureUrl("/login?error=true")
		  .permitAll()
		  .and()
		  .logout()
		  .logoutSuccessUrl("/login?logout=true")
		  .invalidateHttpSession(true)
		  .permitAll()
		  .and()
		  .csrf().disable();
		  httpSecurity.headers().frameOptions().disable();
		  
		

	    }
		/*
		 * protected void configure(Http2 http) {
		 * http.headers().frameOptions().disable(); }
		 */ 
		/*
		 * @Bean
		 * 
		 * @Override public UserDetailsService userDetailsService() { UserDetails user=
		 * User.withDefaultPasswordEncoder().username("Admin")
		 * .password("adminpassword") .roles("Admin").build();
		 * 
		 * return new InMemoryUserDetailsManager(user); }
		 */
}
