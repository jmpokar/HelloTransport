package com.corporate.carpool.email;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

import com.corporate.carpool.util.PropertiesUtil;
import com.corporate.carpooldb.dto.User;

@Controller
public class CorporateSMTPEmailSender {

	public static final Log logger = LogFactory.getLog(CorporateSMTPEmailSender.class);

	private String mailFrom = null;
	private String mailBody = null;
	private String mailSubject = null;
	private String[] recipients=null;
	private User userWithResetPasswordToSave=null;
	private String oldPassword=null;

	private PropertiesUtil propertiesUtil=null;
	private Properties smtpProps=null;
	private Email email;

	private String pathOfHeaderSnapInsideEmail;
	private String pathOfFooterSnapInsideEmail;
	private String pathOfSideBar;
	private int criteria;
	
	
	public int getCriteria() {
		return criteria;
	}

	public void setCriteria(int criteria) {
		this.criteria = criteria;
	}

	public String getPathOfSideBar() {
		return pathOfSideBar;
	}

	public void setPathOfSideBar(String pathOfSideBar) {
		this.pathOfSideBar = pathOfSideBar;
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

	public CorporateSMTPEmailSender(){}	

	public CorporateSMTPEmailSender(User userWithResetPasswordToSave, String oldPassword, String[] recipients, String mailFrom, String mailSubject, String mailBody, Email email){
		this.userWithResetPasswordToSave=userWithResetPasswordToSave;
		this.oldPassword=oldPassword;
		this.recipients=recipients;
		this.mailFrom=mailFrom;	
		this.mailSubject=mailSubject;
		this.mailBody=mailBody;
		this.email=email;


		propertiesUtil=new PropertiesUtil();
		smtpProps = new Properties();
		smtpProps.put("mail.smtp.host", propertiesUtil.getValueOfKeyProvided("carpool.email.smtp.corporate.host"));
		smtpProps.put("mail.transport.protocol", propertiesUtil.getValueOfKeyProvided("carpool.email.corporate.transport.protocol"));
	}

	public void sendEmail(){

		logger.debug("Going to send mail now with : " + recipients[0] + ", " + mailSubject + ", " + mailBody);

		Session session = Session.getDefaultInstance(smtpProps, null);
		session.setDebug(true);


		try {	 
			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(propertiesUtil.getValueOfKeyProvided("carpool.email.sender.mail.id")));

			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(recipients[0]));
			message.setSubject(mailSubject);


			String myMailBody ="";

			//FOR HEADER IMAGE
			myMailBody = myMailBody + " <center> ";
			
			myMailBody = myMailBody + " <table width=\"60%\" border=\"0\"> ";
			myMailBody = myMailBody + " <tr> ";
			myMailBody = myMailBody + " <td><img src='cid:image_cid1'></td> ";
			myMailBody = myMailBody + " </tr> ";
			myMailBody = myMailBody + " </table> ";

			//FOR BODY
			myMailBody = myMailBody + " <table width=\"60%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> ";

			myMailBody = myMailBody + " <tr> ";
			myMailBody = myMailBody + " <td rowspan=\"2\"><img src='cid:image_cid3'></td> ";
			myMailBody = myMailBody + " <td></td> ";
			myMailBody = myMailBody + " <td rowspan=\"2\"><img src='cid:image_cid3'></td> ";
			myMailBody = myMailBody + " </tr> ";

			myMailBody = myMailBody + " <tr> ";
			myMailBody = myMailBody + " <td> " + mailBody + " </td> ";
			myMailBody = myMailBody + " </tr> ";

			myMailBody = myMailBody + " </table> ";


			//FOR FOOTER IMAGE
			myMailBody = myMailBody + " <table width=\"60%\" border=\"0\"> ";
			myMailBody = myMailBody + " <tr> ";
			myMailBody = myMailBody + " <td><img src='cid:image_cid2'></td> ";
			myMailBody = myMailBody + " </tr> ";
			myMailBody = myMailBody + " </table> ";

			myMailBody = myMailBody + " </center> ";
			

			Multipart multiPart = new MimeMultipart();  

			MimeBodyPart messageText = new MimeBodyPart();  
			messageText.setContent(myMailBody, "text/html");  

			multiPart.addBodyPart(messageText);  

			if(getPathOfHeaderSnapInsideEmail()!=null){
				MimeBodyPart mbp2 = new MimeBodyPart();
				DataSource source = new FileDataSource(new File(getPathOfHeaderSnapInsideEmail()));
				mbp2.setDataHandler(new DataHandler(source));
				mbp2.setFileName("image.jpg");
				mbp2.setHeader("Content-ID", "<image_cid1>"); // cid:image_cid
				multiPart.addBodyPart(mbp2);  
			}

			if(getPathOfFooterSnapInsideEmail()!=null){
				MimeBodyPart mbp3 = new MimeBodyPart();

				DataSource source1 = new FileDataSource(new File(getPathOfFooterSnapInsideEmail()));
				mbp3.setDataHandler(new DataHandler(source1));
				mbp3.setFileName("image1.png");
				mbp3.setHeader("Content-ID", "<image_cid2>"); // cid:image_cid
				multiPart.addBodyPart(mbp3);  
			}

			if(getPathOfSideBar()!=null){
				MimeBodyPart sideBarLeft = new MimeBodyPart();

				DataSource sideBarSourceLeft = new FileDataSource(new File(getPathOfSideBar()));
				sideBarLeft.setDataHandler(new DataHandler(sideBarSourceLeft));
				sideBarLeft.setFileName("image1.png");
				sideBarLeft.setHeader("Content-ID", "<image_cid3>"); // cid:image_cid
				multiPart.addBodyPart(sideBarLeft); 

//				MimeBodyPart sideBarRight = new MimeBodyPart();
//				DataSource sideBarSourceRight = new FileDataSource(new File(getPathOfSideBar()));
//				sideBarRight.setDataHandler(new DataHandler(sideBarSourceRight));
//				sideBarRight.setFileName("image1.png");
//				sideBarRight.setHeader("Content-ID", "<image_cid4>"); // cid:image_cid
//				multiPart.addBodyPart(sideBarRight); 

			}

			message.setContent(multiPart);  

			Transport.send(message);

			email.emailSentSuccessfully(userWithResetPasswordToSave, criteria);


		} catch (MessagingException e) {
			logger.error("Error while sending ForgotPassword mail :" +e.getMessage());
			userWithResetPasswordToSave.setPassword(oldPassword);
			email.emailSentFailure(userWithResetPasswordToSave, criteria);
			e.printStackTrace();
		}

	}

}
