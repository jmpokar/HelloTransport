package com.corporate.carpool.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

@Controller
public class EmailSender {
	
	public static final Log logger = LogFactory.getLog(EmailSender.class);
	
	private String smtpHost;
	
	private String mailFrom = null;
	
	
	Properties smtpProps = null;
	
	boolean debug = false;
	
	private String mailBodyForForgotPassword = null;
	
	private String mailSubjectForForgotPassword = null;
	
	public String getSmtpHost() {
		return smtpHost;
	}


	public String getMailFrom() {
		return mailFrom;
	}

	public void setMailFrom(String mailFrom) {
		this.mailFrom = mailFrom;
	}

	public String getMailBodyForForgotPassword() {
		return mailBodyForForgotPassword;
	}

	public void setMailBodyForForgotPassword(String mailBodyForForgotPassword) {
		this.mailBodyForForgotPassword = mailBodyForForgotPassword;
	}

	public String getMailSubjectForForgotPassword() {
		return mailSubjectForForgotPassword;
	}

	public void setMailSubjectForForgotPassword(String mailSubjectForForgotPassword) {
		this.mailSubjectForForgotPassword = mailSubjectForForgotPassword;
	}

	public void init(){
		smtpProps = new Properties();
		
		logger.debug("SMTP HOST :"+smtpHost);
		
		smtpProps.put("mail.smtp.host", smtpHost);
	    smtpProps.put("mail.transport.protocol", "smtp");
	    debug = false;
	}
	
	 public void postMailForgotPassword(String[] recipients, String mailSubject, 
			 String mailBody){
		 
		
		 logger.debug("SMTP HOST is :"+smtpHost);
			
		 if(logger.isDebugEnabled()) logger.debug("Entered postMailForgotPassword() with : " 
				 + recipients[0] + ", " + mailSubject + ", " + mailBody);
		 
		 init();
		 
		 logger.debug("SMTP Host :"+smtpProps.getProperty("mail.smtp.host"));
		 Session session = Session.getDefaultInstance(smtpProps, null);
		 session.setDebug(debug);
		 
		 Message msg = new MimeMessage(session);
		 try{
		      InternetAddress addressFrom = new InternetAddress(mailFrom);
		      msg.setFrom(addressFrom);

		      InternetAddress[] addressTo = new InternetAddress[recipients.length];
		      for (int i = 0; i < recipients.length; i++){
		        addressTo[i] = new InternetAddress(recipients[i]);
		      }
		      msg.setRecipients(Message.RecipientType.TO, addressTo);

		      msg.addHeader("MyHeaderName", "myHeaderValue");

		      msg.setSubject(mailSubject);
		      msg.setContent(mailBody, "text/plain");
		      logger.info("Going to post forgot password mail to -> " + addressTo[0]);
		      Transport.send(msg);
		      
		 }
		 catch (MessagingException me) {
			 logger.info("Error while sending ForgotPassword mail :: " + me
					 + " *** mail Subject :: " + mailSubject
					 + " *** mail Body :: " + mailBody
					 + " *** mail Receipent :: " + recipients[0]);
			 me.printStackTrace();
		 }
	 }

		 
	 public static void main(String[] args) {
		 System.out.println("Initialing bean factory");
		 String [] contextArray = {"cm-core-application-context.xml", "cm-backend-application-context.xml"};
		 BeanFactory beanFactory = 
			 new ClassPathXmlApplicationContext(contextArray);
		 EmailSender emailSender = (EmailSender) beanFactory.getBean("emailSender");
		 System.out.println(emailSender.getSmtpHost());
	 }
	
	
}
