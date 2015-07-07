package com.corporate.transport.authentication;

import org.springframework.security.core.AuthenticationException;

public class LDAPConnectivityException extends AuthenticationException{
	
	public LDAPConnectivityException(String message) {
		super(message);
	}
	
}
