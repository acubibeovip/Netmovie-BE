package com.java.project.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.java.project.entity.UserEntity;
import com.java.project.repository.UserRepository;
import com.java.project.service.Impl.UserServiceImpl;


@Configuration
@EnableWebSecurity
public class SecurityConfiguation extends WebSecurityConfigurerAdapter{
	
	@Bean
	public UserDetailsService userDetailService() {
		return new UserDetailsServiceImpl();
	} 
	
	@Bean
	public BCryptPasswordEncoder passwordEnCoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authoProvider = new DaoAuthenticationProvider();
		authoProvider.setUserDetailsService(userDetailService());
		authoProvider.setPasswordEncoder(passwordEnCoder());
		return authoProvider;
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.csrf().disable()
		.authorizeRequests()
		.antMatchers("/home/**").permitAll()
		.antMatchers("/admin/**").hasRole("ADMIN")
        .anyRequest()
        .authenticated()
        .and()
        .exceptionHandling()
        .accessDeniedPage("/access-denied")

        .and()
        .formLogin()
      //  .loginPage("/login").permitAll()
		.successHandler(new AuthenticationSuccessHandler() {
			
			@Override
			public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException  {
				String role ="";
				authentication.getAuthorities().forEach(r->{
					 try {
                         if (r.getAuthority().equals("ROLE_USER")){
                             response.sendRedirect(request.getContextPath()+"/");
                         }else{
                             response.sendRedirect(request.getContextPath()+"/admin");
                         }
                     }catch (IOException e){
                         e.printStackTrace();
                     }
				});
			}
		})
		 .passwordParameter("password")
         .usernameParameter("username")
         .and()
         .rememberMe()
         .rememberMeParameter("remember-me")
         .and()
         .logout()
         .logoutUrl("/logout")
         .logoutRequestMatcher(new AntPathRequestMatcher("/logout","GET"))
         .clearAuthentication(true)
         .invalidateHttpSession(true)
         .deleteCookies("JSESSIONID","remember-me")
         .logoutSuccessUrl("/");

		
	
//		http.authorizeRequests()
//			.antMatchers("/admin/**").hasAnyRole("ADMIN")
//			.antMatchers("/").hasAnyRole("ADMIN")
//			.anyRequest().authenticated()
//			.and()
//			.formLogin().permitAll()
//			.and()
//			.logout().permitAll();
	}
}

