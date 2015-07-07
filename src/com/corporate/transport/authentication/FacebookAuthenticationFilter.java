package com.corporate.transport.authentication;
///*
// * Copyright [2009] [Kadir PEKEL]
// * 
// * Licensed under the Apache License, Version 2.0 (the "License");
// * you may not use this file except in compliance with the License.
// * You may obtain a copy of the License at
// * 
// * http://www.apache.org/licenses/LICENSE-2.0
// * 
// * Unless required by applicable law or agreed to in writing, software
// * distributed under the License is distributed on an "AS IS" BASIS,
// * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// * See the License for the specific language governing permissions and
// * limitations under the License.
// */
//
//package com.corporate.transport.authentication;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.HashSet;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Map;
//import java.util.Set;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpUtils;
//
//import org.springframework.beans.BeansException;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.ApplicationContextAware;
//import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
//import org.springframework.security.authentication.encoding.PasswordEncoder;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.GrantedAuthorityImpl;
//import org.springframework.security.core.context.SecurityContext;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
//
//
//import com.corporate.transport.backend.TransportServiceUpdated;
//import com.corporate.transport.dto.updated.Role;
//import com.corporate.transport.dto.updated.Status;
//import com.corporate.transport.dto.updated.UserUpdated;
//
//public class FacebookAuthenticationFilter extends AbstractAuthenticationProcessingFilter implements ApplicationContextAware {
//
//	@Autowired
//	TransportServiceUpdated transportService=null;
//
//
//	public TransportServiceUpdated getTransportService() {
//		return transportService;
//	}
//
//	public void setTransportService(TransportServiceUpdated transportService) {
//		this.transportService = transportService;
//	}
//
//	
//	public static final String DEFAULT_FILTER_PROCESS_URL = "/j_spring_facebook_security_check";
//
//	private ApplicationContext ctx;
//	protected FacebookAuthenticationFilter() {
//		super(DEFAULT_FILTER_PROCESS_URL);
//	}
//
//	public Authentication attemptAuthentication(HttpServletRequest req,
//			HttpServletResponse res) throws AuthenticationException,
//			IOException, ServletException {
//
//
//		HttpServletRequest request = (HttpServletRequest) req;
//
//		String userName = request.getParameter("j_username");
//		String userPassword = request.getParameter("j_password");
//
//		
//		System.out.println("Username and pswd is :"+userName + " " + userPassword);
//		System.out.println("SYS PATH :"+System.getenv("MC_ENV_PATH"));
//
//		UserUpdated user = null;
//		
//		try{
//			com.corporate.ldap.Authentication  auth = new com.corporate.ldap.Authentication();
//
//			int status = auth.authenticate(userName, userPassword);
//			
//			//int status=2;
//			if(status==1){
//				
//				user = transportService.getUserByEmailId(userName);
//				
//				if(user == null){
//					//ADD USER IN DB
//					
//					UserUpdated tempUser = new UserUpdated();
//					tempUser.setUserName("dummy");
//					
//					PasswordEncoder encoder = new Md5PasswordEncoder();
//				    String hashedPass = encoder.encodePassword(userPassword, null);
//				    tempUser.setPassword(hashedPass);
//				    
//					tempUser.setEmailId(userName);
//					
//					Role role = transportService.getRoleByRoleName("ROLE_USER");
//					tempUser.setRole(role);
//					
//					Status tempStatus = transportService.getStatusByName("ACTIVE");
//					tempUser.setStatus(tempStatus);
//					
//					boolean userSaveStatus = transportService.saveUser(tempUser);
//					
//					if(userSaveStatus){
//					
//						user = transportService.getUserByEmailId(userName);
//						
//					}else{
//						logger.error("Not able to Save user");
//					}					
//				}
//				
//			}else{
//				throw new UsernameNotFoundException("Incorrect Email Id or Password.");
//			}
//			
//			System.out.println("status is :"+status);
//		}catch (Exception e) {
//			System.out.println("Exception is "+e.getMessage());
//			e.printStackTrace();
//			return null;
//		}
//
//		System.out.println("FacebookAuthenticationFilter.attemptAuthentication() :"+userName + " " + userPassword);		
//
//		
////		Permission permission = new Permission();
////		permission.setPermissionId(1);
////		permission.setPermissionName("CORPORATE_AD_USER");
////
////		Set<Permission> permissionSet = new HashSet<Permission>();
////		permissionSet.add(permission);
////
////		System.out.println("SET OF PERMISSION :"+permissionSet);
////
////		Iterator<Permission> iterator = (Iterator<Permission>)permissionSet.iterator();
////
////		List<GrantedAuthority> grantedAuthoritiesList = new ArrayList<GrantedAuthority>();
////		while (iterator.hasNext()) {
////
////			Permission permissionTemp = iterator.next();	
////			System.out.println("pemrission :" + permissionTemp.getPermissionName());
////			grantedAuthoritiesList.add(new GrantedAuthorityImpl(permissionTemp.getPermissionName()));	
////		}
////		
//		UsernamePasswordAuthenticationToken upatToken = new UsernamePasswordAuthenticationToken(userName, userPassword);
//		AuthenticationManager authenticationManager = getAuthenticationManager();
//		Authentication auth = authenticationManager.authenticate(upatToken);
//		
//		return auth;
//	}
//
//	public void setApplicationContext(ApplicationContext ctx)
//			throws BeansException {
//		this.ctx = ctx;
//	}
//
//
//}