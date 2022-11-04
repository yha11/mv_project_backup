package com.ezen.sb.model;

import java.util.Collection;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserInfoModel implements UserDetails {
	private static final long serialVersionUID = 1L;
	
	private String role;
	private Long userNum;
	private String userId;
	private String password;
	private String userName;
	private String userEmail;
    private boolean isAccountNonExpired = true;
    private boolean isAccountNonLocked = true;
    private boolean isCredentialsNonExpired = true;
    private boolean isEnabled = true;
	private Collection<? extends GrantedAuthority> authorities;
	@Override
	public String getUsername() {
		return this.userId;
	}
	
	public String getUserName() {
		return this.userName;
	}
}
