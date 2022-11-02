package com.ezen.sb.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.ezen.sb.filter.JwtAuthenticationFilter;
import com.ezen.sb.handler.AuthenticationEntryPointHandler;
import com.ezen.sb.handler.WebAccessDeniedHandler;
import com.ezen.sb.provider.JwtTokenProvider;
import com.ezen.sb.service.UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private JwtTokenProvider jwtProvider;
	@Autowired
	private WebAccessDeniedHandler webAccessDeniedHandler;
	@Autowired
	private AuthenticationEntryPointHandler authenticationEntryPointHandler;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserService authService;

	@Override
	protected void configure(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(authService).passwordEncoder(passwordEncoder);
	}

	@Bean(name = BeanIds.AUTHENTICATION_MANAGER)
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Override
	public void configure(WebSecurity web) {
		web.ignoring().antMatchers("/v2/api-docs", "/configuration/ui", "/swagger-resources/**",
				"/configuration/security", "/swagger-ui.html", "/webjars/**", "/swagger-ui/**", "/test/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.httpBasic().disable().csrf().disable().sessionManagement()
				.sessionCreationPolicy(SessionCreationPolicy.STATELESS).and().authorizeRequests()
//                .antMatchers("/admin/**", "/admins/**").hasRole("ADMIN")
				.antMatchers("/**").permitAll().anyRequest().authenticated().and().exceptionHandling()
				.authenticationEntryPoint(authenticationEntryPointHandler).accessDeniedHandler(webAccessDeniedHandler)
				.and()
				.addFilterAfter(new JwtAuthenticationFilter(jwtProvider), UsernamePasswordAuthenticationFilter.class);
	}
}