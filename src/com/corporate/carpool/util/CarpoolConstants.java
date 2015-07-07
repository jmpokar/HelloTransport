package com.corporate.carpool.util;

public class CarpoolConstants {

	public static String CONTENT_TYPE_PNG = "image/png";
	public static String CONTENT_TYPE_JPG = "image/jpg";
	public static String CONTENT_TYPE_JPEG = "image/jpeg";
	public static String CONTENT_TYPE_GIF = "image/gif";
	
	public static String  EMAIL_USERNAME_PLACEHOLDER= "@USERNAME@";
	public static String EMAIL_PASSWORD_PLACEHOLDER = "@PASSWORD@";

	public static String EMAIL_ACTIVATION_LINK_PLACEHOLDER = "@ACTIVATION_LINK@";
	
	
	
	public static String EMAIL_PASSWORD_ROLLBACK_FAILURE_AND_EMAIL_SENDING_FAILED = "We have updated your password in DB, but there is some problem while sending you mail on your new password details. So please try again.";
	public static String EMAIL_PASSWORD_ROLLBACK_SUCCESS_AND_EMAIL_SENDING_FAILED = "There is some technical problem due to which we are unable to reset your password, Please try again.";
	public static String EMAIL_PASSWORD_RESET_SUCCESS = "Password reset successfully, You will receive email with password details shortly.";
	public static String EMAIL_USER_REGISTRATION_EMAIL_SENDING_FAILED = "We faced some technical issue while sending you mail on Activation Link of your account. <br><br> Please login by using user id and password you have submitted, where you will find an option for resending activation link.";
	public static String EMAIL_USER_REGISTRATION_EMAIL_SENDING_SUCCESS = "We have sent a activation link on your registered email Id, please activate your account by clicking on link.";
	public static String EMAIL_RESENDING_ACTIVATION_LINK_SUCCESS = "We have sent a activation link on your registered email Id, please activate your account by clicking on link.";
	public static String EMAIL_RESENDING_ACTIVATION_LINK_FAILURE = "There is some technical problem while sending you activation link, Please try again.";
	
	
	
	public static int EMAIL_FOR_NEW_USER_REGISTERATION = 0;
	public static int EMAIL_FOR_ACTICATION_LINK = 1;
	public static int EMAIL_FOR_RESET_PASSWORD = 2;
	
	
	public static String STATUS_ACTIVE = "ACTIVE";
	public static String STATUS_INACTIVE = "INACTIVE";
	
	
	//FEEDBACK
	public static int FEEDBACK_PRAISE = 1;
	public static int FEEDBACK_GENERAL_COMMENT = 2;
	public static int FEEDBACK_SUGGESTION = 3;
	public static int FEEDBACK_PROBLEM = 4;
	public static String FEEDBACK_SAVING_SUCCESS = "We received your Feedback. Appreciate your valuable time in giving us Feedback.";
	public static String FEEDBACK_SAVING_FAILURE = "Due to some technical Error, we have not received your feedback. Appreciate your valuable time in giving us Feedback.";
	public static boolean FEEDBACK_INACTIVE = false;
	
	
	public static String CARPOOL_TYPE_PROVIDER = "provider";
	
	
}
