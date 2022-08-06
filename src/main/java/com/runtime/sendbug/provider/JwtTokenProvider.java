package com.runtime.sendbug.provider;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import com.runtime.sendbug.model.UserInfoModel;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.UnsupportedJwtException;

@Component
public class JwtTokenProvider {
	private final long TOKEN_VALID_MILISECOND = 1000L * 60; // 1분

	@Value("jwt.secret")
	private String secretKey;

	private final long REFRESH_TOKEN_VALID_MILISECOND = 1 * 60 * 2000L; // 2분
	@Autowired
	private UserDetailsService userService;

	public String createAccessToken(UserInfoModel user) {
		Map<String, Object> headers = new HashMap<>();
		headers.put("type", "token");

		Map<String, Object> payloads = new HashMap<>();
		payloads.put("userId", user.getUserId());

		Date expiration = new Date();
		expiration.setTime(expiration.getTime() + TOKEN_VALID_MILISECOND);

		String jwt = Jwts.builder().setHeader(headers).setClaims(payloads).setSubject("user").setExpiration(expiration)
				.signWith(SignatureAlgorithm.HS256, secretKey).compact();

		return jwt;
	}

	public Map<String, String> createRefreshToken(UserInfoModel user) {
		Map<String, Object> headers = new HashMap<>();
		headers.put("type", "token");

		Map<String, Object> payloads = new HashMap<>();
		payloads.put("userId", user.getUserId());

		Date expiration = new Date();
		expiration.setTime(expiration.getTime() + REFRESH_TOKEN_VALID_MILISECOND);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
		String refreshTokenExpirationAt = simpleDateFormat.format(expiration);

		String jwt = Jwts.builder().setHeader(headers).setClaims(payloads).setSubject("user").setExpiration(expiration)
				.signWith(SignatureAlgorithm.HS256, secretKey).compact();

		Map<String, String> result = new HashMap<>();
		result.put("refreshToken", jwt);
		result.put("refreshTokenExpirationAt", refreshTokenExpirationAt);
		return result;
	}

	public Authentication getAuthentication(String token) {
		UserDetails userDetails = userService.loadUserByUsername(this.getUserInfo(token));
		return new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities());
	}

	public String getUserInfo(String token) {
		return (String) Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().get("email");
	}

	public String resolveToken(HttpServletRequest request) {
		return request.getHeader("token");
	}

	public boolean validateJwtToken(ServletRequest request, String authToken) {
        try {
            Jwts.parser().setSigningKey(secretKey).parseClaimsJws(authToken);
            return true;
        } catch (MalformedJwtException e) {
            request.setAttribute("exception", "MalformedJwtException");
        } catch (ExpiredJwtException e) {
            request.setAttribute("exception", "ExpiredJwtException");
        } catch (UnsupportedJwtException e) {
            request.setAttribute("exception", "UnsupportedJwtException");
        } catch (IllegalArgumentException e) {
            request.setAttribute("exception", "IllegalArgumentException");
        }
        return false;
    }
}