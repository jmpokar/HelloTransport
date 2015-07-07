package com.corporate.carpool.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.carpool.email.Email;
import com.corporate.carpool.email.CorporateSMTPEmailSender;
import com.corporate.carpool.email.GmailSMTPEmailSender;
import com.corporate.carpool.util.CarpoolConstants;
import com.corporate.carpool.util.CarpoolUtility;
import com.corporate.carpool.util.GenerateRandomPassword;
import com.corporate.carpool.util.PropertiesUtil;
import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.Address;
import com.corporate.carpooldb.dto.Role;
import com.corporate.carpooldb.dto.Status;
import com.corporate.carpooldb.dto.User;

@Controller("UserController")
@RequestMapping("/carpool/user")
public class UserController implements Email, HandlerExceptionResolver{

	Logger log = Logger.getLogger(UserController.class);
	private String emailSendNotificationMessage=null;

	@Autowired
	CarpoolService carpoolService=null;

	private PropertiesUtil propertiesUtil=null;

	public UserController() {
		propertiesUtil = new PropertiesUtil();
	}

	@RequestMapping(value = "/register.jsp")
	public String getUserRegistrationPage(Model model){
		log.debug("Request received to display Register Page");
		User user = new User();
		user.setGender(1);
		model.addAttribute("User", user);
		return "viewsCarpool/register";
	}

	@RequestMapping(value = "/submitRegisterPage.jsp")
	public ModelAndView getRegisterPage(@ModelAttribute User userRegistrationData, HttpServletRequest request, Model model, @RequestParam("file") MultipartFile file){
		log.debug("Request received to save user registeration Data");
		ModelAndView modelAndView = new ModelAndView("redirect:/index.jsp");

		log.debug("Checking if user with same is present or not");
		//	User user = carpoolService.getUserByUserName(userRegistrationData.getUserName());
		User user = carpoolService.getUserByEmailId(userRegistrationData.getEmailId());

		if(user!=null){
			log.debug("user with same email id is already present.");			
			modelAndView.addObject("userAddStatus", "Email Id already registered with us, please select different email id.");
			return modelAndView;
		}


		log.debug("Checking if file is empty");
		if (!file.isEmpty()) {
			log.debug("file is not empty hence working on it.");
			try{

				byte[] bytes = file.getBytes();

				log.debug("checking file bytes is null or file size is 0.");
				if (bytes != null && bytes.length > 0) {
					log.debug("file bytes is not null.");

					log.debug("Constructing target file path for profile image having MIME Type :"+file.getContentType());
					String imageExtension=null;

					if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_PNG)){
						imageExtension = "png";
					}
					else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_GIF)){
						imageExtension = "gif";
					}
					else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_JPEG)){
						imageExtension = "jpeg";
					}
					else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_JPG)){
						imageExtension = "jpg";
					}
					
					else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_PNG)){
						imageExtension = "PNG";
					}
					else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_GIF)){
						imageExtension = "GIF";
					}
					else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_JPEG)){
						imageExtension = "JPEG";
					}
					else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_JPG)){
						imageExtension = "JPG";
					}
					
					

					String profilePicUploadFolderPath = propertiesUtil.getValueOfKeyProvided("user.profile.pic.base.folder");
					String targetFileName = CarpoolUtility.constructTargetFileName(userRegistrationData.getEmailId(), imageExtension);	
					String tomcatFolder = System.getProperty("catalina.base");

					log.debug("Path are : "+ profilePicUploadFolderPath + " , targetFileName : "+targetFileName + " , tomcatFolder : "+ tomcatFolder);

					String finalProfilePicPath = tomcatFolder + profilePicUploadFolderPath + targetFileName;

					log.debug("Final Absolute Path of Image is :"+finalProfilePicPath);


					String contextPath12 = request.getSession().getServletContext().getRealPath("");

					log.debug("Context Path is :"+contextPath12);

					File f = new File(contextPath12);
					log.debug("P! :"+ f.getParent());

					log.debug("FIN PATH TO CREATE IS :"+ f.getParent()+ File.separator + "images");

					File yF = new File(f.getParent()+ File.separator + "images");

					if(yF!=null && !yF.exists()){

						if(yF.mkdir()){
							yF.setWritable(true);
							log.debug("created");
						}else{
							log.debug("cant make");
						}

					}

					File f2 = new File(f.getParent()+ File.separator +"images"+ File.separator +targetFileName);

					boolean b = f2.createNewFile();
					if(b){
						log.debug("File also created properly");
					}else{
						log.debug("File not created properly");
					}


					log.debug("NEW PATH :"+f2.getPath());


					finalProfilePicPath = f2.getAbsolutePath();


					log.debug("Sending finalProfilePicPath as: "+finalProfilePicPath);

					if(targetFileName!=null){

						CarpoolUtility.copyFile(bytes, finalProfilePicPath, false);

						userRegistrationData.setUserProfilePic(targetFileName);
					}else{
						log.debug("unknown Format is uploaded");
					}

				}else{
					log.debug("Byte is null or byte is corrupted");
				}
			}catch (Exception e) {
				log.debug("INSIDE EXCEPTION :"+e.getMessage());
			}
		} else {
			log.debug("File is not uploaded hence proceeding further with gender pic");
			int gender = userRegistrationData.getGender();
			if(gender == 0) { // 0 for Female | 1 for Male
				userRegistrationData.setUserProfilePic("male.jpg");
			}else{
				userRegistrationData.setUserProfilePic("male.jpg");
			}

		}

		log.debug("Going to fetch role ROLE_USER now");
		Role role = carpoolService.getRoleByRoleName("ROLE_USER");
		log.debug("Role got with object data :"+role);

		userRegistrationData.setRole(role);		
		log.debug("Going to Save User registration Data Now.");


		log.debug("Going to fetch status INACTIVE now");
		Status status = carpoolService.getStatusByName(CarpoolConstants.STATUS_INACTIVE);
		log.debug("Status got with object data :"+status);

		userRegistrationData.setStatus(status);

		//CREATE ACTIVATION LINK
		String activationCode = GenerateRandomPassword.getNext(10);
		log.debug("Activation Link is: "+activationCode);

		userRegistrationData.setActivationLink(activationCode);

		PasswordEncoder encoder = new Md5PasswordEncoder();
	    String hashedPass = encoder.encodePassword(userRegistrationData.getPassword(), null);
	    userRegistrationData.setPassword(hashedPass);
	    
		log.debug("Going to Save User registration Data Now.");
		boolean userSaveStatus = carpoolService.saveUser(userRegistrationData);

		if(userSaveStatus){
			User newlyRegisteredUser = carpoolService.getUserByEmailId(userRegistrationData.getEmailId());

			if(newlyRegisteredUser!=null){

				Long userId = (Long)newlyRegisteredUser.getUserId();
				byte[] encodedUserIdInBytes = Base64.encode(userId.toString().getBytes());
				String encodedUserIdInString =  new String(encodedUserIdInBytes);

				String scheme = request.getScheme();
				String serverName = request.getServerName();
				int portNumber = request.getServerPort();
				String contextPath = request.getContextPath();
				String servletPath = request.getServletPath();
				String pathInfo = request.getPathInfo();
				String query = request.getQueryString();

				log.debug(scheme + " " + serverName + " " + portNumber + " " + contextPath + " " + servletPath + " " + pathInfo + " " + query);

				String finalURL = scheme + "://" + serverName + ":" + portNumber + contextPath + "/" + "jsp/activateUser.jsp?id=" + encodedUserIdInString + "&activationKey="+newlyRegisteredUser.getActivationLink();

				log.debug("Final URL is :"+finalURL);

				HttpSession session = request.getSession();       
				ServletContext sc = session.getServletContext();

				String pathHeader = sc.getRealPath("images"+ File.separator +"carpooler"+ File.separator +"emailHeader.jpg");
				String pathFooter = sc.getRealPath("images"+ File.separator +"carpooler"+ File.separator +"emailFooter.png");
				String pathSideBar = sc.getRealPath("images"+ File.separator +"carpooler"+ File.separator +"emailSideBar.png");


				//sendMailToUser(userRegistrationData.getEmailId(), null, null, pathHeader, pathFooter, newlyRegisteredUser);

				sendMailToUser(userRegistrationData.getEmailId(), null, null, pathHeader, pathFooter, pathSideBar, finalURL, newlyRegisteredUser, CarpoolConstants.EMAIL_FOR_NEW_USER_REGISTERATION);


				modelAndView.addObject("userAddStatus", "We have sent a activation link on your registered email Id, please activate your account by clicking on link.");				
			}else{
				modelAndView.addObject("userAddStatus", "There is some problem while fetching your saved details, Please try again.");
			}	
		}else{
			modelAndView.addObject("userAddStatus", "There is some problem while saving your details, Please try again.");
		}

		
		if(emailSendNotificationMessage!=null){
			modelAndView.addObject("emailSendNotificationMessage", emailSendNotificationMessage);
		}
		return modelAndView;
	}



	@RequestMapping("/profileSettings.jsp")
	public ModelAndView getProfileSettingsPage(Model model, Principal principal){
		ModelAndView modelAndView = new ModelAndView("profileSettings");

		log.debug("Finding currently logged in user.");
		String currentUser = principal.getName();
		log.debug("current logged in user is:"+currentUser);

		log.debug("Fetching user by name");
		//User user = carpoolService.getUserByUserName(currentUser);
		User user = carpoolService.getUserByEmailId(currentUser);
		user.setPassword("");

		log.debug("Received user object having value :"+user);

		model.addAttribute("User", user);
		log.debug("USER DOB IS :" + user.getDob());

		log.debug("Returning from the function");

		return modelAndView;
	}



	private boolean deleteProfileImage(String imageName, HttpServletRequest request){
		log.debug("Request received to check profile image file :"+ imageName + " exist, and if yes the delete it.");
		String profilePicUploadFolderPath = propertiesUtil.getValueOfKeyProvided("user.profile.pic.base.folder");

		String path = profilePicUploadFolderPath + imageName;
		log.debug("Checking Image at path: "+path);

		HttpSession session = request.getSession();       
		ServletContext sc = session.getServletContext();

		String realPathOfUserProfilePic = sc.getRealPath(path);

		String realPathOfUserProfilePic1 = sc.getRealPath("images"+ File.separator +"userProfilePic"+ File.separator +"jay.jpeg");
		String realPathOfUserProfilePic2 = sc.getRealPath(".."+ File.separator +"images"+ File.separator +"userProfilePic"+ File.separator +"jay.jpeg");

		String realPathOfUserProfilePic3 = sc.getRealPath(""+ File.separator +"images"+ File.separator +"userProfilePic"+ File.separator +"jay.jpeg");
		String realPathOfUserProfilePic4 = sc.getRealPath(".."+ File.separator +"images"+ File.separator +"userProfilePic"+ File.separator +"jay.jpeg");


		log.debug("Real Path is :"+realPathOfUserProfilePic);

		log.debug("Real Path is 1:"+realPathOfUserProfilePic1);
		log.debug("Real Path is 2:"+realPathOfUserProfilePic2);
		log.debug("Real Path is 3:"+realPathOfUserProfilePic3);
		log.debug("Real Path is 4:"+realPathOfUserProfilePic4);

		File file = new File(realPathOfUserProfilePic);
		log.debug("File object is :"+file.toString());



		if(file!=null && file.exists()){
			log.debug("File Exist");
			if(!file.delete()){
				log.debug("IMage file is present, but there is some problem deleting file.");
				return false;
			}else{
				log.debug("File Deleted Successfully.");
			}
		}else{
			log.debug("File Not Exist or file object is null.");
		}
		log.debug("Returning from deleting profile image");
		return true;
	}

	@InitBinder
	private void dateBinder(WebDataBinder binder) {


		log.debug("Inisde dataBinder For Date Conversion");
		//The date format to parse or output your dates
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		//Create a new CustomDateEditor
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
		//Register it as custom editor for the Date type
		binder.registerCustomEditor(Date.class, editor);
	}


	@RequestMapping(value = "/updateUserAccountData.jsp")
	public ModelAndView updateUserAccountData(@ModelAttribute User updatedUserAccountData, Model model, Principal principal, HttpServletRequest request){
		log.debug("Request received to save updated user account Data :"+updatedUserAccountData.toString());

		log.debug("Finding currently logged in user.");
		String currentUser = principal.getName();
		log.debug("current logged in user is:"+currentUser);

		log.debug("Fetching user by name");
		User user = carpoolService.getUserByEmailId(currentUser);
		log.debug("Received user object having value :"+user);

		
		/*
		String profilePicUploadFolderPath = propertiesUtil.getValueOfKeyProvided("user.profile.pic.base.folder");
		log.debug("Checking if file is empty");
		if (!file.isEmpty()) {
			log.debug("file is not empty hence working on it.");

			if(user.getUserProfilePic()!=null){
				log.debug("user profile pic is present and goig to delete now :"+user.getUserProfilePic());

				if(deleteProfileImage(user.getUserProfilePic(), request)){
					try {
						byte[] bytes = file.getBytes();

						log.debug("checking file bytes is null or file size is 0.");
						if (bytes != null && bytes.length > 0) {
							log.debug("file bytes is not null.");

							log.debug("Constructing target file path for profile image having MIME Type :"+file.getContentType());
							String imageExtension=null;

							if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_PNG)){
								imageExtension = "png";
							}
							else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_GIF)){
								imageExtension = "gif";
							}
							else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_JPEG)){
								imageExtension = "jpeg";
							}
							else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_JPG)){
								imageExtension = "jpg";
							}

							String targetFileName = CarpoolUtility.constructTargetFileName(user.getEmailId(), imageExtension);	

							log.debug("target file name for profile image is :"+targetFileName);

							if(targetFileName!=null){
								log.debug("known Format is uploaded");

								String pathIs = CarpoolUtility.copyFile(bytes, profilePicUploadFolderPath + targetFileName, false);
								log.debug("Return path after copy is :"+pathIs);

								HttpSession session = request.getSession();       
								ServletContext sc = session.getServletContext();

								String realPathOfUserProfilePic = sc.getRealPath(pathIs);

								log.debug("Real Path is :"+realPathOfUserProfilePic);

								user.setUserProfilePic(targetFileName);

							}else{
								log.debug("target file Name is null");
							}

						}else{
							log.debug("Byte is null or byte is corrupted");
						}

					} catch (FileNotFoundException e) {
						log.error("File Not Found. :"+e.getMessage());
						e.printStackTrace();
					} catch (IOException e) {
						log.error("IO Exception Found. :"+e.getMessage());
						e.printStackTrace();
					}
				}else{
					log.debug("Some Error while deleting already existing image.");
				}
			}
		}else{
			log.debug("File is not uploaded, so no need to do any thing with profile image.");
		}
		
		*/

		user.setPrimaryContactNumber(updatedUserAccountData.getPrimaryContactNumber());
		user.setSecondaryContactNumber(updatedUserAccountData.getSecondaryContactNumber());
		user.setGender(updatedUserAccountData.getGender());
		user.setUserName(updatedUserAccountData.getUserName());

		String dob = request.getParameter("dob");

		if(dob.contains("-")){
			String year = dob.substring(0,4);
			String month = dob.substring(5,7);
			String day = dob.substring(8,dob.length());

			dob = year+"/"+month+"/"+day;
		}

		try{

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd"); 
			Date convertedDate = dateFormat.parse(dob); 

			System.out.println("Converted string to date : " + convertedDate); 

			user.setDob(convertedDate);
		}catch (Exception e) {
			log.error("Exception "+e.getMessage());
		}

		user.getAddress().setSingleAddress(updatedUserAccountData.getAddress().getSingleAddress());

		ModelAndView modelAndView = new ModelAndView("redirect:home.jsp");

		boolean status=false;

		try{
			status = carpoolService.updateUser(user);
		}catch (Exception e) {
			log.debug("Exception occurred while updating user :"+e.getMessage());
			e.printStackTrace();
		}

		if(status){
			modelAndView.addObject("userDataUpdationStatus", "Your Data is updated Successfully.");
		}else{
			modelAndView.addObject("userDataUpdationStatus", "There is technical error while updating your data, PLease try again.");
		}

		log.debug("Request completed to save updated user account Data");
		return modelAndView;
	}

	@RequestMapping(value = "/changePassword.jsp")
	public ModelAndView getChangePasswordPage(@ModelAttribute User user){
		log.debug("Request received to fetch change password Page.");
		return new ModelAndView("changePassword");
	}

	@RequestMapping(value = "/updateUserPassword.jsp")
	public ModelAndView updateUserPassword(@ModelAttribute User user, Principal principal, HttpServletRequest request){
		log.debug("Request received to updated user password.");

		log.debug("Finding currently logged in user.");
		String currentUser = principal.getName();
		log.debug("current logged in user is:"+currentUser);

		log.debug("Fetching user by email id");
		User currentLogInUser = carpoolService.getUserByEmailId(currentUser);

		String notification=null;

		String oldPasswordByUser = request.getParameter("oldPassword");

		log.debug("User Entered old password is :"+oldPasswordByUser);
		log.debug("DB password is :"+currentLogInUser.getPassword());

		if(currentLogInUser.getPassword().equals(oldPasswordByUser)){
			log.debug("Old password entered by user is correct");

			log.debug("New Password given by user to set is :"+user.getPassword());
			currentLogInUser.setPassword(user.getPassword());

			boolean status = carpoolService.updateUser(currentLogInUser);
			if(status){
				log.debug("password updated successfully.");
				notification = "Password Updated Successfully";
			}else{
				log.debug("DB returned false for saving user");
				notification = "Some Technical problem occured while saving your password, Please try again.";
			}	

		}else{
			log.debug("Old passowrd is not matching, so returning back.");
			notification = "Old Password is not matching with our database. If you forgot your password please reset it.";

			ModelAndView modelAndView = new ModelAndView("redirect:/index.jsp");
			modelAndView.addObject("passwordUpdationstatus", notification);

			log.debug("Returning to index page as, user doen't know his old password");
			return modelAndView;
		}

		ModelAndView modelAndView = new ModelAndView("forward:home.jsp");
		modelAndView.addObject("passwordUpdationstatus", notification);

		log.debug("Request completed to update user password.");
		return modelAndView;	

	}


	@RequestMapping(value = "/resetPasswordPageRequest.jsp")
	public ModelAndView getResetPasswordPage(@ModelAttribute User user){
		log.debug("Request received to fetch reset password Page.");
		return new ModelAndView("resetPassword");
	}

	@RequestMapping(value = "/resetUserPassword.jsp")
	public ModelAndView resetUserPassword(@ModelAttribute User user, Principal principal, HttpServletRequest request){
		log.debug("Request received to reset user password.");

		ModelAndView modelAndView = new ModelAndView("redirect:/index.jsp");

		log.debug("Email id is: :"+user.getEmailId());

		log.debug("Checking Email ID exist in our DB.");
		User userInDB = carpoolService.getUserByEmailId(user.getEmailId());

		HttpSession session = request.getSession();       
		ServletContext sc = session.getServletContext();

		String pathHeader = sc.getRealPath("images"+ File.separator +"carpooler"+ File.separator +"emailHeader.jpg");
		String pathFooter = sc.getRealPath("images"+ File.separator +"carpooler"+ File.separator +"emailFooter.png");
		String pathSideBar = sc.getRealPath("images"+ File.separator +"carpooler"+ File.separator +"emailSideBar.png");


		String notification=null;
		if(userInDB!=null){
			String oldPassword = userInDB.getPassword();

			String generatedPassword = GenerateRandomPassword.getNext(6);
			
			PasswordEncoder encoder = new Md5PasswordEncoder();
		    String hashedPass = encoder.encodePassword(generatedPassword, null);
		    
			userInDB.setPassword(hashedPass);

			boolean status = carpoolService.updateUser(userInDB);
			if(status){
				sendMailToUser(user.getEmailId(), generatedPassword, oldPassword,  pathHeader, pathFooter, pathSideBar, null, userInDB, CarpoolConstants.EMAIL_FOR_RESET_PASSWORD);
				modelAndView.addObject("passwordUpdationstatus", CarpoolConstants.EMAIL_PASSWORD_RESET_SUCCESS);
			}else{
				modelAndView.addObject("passwordUpdationstatus", "Technical Error While resetting your password, Please try again.");
			}

		}else{
			log.debug("No such email Id registered with us.");
			modelAndView.addObject("passwordUpdationstatus", "No such email Id registered with us.");
			
			log.debug("Returning to index page.");
			return modelAndView;
		}


		if(emailSendNotificationMessage!=null){
			modelAndView.addObject("emailSendNotificationMessage", emailSendNotificationMessage);
		}
		
		log.debug("Request completed to update user password.");
		return modelAndView;	

	}



	/**
	 * This function send a mail to the email id provided.
	 *  
	 * @param username Username to be given inside the mail body.
	 * @param password Password to be given inside the mail body.
	 * @param emailId EmailId to which mail needs to be forwarded as well as email id to be given inside the mail body.
	 * 
	 */
	private void sendMailToUser(String emailId, String password, String oldPassword, String pathHeader, String pathFooter, String pathSideBar, String activationLink, User user, int criteria){
		log.debug("Sending mail to user with email id :"+emailId);

		String mailSubject=null;
		String mailBody=null;
		String mailFrom=null;

		
		if(criteria == CarpoolConstants.EMAIL_FOR_ACTICATION_LINK){
			mailSubject = propertiesUtil.getValueOfKeyProvided("carpool.email.sender.mail.activation.link.mailSubject");
			mailBody = propertiesUtil.getValueOfKeyProvided("carpool.email.sender.mail.activation.link.mailBody");
			mailFrom = propertiesUtil.getValueOfKeyProvided("carpool.email.corporate.mail.from");			

			mailBody = mailBody.replaceAll(CarpoolConstants.EMAIL_ACTIVATION_LINK_PLACEHOLDER, activationLink);

		}else if(criteria == CarpoolConstants.EMAIL_FOR_RESET_PASSWORD){
			mailSubject = propertiesUtil.getValueOfKeyProvided("carpool.email.sender.mail.forgotPassword.mailSubject");
			mailBody = propertiesUtil.getValueOfKeyProvided("carpool.email.sender.mail.forgotPassword.mailBody");
			mailFrom = propertiesUtil.getValueOfKeyProvided("carpool.email.corporate.mail.from");

			mailBody = mailBody.replaceAll(CarpoolConstants.EMAIL_PASSWORD_PLACEHOLDER, password);
		
		}else if(criteria == CarpoolConstants.EMAIL_FOR_NEW_USER_REGISTERATION){
			mailSubject = propertiesUtil.getValueOfKeyProvided("carpool.email.sender.mail.activation.link.mailSubject");
			mailBody = propertiesUtil.getValueOfKeyProvided("carpool.email.sender.mail.activation.link.mailBody");
			mailFrom = propertiesUtil.getValueOfKeyProvided("carpool.email.corporate.mail.from");			

			mailBody = mailBody.replaceAll(CarpoolConstants.EMAIL_ACTIVATION_LINK_PLACEHOLDER, activationLink);			
		}

		log.debug("Mail Subject is :"+mailSubject);
		log.debug("Mail from is :"+mailFrom);
		log.debug("Mail Body is :"+mailBody);

		if(propertiesUtil.getValueOfKeyProvided("carpool.email.using.gmail.enable").equals("true")){
			log.debug("Sending Mail using Gmail host");
			GmailSMTPEmailSender emailSender = new GmailSMTPEmailSender(user, oldPassword, emailId, mailSubject, mailBody, this);
			emailSender.setPathOfHeaderSnapInsideEmail(pathHeader);
			emailSender.setPathOfFooterSnapInsideEmail(pathFooter);
			emailSender.setCriteria(criteria);

			emailSender.sendEmail();

		}else{
			log.debug("Sending Mail using Corporate host");

			String[] recepient = {emailId};
			CorporateSMTPEmailSender emailSender = new CorporateSMTPEmailSender(user, oldPassword, recepient, mailFrom, mailSubject,mailBody, this);
			emailSender.setPathOfHeaderSnapInsideEmail(pathHeader);
			emailSender.setPathOfFooterSnapInsideEmail(pathFooter);
			emailSender.setPathOfSideBar(pathSideBar);
			emailSender.setCriteria(criteria);
			
			emailSender.sendEmail();
		}

		log.debug("Completed Sending of Mail");
	}


	@Override
	public ModelAndView emailSentFailure(User userWhosePassworddetailsToRollback, int criteria) {
		log.debug("Request completed for contacting Carpooler with Failure. :"+userWhosePassworddetailsToRollback + "  " + criteria);

//		if(criteria == CarpoolConstants.EMAIL_FOR_NEW_USER_REGISTERATION){
//			emailSendNotificationMessage=CarpoolConstants.EMAIL_USER_REGISTRATION_EMAIL_SENDING_FAILED;
//			
//		}else{
//			if(userWhosePassworddetailsToRollback!=null){
//				boolean status = carpoolService.updateUser(userWhosePassworddetailsToRollback);
//				if(status){
//					emailSendNotificationMessage=CarpoolConstants.EMAIL_PASSWORD_ROLLBACK_FAILURE_AND_EMAIL_SENDING_FAILED;
//				}else{
//					emailSendNotificationMessage=CarpoolConstants.EMAIL_PASSWORD_ROLLBACK_SUCCESS_AND_EMAIL_SENDING_FAILED;
//				}
//			}
//		}

		if(criteria == CarpoolConstants.EMAIL_FOR_NEW_USER_REGISTERATION){
			emailSendNotificationMessage=CarpoolConstants.EMAIL_USER_REGISTRATION_EMAIL_SENDING_FAILED;
			
		}else if(criteria == CarpoolConstants.EMAIL_FOR_RESET_PASSWORD){
//			if(userWhosePassworddetailsToRollback!=null){
//				boolean status = carpoolService.updateUser(userWhosePassworddetailsToRollback);
//				if(status){
					emailSendNotificationMessage=CarpoolConstants.EMAIL_PASSWORD_ROLLBACK_SUCCESS_AND_EMAIL_SENDING_FAILED;
//				}else{
//					emailSendNotificationMessage=CarpoolConstants.EMAIL_PASSWORD_ROLLBACK_SUCCESS_AND_EMAIL_SENDING_FAILED;
//				}
//			}
		
		}else if(criteria == CarpoolConstants.EMAIL_FOR_ACTICATION_LINK){
			this.emailSendNotificationMessage=CarpoolConstants.EMAIL_RESENDING_ACTIVATION_LINK_FAILURE;
		}
		
		return null;		
	}

	@Override
	public ModelAndView emailSentSuccessfully(User userWithResetPasswordToSave, int criteria) {
		log.debug("Request completed for contacting Carpooler with Success.");
		
//		if(criteria == CarpoolConstants.EMAIL_FOR_NEW_USER_REGISTERATION){
//			this.emailSendNotificationMessage=CarpoolConstants.EMAIL_USER_REGISTRATION_EMAIL_SENDING_SUCCESS;
//			
//		}else if(criteria == CarpoolConstants.EMAIL_FOR_RESET_PASSWORD){
//			this.emailSendNotificationMessage=CarpoolConstants.EMAIL_PASSWORD_RESET_SUCCESS;
//		
//		}else if(criteria == CarpoolConstants.EMAIL_FOR_ACTICATION_LINK){
//			this.emailSendNotificationMessage=CarpoolConstants.EMAIL_RESENDING_ACTIVATION_LINK_SUCCESS;
//		}
		this.emailSendNotificationMessage=null;
		return null;
	}

	@RequestMapping(value = "/activateUser.jsp")
	public ModelAndView activateUser(HttpServletRequest request) {
		log.debug("Request received for activating user.");

		ModelAndView modelAndView = new ModelAndView("redirect:/index.jsp");

		String activationKey = request.getParameter("activationKey");
		String id = request.getParameter("id");

		log.debug("Activation Key is: "+activationKey + ", Id is "+id);

		if(( id!=null && !id.equals("") ) && ( activationKey!=null && !activationKey.equals("") ) ){
			byte[] plainId = Base64.decode(id.getBytes());
			String userId =  new String(plainId);

			log.debug("Decoded user id is "+userId);
			User user = carpoolService.getUserByUserId(userId);
			log.debug("User object is :"+user);

			if(user!=null){

				if(user.getActivationLink().equals(activationKey)){
					Status activeStatus = carpoolService.getStatusByName(CarpoolConstants.STATUS_ACTIVE);
					log.debug("Status object is :"+activeStatus);

					user.setStatus(activeStatus);

					log.debug("Going to save user now.");
					if(carpoolService.updateUser(user)){
						log.debug("user saved successfully.");
						modelAndView.addObject("userActivationStatus", "Your account is activated successfully, Please login and start going green");						
					}else{
						log.debug("user saved successfully.");
						modelAndView.addObject("userActivationStatus", "There is some error while making you active, please try again later");
					}
				}else{
					log.debug("Email ID in the link is broken.");
					modelAndView.addObject("userActivationStatus", "Link is broken or damaged. Please contact admin if it continues.");					
				}
			}else{
				log.debug("User is null");
				modelAndView.addObject("userActivationStatus", "Link is broken or damaged. Please contact admin if it continues.");									
			}

		}else{
			modelAndView.addObject("userActivationStatus", "Link is broken or damaged. Please contact admin if it continues.");
		}

		log.debug("Request completed for activating user.");
		return modelAndView;
	}



	@RequestMapping(value = "/resetActivationLink.jsp")
	public ModelAndView resetActivationLink(HttpServletRequest request){
		log.debug("Request received to reset activation link.");
		ModelAndView modelAndView = new ModelAndView("redirect:/index.jsp");

		log.debug("Checking if user with same email Id present or not");
		//	User user = carpoolService.getUserByUserName(userRegistrationData.getUserName());
		User user = carpoolService.getUserByEmailId(request.getParameter("emailId"));

		if(user==null){
			log.debug("User with email Id "+ request.getParameter("emailId") + " is not yet registerd with us.");			
			modelAndView.addObject("resetActivationLinkStatus", "User with email Id "+ request.getParameter("emailId") + " is not yet registerd with us.");
			return modelAndView;
		}


		//CREATE ACTIVATION LINK
		String activationCode = GenerateRandomPassword.getNext(10);
		log.debug("Activation Link is: "+activationCode);

		user.setActivationLink(activationCode);

		log.debug("Going to update User with new Activation Link.");
		boolean userSaveStatus = carpoolService.updateUser(user);

		if(userSaveStatus){
			User newlyRegisteredUser = carpoolService.getUserByEmailId(user.getEmailId());

			if(newlyRegisteredUser!=null){

				Long userId = (Long)newlyRegisteredUser.getUserId();
				byte[] encodedUserIdInBytes = Base64.encode(userId.toString().getBytes());
				String encodedUserIdInString =  new String(encodedUserIdInBytes);

				String scheme = request.getScheme();
				String serverName = request.getServerName();
				int portNumber = request.getServerPort();
				String contextPath = request.getContextPath();
				String servletPath = request.getServletPath();
				String pathInfo = request.getPathInfo();
				String query = request.getQueryString();

				log.debug(scheme + " " + serverName + " " + portNumber + " " + contextPath + " " + servletPath + " " + pathInfo + " " + query);

				String finalURL = scheme + "://" + serverName + ":" + portNumber + contextPath + "/" + "jsp/activateUser.jsp?id=" + encodedUserIdInString + "&activationKey="+newlyRegisteredUser.getActivationLink();

				log.debug("Final URL is :"+finalURL);

				HttpSession session = request.getSession();       
				ServletContext sc = session.getServletContext();

				String pathHeader = sc.getRealPath("images"+ File.separator +"carpooler"+ File.separator +"emailHeader.jpg");
				String pathFooter = sc.getRealPath("images"+ File.separator +"carpooler"+ File.separator +"emailFooter.png");
				String pathSideBar = sc.getRealPath("images"+ File.separator +"carpooler"+ File.separator +"emailSideBar.png");

				sendMailToUser(newlyRegisteredUser.getEmailId(), null, null, pathHeader, pathFooter, pathSideBar, finalURL, newlyRegisteredUser, CarpoolConstants.EMAIL_FOR_ACTICATION_LINK);

				modelAndView.addObject("resetActivationLinkStatus", "We have sent a activation link on your registered email Id, please activate your account by clicking on link.");
			}else{
				modelAndView.addObject("resetActivationLinkStatus", "There is some problem while fetching your saved details, Please try again.");
			}	
		}else{
			modelAndView.addObject("resetActivationLinkStatus", "There is some problem while saving your details, Please try again.");
		}

		if(emailSendNotificationMessage!=null){
			modelAndView.addObject("emailSendNotificationMessage", emailSendNotificationMessage);
		}
		
		return modelAndView;
	}



	@RequestMapping(value = "/resendActivationLinkPage.jsp")
	public String resendActivationLinkPage(){
		log.debug("Request received to fetch reset activation link page.");
		return "resendActivationLink";
	}


	@RequestMapping(value = "/profilePictureSettings.jsp")
	public String profilePictureSettingsPage(Model model, Principal principal){
		log.debug("Request received to fetch profilePictureSettings page.");

		log.debug("Finding currently logged in user.");
		String currentUser = principal.getName();
		log.debug("current logged in user is:"+currentUser);

		log.debug("Fetching user by name");
		User user = carpoolService.getUserByEmailId(currentUser);

		String append = File.separator+"images"+File.separator;
		user.setUserProfilePic(append + user.getUserProfilePic());	

		model.addAttribute("user", user);

		return "profilePictureSettings";
	}


	@RequestMapping(value = "/changeProfilePicture.jsp")
	public ModelAndView submitProfilePicture(Model model, Principal principal, @RequestParam("file") MultipartFile file, HttpServletRequest request){
		log.debug("Request received to fetch profilePictureSettings page.");

		ModelAndView modelAndView = new ModelAndView("redirect:home.jsp");

		log.debug("Finding currently logged in user.");
		String currentUser = principal.getName();
		log.debug("current logged in user is:"+currentUser);

		log.debug("Fetching user by name");
		User user = carpoolService.getUserByEmailId(currentUser);
		log.debug("Fetching user by name completed :"+user);

		boolean deleteStatus=true;

		log.debug("checking if user profile pic contains male.jpg or female.jpg or not. :"+user.getUserProfilePic());
		
		if(!(user.getUserProfilePic().equals("male.jpg") || user.getUserProfilePic().equals("female.jpg"))){
			log.debug("not contains default pic, so user have uploaded image, proceed with deleting earlier one first.");

			String contextPath = request.getSession().getServletContext().getRealPath("");
			File _f1 = new File(contextPath);
			File _f2 = new File(_f1.getParent()+File.separator+"images"+File.separator+user.getUserProfilePic());
			String finalProfilePicPathForDeletion = _f2.getAbsolutePath();

			log.debug("Eastablishing connection with file :"+finalProfilePicPathForDeletion);
			File finalFile = new File(finalProfilePicPathForDeletion);
			log.debug("File object is :"+finalFile);


			if(finalFile!=null && finalFile.exists()){
				//DELETE OLDER IMAGE STARTED
				deleteStatus = finalFile.delete();
				//DELETE OLDER IMAGE ENDED
			}
			log.debug("Older Pic deleted, So uploading new one now.");
		}

		log.debug("Procedding with uploading user profile pic now if deleteStatus is True :"+deleteStatus);

		if(deleteStatus){
			log.debug("Fetching user by email id");
			User user1 = carpoolService.getUserByEmailId(currentUser);

			log.debug("Old Image deleted successfully, Checking if new uploaded file is empty");
			if (!file.isEmpty()) {
				log.debug("file is not empty hence working on it.");
				try{

					byte[] bytes = file.getBytes();

					log.debug("checking file bytes is null or file size is 0.");
					if (bytes != null && bytes.length > 0) {
						log.debug("file bytes is not null.");

						log.debug("Constructing target file path for profile image having MIME Type :"+file.getContentType());
						String imageExtension=null;

						if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_PNG)){
							imageExtension = "png";
						}
						else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_GIF)){
							imageExtension = "gif";
						}
						else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_JPEG)){
							imageExtension = "jpeg";
						}
						else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_JPG)){
							imageExtension = "jpg";
						}

						else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_PNG)){
							imageExtension = "PNG";
						}
						else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_GIF)){
							imageExtension = "GIF";
						}
						else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_JPEG)){
							imageExtension = "JPEG";
						}
						else if(file.getContentType().equals(CarpoolConstants.CONTENT_TYPE_JPG)){
							imageExtension = "JPG";
						}
						

						log.debug("Image extension is :"+imageExtension);

						String profilePicUploadFolderPath = propertiesUtil.getValueOfKeyProvided("user.profile.pic.base.folder");
						String targetFileName = CarpoolUtility.constructTargetFileName(user.getEmailId(), imageExtension);	
						String tomcatFolder = System.getProperty("catalina.base");

						log.debug("Path are : "+ profilePicUploadFolderPath + " , targetFileName : "+targetFileName + " , tomcatFolder : "+ tomcatFolder);

						String finalProfilePicPath = tomcatFolder + profilePicUploadFolderPath + targetFileName;

						log.debug("Final Absolute Path of Image is :"+finalProfilePicPath);


						String contextPath12 = request.getSession().getServletContext().getRealPath("");

						log.debug("Context Path is :"+contextPath12);

						File f = new File(contextPath12);
						log.debug("P! :"+ f.getParent());

						log.debug("FIN PATH TO CREATE IS :"+ f.getParent()+ File.separator +"images");

						File yF = new File(f.getParent()+ File.separator +"images");

						if(yF!=null && !yF.exists()){

							if(yF.mkdir()){
								yF.setWritable(true);
								log.debug("created");
							}else{
								log.debug("cant make");
							}
						}

						File f2 = new File(f.getParent()+File.separator+"images"+File.separator+targetFileName);
						boolean b = f2.createNewFile();
						if(b){
							log.debug("File also created properly");
						}else{
							log.debug("File not created properly");
						}

						log.debug("NEW PATH :"+f2.getPath());

						finalProfilePicPath = f2.getAbsolutePath();

						log.debug("Sending finalProfilePicPath as: "+finalProfilePicPath);
						//log.debug("target file name for profile image is :"+targetFileName);

						if(targetFileName!=null){
							//log.debug("Target File Name is not null :"+(profilePicUploadFolderPath + targetFileName));
							//CarpoolUtility.copyFile(bytes, profilePicUploadFolderPath + targetFileName, false);

							CarpoolUtility.copyFile(bytes, finalProfilePicPath, false);
							user1.setUserProfilePic(targetFileName);

							boolean status = carpoolService.updateUser(user1);
							if(status){
								log.debug("Successfully updated user pic");
								modelAndView.addObject("userProfilePicUpdateStatus", "Your Profile Pic is updated Successfully.");
							}else{
								log.debug("Not successfully updated user pic");
								modelAndView.addObject("userProfilePicUpdateStatus", "There is some error while updating your Profile Pic, please try later");
							}

						}else{
							log.debug("unknown Format is uploaded");
						}

					}else{
						log.debug("Byte is null or byte is corrupted");
						modelAndView.addObject("userProfilePicUpdateStatus", "File is corrupted or is not valid, please try again.");
						return modelAndView;		
					}
				}catch (Exception e) {
					log.debug("INSIDE EXCEPTION :"+e.getMessage());
				}
			}else{
				log.debug("Uploaded file is empty");
				modelAndView.addObject("userProfilePicUpdateStatus", "Empty File is uploaded, Please select valid file.");
				return modelAndView;
			}

		}else{
			modelAndView.addObject("userProfilePicUpdateStatus", "There is some error while deleting your Profile Pic, please try later");
			return modelAndView;
		}

		log.debug("Leaving method.");
		return modelAndView;
	}	



	@RequestMapping(value = "/deleteProfilePicture.jsp")
	public ModelAndView deleteProfilePicture(Principal principal, HttpServletRequest request){
		log.debug("Request received to delete profilePicture.");

		ModelAndView modelAndView = new ModelAndView("redirect:home.jsp");

		log.debug("Finding currently logged in user.");
		String currentUser = principal.getName();
		log.debug("current logged in user is:"+currentUser);

		log.debug("Fetching user by name");
		User user = carpoolService.getUserByEmailId(currentUser);

		String userProfilePic = user.getUserProfilePic();
		log.debug("Current profile pic is: "+userProfilePic);

		//START
		log.debug("Current user profile pic is :"+userProfilePic);
		
		if(userProfilePic!=null && !(userProfilePic.equals("male.jpg") || userProfilePic.equals("female.jpg"))){
			log.debug("User Profile pic is present, So need to delete one first");
			String contextPath12 = request.getSession().getServletContext().getRealPath("");
			File f = new File(contextPath12);
			File f2 = new File(f.getParent()+File.separator+"images"+File.separator+userProfilePic);
			String finalProfilePicPath = f2.getAbsolutePath();

			log.debug("Picking file from location :"+finalProfilePicPath);
			
			File finalFile = new File(finalProfilePicPath);

			log.debug("User Profile pic to delete is present at location :"+finalFile.getAbsolutePath());
			if(finalFile!=null && finalFile.exists()){
				
				log.debug("Final File is present and going for deletion.");
				boolean deleteStatus = finalFile.delete();
				
				log.debug("Final File is deleted with status :"+deleteStatus);
				
				if(deleteStatus){
						
			 		if(user.getGender()==1){
						user.setUserProfilePic("male.jpg");
					}else{
						user.setUserProfilePic("male.jpg");
					}
					
					log.debug("Updating user data data now.");
					boolean status = carpoolService.updateUser(user);
					log.debug("User data update status is :"+status);

					if(status){
						modelAndView.addObject("userProfilePicDeleteStatus", "Your Profile Pic is deleted Successfully.");
					}else{
						modelAndView.addObject("userProfilePicDeleteStatus", "There is some error while deleting your Profile Pic, please try later");
					}
					
					log.debug("Returning from method");
					return modelAndView;
				}else{
					log.debug("Some issue while deleting your pic, please try later");
					modelAndView.addObject("userProfilePicDeleteStatus", "There is some error while deleting your Profile Pic, please try later");
					return modelAndView;
				}
				
			}else{
				log.debug("File doesn't present at location, so setting default pic for user");
				
				user.setUserProfilePic("male.jpg");
				
				log.debug("Updating user data data now.");
				boolean status = carpoolService.updateUser(user);
				log.debug("User data update status is :"+status);

				if(status){
					modelAndView.addObject("userProfilePicDeleteStatus", "Your Profile Pic is deleted Successfully.");
				}else{
					modelAndView.addObject("userProfilePicDeleteStatus", "There is some error while deleting your Profile Pic, please try later");
				}
				
				log.debug("Returning from method by setting default pic for user");
				return modelAndView;
			}

			//END
			
		}else{
			log.debug("User has not uploaded any image yet and contains default image");
			modelAndView.addObject("userProfilePicDeleteStatus", "You have not uploaded any profile pic yet.");
		}

		log.debug("Returning from function");
		return modelAndView;
	}	



	/*** Trap Exceptions during the upload and show errors back in view form ***/
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exception){        
		log.debug("Inisde Multipart Exception :"+exception.getMessage());
		ModelAndView modelAndView = new ModelAndView("redirect:register.jsp");
		User u = new User();
		u.setAddress(new Address());

		
		log.debug("Exception instance of MaxUploadSizeExceededException?  :"+ (exception instanceof MaxUploadSizeExceededException));
		if (exception instanceof MaxUploadSizeExceededException){
			log.debug("Setting message now for displaying to view");
			modelAndView.addObject("errors", "Image size is greater then 2 MB, Please select Image having size less then 2MB");
		}
		modelAndView.addObject("User", u);

		log.debug("Returning from Multipart Exception");

		return modelAndView;
	}



}
