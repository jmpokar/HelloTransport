package com.corporate.carpool.email;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;

import com.corporate.carpool.controller.HomeController;
import com.corporate.carpool.util.PropertiesUtil;
import com.corporate.carpooldb.dto.User;


public class GmailSMTPEmailSender{

	private Logger log = Logger.getLogger(GmailSMTPEmailSender.class);

	private String emailTo=null;
	private String emailSubject=null;
	private String emailBody=null;
	private User userWithResetPasswordToSave;
	private String oldPassword=null;

	private PropertiesUtil propertiesUtil=null;
	private Email email;

	private String pathOfHeaderSnapInsideEmail;
	private String pathOfFooterSnapInsideEmail;
	
	private int criteria;
	
	public int getCriteria() {
		return criteria;
	}

	public void setCriteria(int criteria) {
		this.criteria = criteria;
	}

	public GmailSMTPEmailSender(){}

	public GmailSMTPEmailSender(User userWithResetPasswordToSave, String oldPassword, String emailTo, String emailSubject, String emailBody, Email email) {
		this.userWithResetPasswordToSave=userWithResetPasswordToSave;
		this.oldPassword=oldPassword;
		this.emailTo = emailTo;
		this.emailSubject = emailSubject;
		this.emailBody = emailBody;
		this.email=email;

		propertiesUtil=new PropertiesUtil();
	}


	public String getPathOfHeaderSnapInsideEmail() {
		return pathOfHeaderSnapInsideEmail;
	}

	public void setPathOfHeaderSnapInsideEmail(String pathOfHeaderSnapInsideEmail) {
		this.pathOfHeaderSnapInsideEmail = pathOfHeaderSnapInsideEmail;
	}


	public String getPathOfFooterSnapInsideEmail() {
		return pathOfFooterSnapInsideEmail;
	}

	public void setPathOfFooterSnapInsideEmail(String pathOfFooterSnapInsideEmail) {
		this.pathOfFooterSnapInsideEmail = pathOfFooterSnapInsideEmail;
	}

	public void sendEmail() {
		log.debug("Sending Email...");

		Properties props = new Properties();
		props.put("mail.smtp.host", propertiesUtil.getValueOfKeyProvided("carpool.email.smtp.gmail.host"));
		props.put("mail.smtp.socketFactory.port", propertiesUtil.getValueOfKeyProvided("carpool.email.smtp.gmail.port"));
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(propertiesUtil.getValueOfKeyProvided("carpool.email.sender.mail.id"),propertiesUtil.getValueOfKeyProvided("carpool.email.sender.mail.password"));
			}
		});

		try {	 
			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(propertiesUtil.getValueOfKeyProvided("carpool.email.sender.mail.id")));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(emailTo));
			message.setSubject(emailSubject);

			String bodyText = emailBody + "<p><img src='cid:image_cid'></p>";

			Multipart multiPart = new MimeMultipart();  

			MimeBodyPart messageText = new MimeBodyPart();  
			messageText.setContent(bodyText, "text/html");  
			multiPart.addBodyPart(messageText);  

			
			if(getPathOfHeaderSnapInsideEmail()!=null){
				MimeBodyPart mbp2 = new MimeBodyPart();
				DataSource source = new FileDataSource(new File(getPathOfHeaderSnapInsideEmail()));
				mbp2.setDataHandler(new DataHandler(source));
				mbp2.setFileName("image.jpg");
				mbp2.setHeader("Content-ID", "<image_cid>"); // cid:image_cid
				multiPart.addBodyPart(mbp2);  
			}

			if(getPathOfFooterSnapInsideEmail()!=null){
				MimeBodyPart mbp3 = new MimeBodyPart();

				DataSource source1 = new FileDataSource(new File(getPathOfFooterSnapInsideEmail()));
				mbp3.setDataHandler(new DataHandler(source1));
				mbp3.setFileName("image1.png");
				mbp3.setHeader("Content-ID", "<image_cid1>"); // cid:image_cid
				multiPart.addBodyPart(mbp3);  
			}

			
//			MimeBodyPart mbp2 = new MimeBodyPart();
//			DataSource source = new FileDataSource(new File("D:\\EclipseIndigoWorkspace\\CarpoolUpdated\\WebContent\\images\\corporate\\logo.gif"));
//			mbp2.setDataHandler(new DataHandler(source));
//			mbp2.setFileName("image.png");
//			mbp2.setHeader("Content-ID", "<image_cid>"); // cid:image_cid
//			multiPart.addBodyPart(mbp2);  


			message.setContent(multiPart);  

			Transport.send(message);

			email.emailSentSuccessfully(userWithResetPasswordToSave, criteria);

		} catch (MessagingException e) {
			log.error("Error while sending ForgotPassword mail :" +e.getMessage());
			userWithResetPasswordToSave.setPassword(oldPassword);
			email.emailSentFailure(userWithResetPasswordToSave, criteria);
			e.printStackTrace();
		}

	}


}