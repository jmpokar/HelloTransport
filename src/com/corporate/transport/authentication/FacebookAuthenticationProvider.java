/*
 * Copyright [2009] [Kadir PEKEL]
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.corporate.transport.authentication;

import java.security.Principal;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.corporate.transport.ldap.LDAPAuthentication;
import com.mysql.jdbc.Driver;
import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.UserUpdated;

public class FacebookAuthenticationProvider implements AuthenticationProvider {

	
	@Autowired
	TransportServiceUpdated transportService=null;

	public TransportServiceUpdated getTransportService() {
		return transportService;
	}

	public void setTransportService(TransportServiceUpdated transportService) {
		this.transportService = transportService;
	}

	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {


		System.out.println("FacebookAuthenticationProvider.authenticate()");

		UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) authentication;

		String username = auth.getName();
		String password = (String)auth.getCredentials();

		//System.out.println(username + "   " + password);

		UserUpdated user = null;

		int status=-1;

		//TEST		
		try{
			System.out.println("GOING FOR VALIDATION");
			LDAPAuthentication ldap = new LDAPAuthentication();
			status = ldap.authenticate(username, password);

			System.out.println("GOING FOR VALIDATION STATUS:"+status);
			status=1;
			if(status==1){
				List<GrantedAuthority> grantedAuthoritiesList = new ArrayList<GrantedAuthority>();

				if(username!=null && (username.equals("patel286@avaya.com"))){
					grantedAuthoritiesList.add(new GrantedAuthorityImpl("ROLE_ADMIN"));	
				}else{
					grantedAuthoritiesList.add(new GrantedAuthorityImpl("ROLE_USER"));
				}

				return new UsernamePasswordAuthenticationToken(username, null, grantedAuthoritiesList);

			}else if(status==0){
				throw new BadCredentialsException("Incorrect Email Id or Password - Jayesh");
				
				 

			}else if(status==2){
				throw new LDAPConnectivityException("There is some error connecting with LDAP");
			}

		}catch (Exception e) {
			e.printStackTrace();
		}

		
		//PRODUCTION		
		/*		try{
			System.out.println("GOING FOR VALIDATION");
			com.corporate.ldap.Authentication ldap = new com.corporate.ldap.Authentication();
			status = ldap.authenticate(username, password);

			System.out.println("GOING FOR VALIDATION STATUS:"+status);
			if(status==1){
				List<GrantedAuthority> grantedAuthoritiesList = new ArrayList<GrantedAuthority>();

				if(username!=null && username.equals("jayesh.patel")){
					grantedAuthoritiesList.add(new GrantedAuthorityImpl("ROLE_ADMIN"));	
				}else{
					grantedAuthoritiesList.add(new GrantedAuthorityImpl("ROLE_USER"));
				}

				return new UsernamePasswordAuthenticationToken(username, null, grantedAuthoritiesList);

			}else if(status==0){
				throw new BadCredentialsException("Incorrect Email Id or Password.");

			}else if(status==2){
				throw new LDAPConnectivityException("There is some error connecting with LDAP");
			}

		}catch (Exception e) {
			e.printStackTrace();
		}*/

		return null;


	}

//	public boolean supports(Class<? extends Object> authentication) {
//		boolean supports = true;
//		return supports;
//	}
	
    @Override
    public boolean supports(Class<? extends Object> authentication) {
    	System.out.println("INSIDE SUPPORT :"+(UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication)));
        return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
    }


}