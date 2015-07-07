package com.corporate.carpool.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;


import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;





























import com.corporate.carpool.dto.GoogleAutocompletePrediction;
import com.corporate.carpool.dto.UICarpooler;
import com.corporate.carpool.email.Email;
import com.corporate.carpool.email.GmailSMTPEmailSender;
import com.corporate.carpool.email.CorporateSMTPEmailSender;
import com.corporate.carpool.util.CarpoolConstants;
import com.corporate.carpool.util.GenerateRandomPassword;
import com.corporate.carpool.util.PropertiesUtil;
import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.Address;
import com.corporate.carpooldb.dto.Carpooler;
import com.corporate.carpooldb.dto.CarpoolerPreference;
import com.corporate.carpooldb.dto.FeedbackUpdated;
import com.corporate.carpooldb.dto.SourceToDestinationDetails;
import com.corporate.carpooldb.dto.User;
import com.corporate.carpooldb.dto.UserTestimonial;
import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.PlaceUpdated;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@Controller("carpool")
@RequestMapping("/carpool/dashboard")
public class HomeController implements Email, HandlerExceptionResolver{

	Logger log = Logger.getLogger(HomeController.class);
	private String emailSendNotificationMessage=null;
	
	private PropertiesUtil propertiesUtil=null;


	@Autowired
	private TransportServiceUpdated transportServiceUpdated;

	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}
	
	@Autowired
	CarpoolService carpoolService=null;

	public HomeController() {
		propertiesUtil = new PropertiesUtil();
	}
	
	@RequestMapping(value = "/home")
	public ModelAndView getLoginPage1(HttpServletRequest req, Principal principal){

		String viewName = "viewsCarpool/nonAdminPages/index";
		log.debug("Request came for displaying home page.");
		ModelAndView modelAndView = new ModelAndView(viewName);

		//		log.debug("Fetching list of Top Ten carpooler.");
		//		List<Carpooler> listOfTopTenCarpooler = carpoolService.getTopTenCarpooler();
		//		log.debug("Fetching list of Top Ten carpooler completed.");



		if(principal!=null && principal.getName()!=null){
			log.debug("Finding currently logged in user.");
			String currentUser = principal.getName();
			log.debug("current logged in user is:"+currentUser);

			log.debug("Finding user by user name");
			User user = carpoolService.getUserByEmailId(currentUser);
			log.debug("Received user object :"+user);


			Carpooler carpoolerData = carpoolService.getCarpoolerByUser(user);
			if(carpoolerData!=null && carpoolerData.getListOfSourceToDestinationDetails()!=null && carpoolerData.getListOfSourceToDestinationDetails().size()>0){
				modelAndView.addObject("providingCarpool",true);
			}else{
				modelAndView.addObject("providingCarpool",false);
			}
		}

		//		log.debug("Fetching list of Praise Feedback, to display on home page.");
		//		List<FeedbackUpdated> listOfPraiseFeedback = carpoolService.getFeedbackByType(CarpoolConstants.FEEDBACK_PRAISE);
		//		log.debug("Completed fetching list of Praise Feedback with object value :"+listOfPraiseFeedback);		

		log.debug("Fetching list of Praise Feedback, to display on home page.");
		List<FeedbackUpdated> listOfActivePraiseFeedback = carpoolService.getActiveFeedbackByType(CarpoolConstants.FEEDBACK_PRAISE);
		log.debug("Completed fetching list of Praise Feedback with object value :"+listOfActivePraiseFeedback);	



		log.debug("Fetching list of carpooler, to display on home page.");
		List<Carpooler> listOfAllCarpooler = carpoolService.getAllCarpooler();
		log.debug("Completed fetching list of carpooler with object value :"+listOfAllCarpooler);

		log.debug("Fetching list of all user, to display count on home page.");
		List<User> listOfAllUser= carpoolService.getAllUser();
		log.debug("Completed fetching list of all user with object value :"+listOfAllUser);

		log.info("Adding count of all registered users, so that view can display it.");
		modelAndView.addObject("totalUserCount", listOfAllUser.size());

		log.info("Adding list of testimonial model, so that view can display it.");
		modelAndView.addObject("listOfPraiseFeedback", setCompletePathForUserProfilePicInFeedbackUpdatedList(listOfActivePraiseFeedback,req));

		log.info("Adding list of carpooler model, so that view can display it.");
		modelAndView.addObject("listOfAllCarpooler", setCompletePathForUserProfilePic(listOfAllCarpooler, req));


		if(req.getParameter("dataSavingResult")!=null){
			log.debug("Got dataSavingResult parameter in request, hence setting it to display on View.");
			modelAndView.addObject("dataSavingResult", req.getParameter("dataSavingResult"));
		}

		if(req.getParameter("status")!=null){
			log.debug("Got status parameter in request, hence setting it to display on View.");
			modelAndView.addObject("status", req.getParameter("status"));
		}

		if(req.getParameter("passwordUpdationstatus")!=null){
			log.debug("Got passwordUpdationstatus parameter in request, hence setting it to display on View.");
			modelAndView.addObject("passwordUpdationstatus", req.getParameter("passwordUpdationstatus"));
		}

		if(req.getParameter("userDataUpdationStatus")!=null){
			log.debug("Got userDataUpdationStatus parameter in request, hence setting it to display on View.");
			modelAndView.addObject("userDataUpdationStatus", req.getParameter("userDataUpdationStatuss"));
		}

		if(req.getParameter("updateCarpoolResult")!=null){
			log.debug("Got updateCarpoolResult parameter in request, hence setting it to display on View.");
			modelAndView.addObject("updateCarpoolResult", req.getParameter("updateCarpoolResult"));
		}

		if(req.getParameter("userProfilePicDeleteStatus")!=null){
			log.debug("Got userProfilePicDeleteStatus parameter in request, hence setting it to display on View.");
			modelAndView.addObject("userProfilePicDeleteStatus", req.getParameter("userProfilePicDeleteStatus"));
		}

		if(req.getParameter("userProfilePicUpdateStatus")!=null){
			log.debug("Got userProfilePicUpdateStatus parameter in request, hence setting it to display on View.");
			modelAndView.addObject("userProfilePicUpdateStatus", req.getParameter("userProfilePicUpdateStatus"));
		}

		if(req.getParameter("alreadyProvidingCarpool")!=null){
			log.debug("Got alreadyProvidingCarpool parameter in request, hence setting it to display on View.");
			modelAndView.addObject("alreadyProvidingCarpool", req.getParameter("alreadyProvidingCarpool"));
		}

		if(req.getParameter("feedbackSavingResult")!=null){
			log.debug("Got feedbackSavingResult parameter in request, hence setting it to display on View.");
			modelAndView.addObject("feedbackSavingResult", req.getParameter("feedbackSavingResult"));
		}		

		log.debug("Returning from the function with view name :"+viewName+".jsp");


		return modelAndView;

	}

	private List<Carpooler> setCompletePathForUserProfilePic(List<Carpooler> listOfCarpooler, HttpServletRequest request){
		log.debug("Request received to insert complete path for user profile pic :"+listOfCarpooler.size());

		List<Carpooler> listOfFinalCarpooler = null;
		if(listOfCarpooler!=null){

			String profilePicUploadFolderPath = propertiesUtil.getValueOfKeyProvided("user.profile.pic.base.folder");

			listOfFinalCarpooler = new ArrayList<Carpooler>();
			for (int i = 0; i < listOfCarpooler.size(); i++) {
				Carpooler carpooler = listOfCarpooler.get(i);
				String profilePicName = carpooler.getUser().getUserProfilePic();

				String scheme = request.getScheme();
				String serverName = request.getServerName();
				int portNumber = request.getServerPort();
				String contextPath = request.getContextPath();
				String servletPath = request.getServletPath();
				String pathInfo = request.getPathInfo();
				String query = request.getQueryString();

				System.out.println(scheme + " " + serverName + " " + portNumber + " " + contextPath + " " + servletPath + " " + pathInfo + " " + query);

				//				String finalURL = scheme + "://" + serverName + ":" + portNumber + "/" + profilePicUploadFolderPath + profilePicName;

				String finalURL = scheme + "://" + serverName + ":" + portNumber + File.separator + "images";



				//				String contextPath12 = request.getSession().getServletContext().getRealPath("");

				//				log.debug("Context Path is :"+contextPath12);
				//				
				//				File f = new File(contextPath12);
				//				log.debug("P!@@@ :"+ f.getParent());
				//				
				//				
				//				
				//				File yF = new File(f.getParent()+"\\images");
				//				
				//				
				String append = "/profilePicture/";

				log.debug("FINAL URL IS :"+ append + profilePicName);

				//				File f = new File(finalURL);

				//				if(f.exists()){
				log.debug("File exist");
				//carpooler.getUser().setUserProfilePic(append + profilePicName);
				carpooler.getUser().setUserProfilePic(profilePicName);
				
				//				}else{
				//					log.debug("File doesn't exist");
				//				}


				listOfFinalCarpooler.add(carpooler);
			}
		}

		log.debug("Request completed to insert complete path for user profile pic.");
		return listOfFinalCarpooler;
	}
	
	private List<FeedbackUpdated> setCompletePathForUserProfilePicInFeedbackUpdatedList(List<FeedbackUpdated> listOfFeedbackUpdated, HttpServletRequest req){
		List<FeedbackUpdated> listOfFinalFeedbackUpdated = null;
		if(listOfFeedbackUpdated!=null){

			String profilePicUploadFolderPath = propertiesUtil.getValueOfKeyProvided("user.profile.pic.base.folder");

			String append = File.separator+"images"+File.separator;

			listOfFinalFeedbackUpdated = new ArrayList<FeedbackUpdated>();
			for (int i = 0; i < listOfFeedbackUpdated.size(); i++) {
				FeedbackUpdated feedbackUpdated = listOfFeedbackUpdated.get(i);

				String profilePicName=null;
				if(feedbackUpdated.getUser()!=null && feedbackUpdated.getUser().getUserProfilePic()!=null){
					profilePicName = feedbackUpdated.getUser().getUserProfilePic();
				}else{
					profilePicName = "male.jpg";
					User u = new User();
					feedbackUpdated.setUser(u);

				}

				//feedbackUpdated.getUser().setUserProfilePic(append + profilePicName);
				feedbackUpdated.getUser().setUserProfilePic(profilePicName);
				listOfFinalFeedbackUpdated.add(feedbackUpdated);
			}
		}
		return listOfFinalFeedbackUpdated;
	}
	
	@RequestMapping(value = "/letspoolit.jsp")
	public ModelAndView getLetsPoolPage(Model model, Principal principal, HttpServletRequest request){
		log.debug("You already have pooled, so cannot pool more then once");

		ModelAndView modelAndView = new ModelAndView();

		log.debug("Finding currently logged in user.");
		String currentUser = principal.getName();
		log.debug("current logged in user is:"+currentUser);

		log.debug("Finding user by user name");
		User user = carpoolService.getUserByEmailId(currentUser);
		log.debug("Received user object :"+user);

		Carpooler carpoolerData = carpoolService.getCarpoolerByUser(user);
		if(carpoolerData!=null && carpoolerData.getListOfSourceToDestinationDetails()!=null && carpoolerData.getListOfSourceToDestinationDetails().size()>0){
			log.debug("Already providing carpool.");
			modelAndView.setViewName("redirect:viewsCarpool/nonAdminPages/home");
			modelAndView.addObject("alreadyProvidingCarpool","We found you as a member already going green, <br><br>So any changes to your Carpool details need to be changed under <br>[ My Account --> Carpool Settings link ] ");
		}else{
			log.debug("Not providing carpool.");
			modelAndView.addObject("alreadyProvidingCarpool",false);
			modelAndView.setViewName("viewsCarpool/nonAdminPages/letspool");
			model.addAttribute("LetsPoolIt", new UICarpooler());
		}

		if(request.getParameter("appSelection")!=null){
			modelAndView.addObject("appSelection",request.getParameter("appSelection"));
		}
		
		return modelAndView;
	}

	@RequestMapping(value = "/faq.jsp")
	public String getFAQPage(){
		return "viewsCarpool/nonAdminPages/faq";
	}
	
	@RequestMapping("/profileSettings.jsp")
	public ModelAndView getProfileSettingsPage(Model model, Principal principal){
		ModelAndView modelAndView = new ModelAndView("viewsCarpool/nonAdminPages/profileSettings");

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

	@RequestMapping(value = "/carpoolSettings.jsp")
	public String getCarpoolerSettingsPage(Model model, Principal principal){
		log.debug("request received to display Carpool Settings Page.");

		log.debug("Finding currently logged in user.");
		String currentUser = principal.getName();
		log.debug("current logged in user is:"+currentUser);

		log.debug("Finding user by user name");
		//User user = carpoolService.getUserByUserName(currentUser);
		User user = carpoolService.getUserByEmailId(currentUser);
		log.debug("Received user object :"+user);

		Carpooler carpooler = carpoolService.getCarpoolerByUser(user);

		if(carpooler!=null){
			List<SourceToDestinationDetails> listSourceToDestinationDetails = carpoolService.getSourceTodestinationDetailsByCarpoolerId(carpooler.getCarpoolerId());
			CarpoolerPreference cp = carpoolService.getCarpoolerPreferenceByCarpooler(carpooler);

			log.debug("CARPOOLER  RECEIVED IS :"+carpooler);
			log.debug("LIST OF SOURCE TO DEST RECEIVED IS :"+listSourceToDestinationDetails);
			log.debug("CARPOOLER PREFERENCE RECEIVED IS :"+cp);


			if(listSourceToDestinationDetails!=null && listSourceToDestinationDetails.size()>0 ){
				UICarpooler uiCarpooler = getFilledUICarpooler(carpooler, listSourceToDestinationDetails, cp);
				model.addAttribute("Carpooler", uiCarpooler);
				model.addAttribute("isReturnRouteSame", uiCarpooler.getCarpoolReturnRouteSameOrNot());
				model.addAttribute("isTwoWayRouteCarpooling", uiCarpooler.getCarpoolOneWayOrTwoWay());
			}else{
				model.addAttribute("Carpooler", null);
				model.addAttribute("isReturnRouteSame", null);
				model.addAttribute("isTwoWayRouteCarpooling", null);
			}
		}else{
			model.addAttribute("Carpooler", null);
			model.addAttribute("isReturnRouteSame", null);
			model.addAttribute("isTwoWayRouteCarpooling", null);
		}


		//		boolean isTwoWayRouteCarpooling = true;
		//		boolean isReturnRouteSame = true;
		//
		//		if(carpooler!=null){
		//
		//			model.addAttribute("Carpooler", carpooler);
		//			boolean isTwoWayRouteCarpooling = true;
		//			boolean isReturnRouteSame = true;
		//
		//			if(carpooler.getListOfSourceToDestinationDetails()!=null && carpooler.getListOfSourceToDestinationDetails().size()>=2){
		//
		//				String sourcePlace = carpooler.getListOfSourceToDestinationDetails().get(0).getSourcePlace();
		//				String destinationPlace = carpooler.getListOfSourceToDestinationDetails().get(0).getDestinationPlace();
		//				String inBetweenPlace = carpooler.getListOfSourceToDestinationDetails().get(0).getInBetweenPlaces();
		//
		//				String sourcePlaceReturnRoute = carpooler.getListOfSourceToDestinationDetails().get(1).getSourcePlace();
		//				String destinationPlaceReturnRoute = carpooler.getListOfSourceToDestinationDetails().get(1).getDestinationPlace();
		//				String inBetweenPlaceReturnRoute = carpooler.getListOfSourceToDestinationDetails().get(1).getInBetweenPlaces();
		//
		//				if(sourcePlace.equals(destinationPlaceReturnRoute) && destinationPlace.equals(sourcePlaceReturnRoute)){
		//
		//					String[] splittedInBetweenSource = inBetweenPlace.split("\\"+" --> ");
		//					String[] splittedInBetweenSourceReturn = inBetweenPlaceReturnRoute.split("\\"+" --> ");
		//
		//					log.debug("Splitted splittedInBetweenSource :"+splittedInBetweenSource.toString());
		//					log.debug("Splitted splittedInBetweenSourceReturn :"+splittedInBetweenSourceReturn.toString());
		//
		//					for (int i=0, j=splittedInBetweenSourceReturn.length-1 ; i<splittedInBetweenSource.length && j>=0 ; i++, j--){
		//
		//						log.debug("Data is :"+splittedInBetweenSource[i] + "  " +splittedInBetweenSourceReturn[j]);
		//
		//						if(!splittedInBetweenSource[i].equals(splittedInBetweenSourceReturn[j])){
		//							isReturnRouteSame = false;
		//							break;
		//						}
		//					}
		//
		//				}else{
		//					isReturnRouteSame = false;
		//				}
		//
		//
		//			}else{
		//				isTwoWayRouteCarpooling = false;
		//			}
		//
		//			log.debug("isReturnRouteSame :"+isReturnRouteSame);
		//			log.debug("isTwoWayRouteCarpooling :"+isTwoWayRouteCarpooling);
		//
		//
		//			model.addAttribute("isReturnRouteSame", isReturnRouteSame);
		//			model.addAttribute("isTwoWayRouteCarpooling", isTwoWayRouteCarpooling);
		//			model.addAttribute("Carpooler", carpooler);
		//
		//		}else{
		//			log.debug("Carpooler is null, so no carpooling is found by user.");
		//			model.addAttribute("Carpooler", null);
		//			model.addAttribute("isReturnRouteSame", null);
		//			model.addAttribute("isTwoWayRouteCarpooling", null);
		//		}

		return "viewsCarpool/nonAdminPages/carpoolSettings";
	}

	private UICarpooler getFilledUICarpooler(Carpooler carpooler, List<SourceToDestinationDetails> listSourceToDestinationDetails, CarpoolerPreference cp){
		UICarpooler uiCarpooler = new UICarpooler();


		uiCarpooler.setCarpoolOneWayOrTwoWay("twoWay");
		uiCarpooler.setCarpoolReturnRouteSameOrNot("true");

		//FILL SOURCE TO DESTINATION COMPONENT
		if(listSourceToDestinationDetails.size()>=2){
			SourceToDestinationDetails std = listSourceToDestinationDetails.get(0);

			
			//String jsonSourcePLace = "[" + "{" + "\"" + "id" + "\"" + ":" + "\"" + std.getSourcePlace() + "\"" + "," + "\"" + "name" + "\""  + ":" + "\"" + std.getSourcePlace() + "\"" + "}" + "]"; 
			
						
			uiCarpooler.setSourcePLace(std.getSourcePlace());
			
			uiCarpooler.setInBetweenPLace(std.getInBetweenPlaces());
			uiCarpooler.setDestinationPLace(std.getDestinationPlace());
			uiCarpooler.setSourceLeavingTime(std.getSourceLeavingTime());

			if(std.getCarpoolDate()!=null){
				uiCarpooler.setDateIfCarpoolingOnDates(std.getCarpoolDate().toString());
			}
			uiCarpooler.setDaysIfCarpoolingOnDays(std.getCarpoolOnDays());

			if(std.isAvailability()){
				uiCarpooler.setWantToBeHiddenFromRoute("false");
			}else{
				uiCarpooler.setWantToBeHiddenFromRoute("true");
			}

			SourceToDestinationDetails _std = listSourceToDestinationDetails.get(1);
			uiCarpooler.setSourcePLaceReturn(_std.getSourcePlace());
			uiCarpooler.setInBetweenPLaceReturn(_std.getInBetweenPlaces());
			uiCarpooler.setDestinationPLaceReturn(_std.getDestinationPlace());
			uiCarpooler.setSourceLeavingTimeReturn(_std.getSourceLeavingTime());

			if(_std.getCarpoolDate()!=null){
				uiCarpooler.setDateIfCarpoolingOnDatesReturn(_std.getCarpoolDate().toString());
			}

			if(_std.getCarpoolOnDays()!=null){
				uiCarpooler.setDaysIfCarpoolingOnDays(_std.getCarpoolOnDays());
			}
			
			if(_std.isAvailability()){
				uiCarpooler.setWantToBeHiddenFromRouteReturn("false");
			}else{
				uiCarpooler.setWantToBeHiddenFromRouteReturn("true");
			}


			if(std.getSourcePlace().equals(_std.getDestinationPlace()) && std.getDestinationPlace().equals(_std.getSourcePlace())){
				String[] splittedInBetweenSource = std.getInBetweenPlaces().split("\\"+" --> ");
				String[] splittedInBetweenSourceReturn = _std.getInBetweenPlaces().split("\\"+" --> ");

				log.debug("Splitted splittedInBetweenSource :"+splittedInBetweenSource.toString());
				log.debug("Splitted splittedInBetweenSourceReturn :"+splittedInBetweenSourceReturn.toString());

				for (int i=0, j=splittedInBetweenSourceReturn.length-1 ; i<splittedInBetweenSource.length && j>=0 ; i++, j--){

					log.debug("Data is :"+splittedInBetweenSource[i] + "  " +splittedInBetweenSourceReturn[j]);

					if(!splittedInBetweenSource[i].equals(splittedInBetweenSourceReturn[j])){
						uiCarpooler.setCarpoolReturnRouteSameOrNot("false");
						break;
					}
				}

			}else{
				uiCarpooler.setCarpoolReturnRouteSameOrNot("false");
			}


		}else{
			SourceToDestinationDetails std = listSourceToDestinationDetails.get(0);
			uiCarpooler.setSourcePLace(std.getSourcePlace());
			uiCarpooler.setInBetweenPLace(std.getInBetweenPlaces());
			uiCarpooler.setDestinationPLace(std.getDestinationPlace());
			uiCarpooler.setSourceLeavingTime(std.getSourceLeavingTime());
			
			if(std.getCarpoolDate()!=null){
				uiCarpooler.setDateIfCarpoolingOnDates(std.getCarpoolDate().toString());
			}
			
			if(std.getCarpoolOnDays()!=null){
				uiCarpooler.setDaysIfCarpoolingOnDays(std.getCarpoolOnDays());
			}
			
			uiCarpooler.setCarpoolOneWayOrTwoWay("oneWay");

			if(std.isAvailability()){
				uiCarpooler.setWantToBeHiddenFromRoute("false");
			}else{
				uiCarpooler.setWantToBeHiddenFromRoute("true");
			}

		}


		//FILL CARPOOLER PREFERENCE
		uiCarpooler.setContactPreference(cp.getWayOfContact());
		uiCarpooler.setGenderPreference(cp.getGenderPreference());
		uiCarpooler.setCompensation(cp.getCompensation());

		return uiCarpooler;
	}
	
	

	@RequestMapping(value = "/listInBetweenPlaces.jsp")
	public void getAllInBetweenPlaces(HttpServletRequest request, HttpServletResponse response){
		try{
			
			System.out.println("INSIDE 1");
			String query = (String)request.getParameter("q");
			query = URLEncoder.encode(query, "UTF-8" );

			log.debug("Query formed is :"+query);
			//			https://maps.googleapis.com/maps/api/place/autocomplete/xml?input=mg%20road&types=establishment&location=12.971599,77.594563&radius=50000&sensor=true&key=AIzaSyDFoW0nCb-Zb4tRUifi8mBI11JIphqnKjs			
			String url = "https://maps.googleapis.com/maps/api/place/autocomplete/";
			
			String dataType = "xml";
			//String dataType = "json";
			
			String input = "input="+query;
			String types = "types=geocode";
			String location = "location=12.971599,77.594563";
			String key = "key=AIzaSyDFoW0nCb-Zb4tRUifi8mBI11JIphqnKjs";
			String sensor = "sensor=false";
			String radius = "radius=50000";

			//String finalUrl = url + dataType +"?"+ input + "&" +types + "&" + location + "&" + radius + "&" + sensor + "&" + key;
			String finalUrl = url + dataType +"?"+ input + "&" + types + "&" +location + "&" + radius + "&" + sensor + "&" + key;
			//System.out.println("Final Url is :"+finalUrl);

			
			System.out.println("INSIDE 2");
			
			String gMapAutoCompleteResponse = hitRegisteredDBWithPostDataProvided(finalUrl);
			System.out.println("INSIDE 3");
			
			List<GoogleAutocompletePrediction> listOfGoogleAutocompletePrediction = parseGoogleMapsResponse(gMapAutoCompleteResponse);
			//List<GoogleAutocompletePrediction> listOfGoogleAutocompletePrediction = parseGoogleMapsJSONResponse(gMapAutoCompleteResponse);
			
			System.out.println("INSIDE 4");
			
			List<GoogleAutocompletePrediction> listOfGoogleAutocompletePredictionAfterFilter = filterNonBanagalorePlaces(listOfGoogleAutocompletePrediction);

			System.out.println("INSIDE 5");
			Iterator<GoogleAutocompletePrediction> googleAIterator = listOfGoogleAutocompletePredictionAfterFilter.iterator();
			JSONArray jsonArray = new JSONArray();

			while (googleAIterator.hasNext()) {
				GoogleAutocompletePrediction googleAutocompletePrediction = (GoogleAutocompletePrediction) googleAIterator.next();
				jsonArray.put(getJSONObjectOfPlaceIdAndName(googleAutocompletePrediction.getPlaceName(), googleAutocompletePrediction.getPlaceName()));
				if(jsonArray.length()>=10)
					break;
			}
			
			System.out.println("INSIDE 6");
			
			PrintWriter pw = response.getWriter();
			
			log.debug("FINAL JSON :"+jsonArray.toString());
			
			pw.print(jsonArray.toString());
		} 
		catch(Exception e){ 
			e.printStackTrace(); 
		}
	}
	
	public String hitRegisteredDBWithPostDataProvided(String url){
		// Create an instance of HttpClient.
		HttpClient client = new HttpClient();

		// Create a method instance.
		GetMethod method = new GetMethod(url);

		// Provide custom retry handler is necessary
		method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, 
				new DefaultHttpMethodRetryHandler(3, false));

		try {
			// Execute the method.
			int statusCode = client.executeMethod(method);

			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed: " + method.getStatusLine());
			}

			// Read the response body.
			byte[] responseBody = method.getResponseBody();

			// Deal with the response.
			// Use caution: ensure correct character encoding and is not binary data
			//			System.out.println("Response Body Start");
			//			System.out.println(new String(responseBody));
			//			System.out.println("Response Body End");

			return new String(responseBody);
		} catch (HttpException e) {
			System.err.println("Fatal protocol violation: " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.err.println("Fatal transport error: " + e.getMessage());
			e.printStackTrace();
		} finally {
			// Release the connection.
			method.releaseConnection();
		}
		return null;
	}
	
	
	private List<GoogleAutocompletePrediction> parseGoogleMapsResponse(String response){
		log.debug("Request received for parseGoogleMapsResponse");
		try{	
			List<GoogleAutocompletePrediction> listOfGoogleAutocompletePrediction=new ArrayList<GoogleAutocompletePrediction>();

//			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
//			factory.setNamespaceAware(true);
//			DocumentBuilder builder;
//			Document doc = null;
			XPathExpression expr = null;
//			builder = factory.newDocumentBuilder();

			log.debug("Request received for parseGoogleMapsResponse 1");
			
			/*
			//File file = new File("C:\\Users\\jayesh.patel\\Desktop\\gMapResponse.xml");
			File file = new File(pathofXMLFile);
			
			if(file.exists()){
			//	file.delete();
				FileOutputStream erasor = new FileOutputStream(file, false);
				erasor.write(response.getBytes());
				erasor.close();
			}else{
				if(file.createNewFile()){
					FileOutputStream fos = new FileOutputStream(file);
					fos.write(response.getBytes());
					fos.close();
				}else{
					log.debug("Error while writing to a file");
				}
			}
			//doc = builder.parse("C:\\Users\\jayesh.patel\\Desktop\\gMapResponse.xml");
			*/
			
			//doc = builder.parse(pathofXMLFile);
			
			//log.debug("Request received for parseGoogleMapsResponse 2");
			//doc = builder.parse(response);
			

			log.debug("Request received for parseGoogleMapsResponse 2 "+response);

			Document doc = loadXMLFromString(response);
			
			log.debug("Request received for parseGoogleMapsResponse 3");

			XPathFactory xFactory = XPathFactory.newInstance();
			XPath xpath = xFactory.newXPath();
			expr = xpath.compile("/AutocompletionResponse/prediction");

			log.debug("Request received for parseGoogleMapsResponse 4");
			
			Object result = expr.evaluate(doc, XPathConstants.NODESET);
			NodeList nodes = (NodeList) result;

			NodeList nList = doc.getElementsByTagName("prediction");

			log.debug("Going to prepare List<GoogleAutocompletePrediction> now.");
			for (int temp = 0; temp < nList.getLength(); temp++) {

				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
			//		log.debug("Description tag is :" + getTagValue("description", eElement));

					GoogleAutocompletePrediction googleAutocompletePrediction= new GoogleAutocompletePrediction();
					Map<String, String> hashMapOfTerm = new HashMap<String, String>();

					googleAutocompletePrediction.setPlaceName(getTagValue("description", eElement));

					NodeList nodeList = eElement.getElementsByTagName("term");

					for (int temp1 = 0; temp1 < nodeList.getLength(); temp1++) {

						Node nNode1 = nodeList.item(temp1);
						if (nNode1.getNodeType() == Node.ELEMENT_NODE) {

							Element eElement1 = (Element) nNode1;
//							log.debug("Term Value is :" + getTagValue("value", eElement1));

							hashMapOfTerm.put("term"+temp1, getTagValue("value", eElement1).trim());
						}
					}
					googleAutocompletePrediction.setHashMapOfTerms(hashMapOfTerm);
					listOfGoogleAutocompletePrediction.add(googleAutocompletePrediction);
				}
			}
			return listOfGoogleAutocompletePrediction; 
		}catch (Exception e) {
			e.printStackTrace();
			log.error("Exception occured while reading data");
		}
		return null;
	}

	private static String getTagValue(String sTag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(sTag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		return nValue.getNodeValue();
	}


	private String reverseStringSeperatedByDelimeter(String data, String delimeter){
		log.debug("Request received to reverse the String data :"+data+ " Delimeter given is :"+delimeter);
		String reverseData="";

		String splittedArray[] = data.split("\\"+delimeter);
		for (int i = splittedArray.length-1; i >= 0; i--) {
			reverseData = reverseData + splittedArray[i] + " --> ";
		}

		String finalReversedString = reverseData.substring(0, reverseData.length()-5);

		log.debug("Returning reverse String data :"+finalReversedString);
		return finalReversedString;
	}
	

	public static Document loadXMLFromString(String xml) throws Exception{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		InputSource is = new InputSource(new StringReader(xml));
		return builder.parse(is);
	}
	 
	private JSONObject getJSONObjectOfPlaceIdAndName(String placeId, String placeName){
		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject.put("id", placeId);
			jsonObject.put("name", placeName);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	private List<GoogleAutocompletePrediction> filterNonBanagalorePlaces(List<GoogleAutocompletePrediction> listGoogleAutocompletePrediction){
		log.debug("Request received for filterNonBanagalorePlaces.");
		List<GoogleAutocompletePrediction> finalList = new ArrayList<GoogleAutocompletePrediction>();

		for(int i=0; i<listGoogleAutocompletePrediction.size();i++){
			GoogleAutocompletePrediction g = new GoogleAutocompletePrediction();
			GoogleAutocompletePrediction googleAutocompletePrediction = (GoogleAutocompletePrediction) listGoogleAutocompletePrediction.get(i);
			log.debug("Picking item from list at position :"+i);
			Map<String, String> hashMapOfTerms = googleAutocompletePrediction.getHashMapOfTerms();
			log.debug("Working on map with data :"+ hashMapOfTerms.toString() +" and Terms map size is :"+hashMapOfTerms.size());
			log.debug("Contains value result :"+hashMapOfTerms.containsValue("Bangalore"));

			if(!(hashMapOfTerms.containsValue("Bangalore"))){
				log.debug("City is not Bangalore, So removing it from list at index :"+i);
			}else{
				log.debug("City is Bangalore, So not removing it.");

				String placeName = googleAutocompletePrediction.getPlaceName();
				String finalFromPlace = ""; 

				log.debug("Checking if placeName has String matching with , Bangalore, Karnataka, India "+ placeName.contains(", Bangalore, Karnataka, India"));
				if(placeName.contains(", Bangalore, Karnataka, India")){
					log.debug("Match Found");
					finalFromPlace = placeName.replace(", Bangalore, Karnataka, India", "");
					log.debug("After Removal of unwanted String, Place Name is :"+finalFromPlace);
				}else{
					log.debug("Match Not Found");
				}

				//g.setPlaceName(googleAutocompletePrediction.getPlaceName());
				
				if(finalFromPlace!=null && !finalFromPlace.trim().equals("")){
					g.setPlaceName(finalFromPlace);
				
					g.setHashMapOfTerms(googleAutocompletePrediction.getHashMapOfTerms());
					finalList.add(g);
				}
			}
			log.debug("Completed with item at position :"+i);
		}

		log.debug("Returning back from filterNonBanagalorePlaces with data :"+listGoogleAutocompletePrediction.toString());
		log.debug("Final List data is :");
		for (int i = 0; i < finalList.size(); i++) {
			log.debug("Data is :"+finalList.get(i).getPlaceName());	
		}
		return finalList;
	}
	
	@RequestMapping(value = "/termsAndConditionContent.jsp")
	public ModelAndView getTermsAndConditionContent(HttpServletRequest request, Principal principal){
		log.debug("Request received to fetch T&C page");
		ModelAndView modelAndView = new ModelAndView("viewsCarpool/nonAdminPages/termsAndConditionContent");
		log.debug("Request completed for fetch T&C page");
		return modelAndView;
	}
	
	
	
	@RequestMapping(value = "/changePassword.jsp")
	public ModelAndView getChangePasswordPage(@ModelAttribute User user){
		log.debug("Request received to fetch change password Page.");
		return new ModelAndView("viewsCarpool/nonAdminPages/changePassword");
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

		return "viewsCarpool/nonAdminPages/profilePictureSettings";
	}

	@RequestMapping(value = {"/searchPlaces", "/admin/ae/searchPlaces"})
	public void searchPlaces(HttpServletRequest request, HttpServletResponse response){
		try{

			System.out.println("INSIDE 1");
			String query = (String)request.getParameter("q");
			query = URLEncoder.encode(query, "UTF-8" );
			System.out.println("Query formed is :"+query);

			List<PlaceUpdated> listOfPlaceUpdated = transportServiceUpdated.getAllPlaceMatchingWithGivenWord(query);

			JSONArray jsonArray = new JSONArray();

			for (PlaceUpdated placeUpdated : listOfPlaceUpdated) {
				JSONObject jsonObject = new JSONObject();
				try {
					jsonObject.put("id", placeUpdated.getPlaceId());
					jsonObject.put("name", placeUpdated.getPlaceName());
				} catch (JSONException e) {
					e.printStackTrace();
				}
				jsonArray.put(jsonObject);
			}

			PrintWriter pw = response.getWriter();			
			System.out.println("FINAL JSON :"+jsonArray.toString());
			pw.print(jsonArray.toString());
		} 
		catch(Exception e){ 
			e.printStackTrace(); 
		}
	}


	@RequestMapping(value = "/result.jsp")
	public ModelAndView getResultPage(HttpServletRequest request){
		log.debug("request received to fetch matching carpooler");
		ModelAndView modelAndView = new ModelAndView("viewsCarpool/nonAdminPages/result");

		String fromArea = request.getParameter("searchTextFieldFrom");
		String toArea = request.getParameter("searchTextFieldTo");

		log.debug("Paramater provided are fromArea :"+fromArea + ", toArea : " + toArea);		

		if(fromArea!=null && fromArea.equals(""))
			fromArea=null;

		if(toArea!=null && toArea.equals(""))
			toArea=null;

		List<Carpooler> listOfFinalCarpoolers = new ArrayList<Carpooler>();

		List<List<SourceToDestinationDetails>> listOfAllListOfApproximateMatchSourceToDestDetails=new ArrayList<List<SourceToDestinationDetails>>();
		if((fromArea!=null && !fromArea.equals("")) && (toArea!=null && !toArea.equals("")) ){
			listOfAllListOfApproximateMatchSourceToDestDetails = getListOfAllMatchSourceToDestinationDetailsList(fromArea, true);
			Map<Long, SourceToDestinationDetails> mapOfCarpooler = getMapOfUniqueSourceToDestiantionDetailsFromList(listOfAllListOfApproximateMatchSourceToDestDetails);
			Map<Long, SourceToDestinationDetails> exactMatchMapOfCarpooler = getExactMatchingSourceToDestinationDetailsListFromMap(mapOfCarpooler, toArea);
			listOfFinalCarpoolers = convertMapToListOfCarpooler(exactMatchMapOfCarpooler);

		}else if(fromArea==null && toArea==null){
			listOfFinalCarpoolers = carpoolService.getAllCarpooler();

		}else if(fromArea!=null){
			listOfAllListOfApproximateMatchSourceToDestDetails = getListOfAllMatchSourceToDestinationDetailsList(fromArea, true);
			Map<Long, SourceToDestinationDetails> mapOfCarpooler = getMapOfUniqueSourceToDestiantionDetailsFromList(listOfAllListOfApproximateMatchSourceToDestDetails);

			listOfFinalCarpoolers = convertMapToListOfCarpooler(mapOfCarpooler);

		}else if(toArea!=null){
			listOfAllListOfApproximateMatchSourceToDestDetails = getListOfAllMatchSourceToDestinationDetailsList(toArea, false);
			Map<Long, SourceToDestinationDetails> mapOfCarpooler = getMapOfUniqueSourceToDestiantionDetailsFromList(listOfAllListOfApproximateMatchSourceToDestDetails);

			listOfFinalCarpoolers = convertMapToListOfCarpooler(mapOfCarpooler);
		}

		//NOT USING NOW AS WE ARE DISPLAYING "AVAILABILITY" COLUMN IN RESULTS TABLE.
		/* if(listOfFinalCarpoolers!=null && listOfFinalCarpoolers.size()>0){
			listOfFinalCarpoolers = filterListOfAvailableCarpooler(listOfFinalCarpoolers);
		} */


		List<Carpooler> listOfFinalCarpoolerForUI = setCompletePathForUserProfilePic(listOfFinalCarpoolers, request);

		if(listOfFinalCarpoolerForUI!=null && listOfFinalCarpoolerForUI.size()>0){
			List<UICarpooler> listOfUiCarpoolers = getListOfUICarpooler(listOfFinalCarpoolerForUI);
			modelAndView.addObject("listOfExactMatchCarpooler", listOfUiCarpoolers);
		}else{
			modelAndView.addObject("listOfExactMatchCarpooler", null);
		}

		log.debug("returning to view");
		return modelAndView;
	}

	private List<Carpooler> convertMapToListOfCarpooler(Map<Long, SourceToDestinationDetails> mapOfSourceToDestDetails){
		log.debug("Request received to convert map of SourceToDestDetails to List of Carpooler.");
		List<Carpooler> finalListOfExactMatchCarpooler=null;

		if(mapOfSourceToDestDetails!=null){

			finalListOfExactMatchCarpooler=new ArrayList<Carpooler>();

			Set<Long> keys = mapOfSourceToDestDetails.keySet();
			Iterator<Long> it = keys.iterator();

			while (it.hasNext()) {
				Long key = (Long) it.next();

				log.debug("Working for Source To Destination Id: "+key);
				SourceToDestinationDetails stdDetails = mapOfSourceToDestDetails.get(key);
				List<SourceToDestinationDetails> temp = new ArrayList<SourceToDestinationDetails>();
				temp.add(stdDetails);

				log.debug("Fetching Carpooler by Carpooler id");
				Carpooler c = carpoolService.getCarpoolerByCarpoolerId(stdDetails.getCarpoolerId());
				log.debug("Received Carpooler :"+c);

				//TO take only those carpooler to display on view, who is available and has vaccant seat.
				//if(c!=null && c.isAvailability()){
				//	log.debug("Picking Carpooler ID : "+c.getCarpoolerId()+ " as is not hidden anbd has vaccant seat.");
				c.setListOfSourceToDestinationDetails(temp);
				//}else{
				//	log.debug("Carpooler is either null or is not available");
				//}

				finalListOfExactMatchCarpooler.add(c);
			}		
		}else{
			log.debug("map of source to destination details given is null, hence returning back as null");
		}
		return finalListOfExactMatchCarpooler;
	}


	/**
	 * This function will take List of SourceToDestinationDetails list and iterate through each SourceToDestinationDetails instance present inside the list
	 * and put it inside one map with key as SourceToDestinationDetails ID and value as SourceToDestinationDetails instance.
	 * 
	 * @param listOfAllMatchSourceToDestinationDetailsList
	 * @return Map<Long, SourceToDestinationDetails> map of unique SourceToDestinationDetails.
	 */
	private Map<Long, SourceToDestinationDetails> getMapOfUniqueSourceToDestiantionDetailsFromList(List<List<SourceToDestinationDetails>> listOfAllMatchSourceToDestinationDetailsList){
		Map<Long, SourceToDestinationDetails> mapOfSourceToDestinationDetails=null;

		if(listOfAllMatchSourceToDestinationDetailsList!=null && listOfAllMatchSourceToDestinationDetailsList.size()>0){
			mapOfSourceToDestinationDetails = new HashMap<Long, SourceToDestinationDetails>();

			for (int i = 0; i < listOfAllMatchSourceToDestinationDetailsList.size(); i++) {
				List<SourceToDestinationDetails> listOfSourceToDestDetails = listOfAllMatchSourceToDestinationDetailsList.get(i);
				for (int j = 0; j < listOfSourceToDestDetails.size(); j++) {
					SourceToDestinationDetails stdDetails = listOfSourceToDestDetails.get(j);
					mapOfSourceToDestinationDetails.put(stdDetails.getSourceToDestinationId(), stdDetails);
				}	
			}
		}
		return mapOfSourceToDestinationDetails;
	}

	/**
	 * This function takes one parameter which is a "startingPoint phrase" of user and function break the phrase based on space, and then query for each pieces 
	 * of word in phrase to find out matching words in source_place column and in_between_places column.
	 * so that we will get all the routes that is helpful to searcher who has give us his "startinPoint phrase". 
	 * The list this function will return may contain duplicate SourceToDestinationDetails instance.
	 *  
	 * @param phrase based on which search need to be performed.
	 * @return List<List<SourceToDestinationDetails>> all matching list of "list of SourceToDestinationDetails". 
	 */
	private List<List<SourceToDestinationDetails>> getListOfAllMatchSourceToDestinationDetailsList(String phrase, boolean isFrom){
		List<List<SourceToDestinationDetails>> listOfAllListOfMatchSourceToDestDetails=new ArrayList<List<SourceToDestinationDetails>>();

		StringTokenizer stk = new StringTokenizer(phrase," ");
		while(stk.hasMoreTokens()){
			String token = stk.nextToken();

			List<SourceToDestinationDetails> listOfMatchSourceToDestDetails=null;
			if(isFrom)
				listOfMatchSourceToDestDetails = carpoolService.findMatchingCarpoolerInSourceAndInBetweenPlace(token);
			else
				listOfMatchSourceToDestDetails = carpoolService.findMatchingCarpoolerInDestinationAndInBetweenPlace(token);

			listOfAllListOfMatchSourceToDestDetails.add(listOfMatchSourceToDestDetails);
		}
		return listOfAllListOfMatchSourceToDestDetails;
	}

	/**
	 * This function will take map of SourceToDestinationDetails(This map is extracted and has result matching with user "fromArea" choice), 
	 * So now the task of this function is to pick each instance of SourceToDestinationDetails from map and compare whether it contains keyword matching 
	 * with "toArea" and if it matches then that would be the perfect route which user wants. 
	 * so this function return list of exactMatch SourceToDestinationDetails map which matches for both "fromArea" and "toArea".
	 *   
	 * @param mapOfCarpooler contain SourceToDestinationDetails that is uniquely matched for fromArea. 
	 * @return Map<Long, SourceToDestinationDetails> contain SourceToDestinationDetails that is uniquely matched for fromArea and toArea.
	 */
	private Map<Long, SourceToDestinationDetails> getExactMatchingSourceToDestinationDetailsListFromMap(Map<Long, SourceToDestinationDetails> mapOfCarpooler, String toArea){
		if(mapOfCarpooler!=null){
			Set<Long> keys = mapOfCarpooler.keySet();
			Iterator<Long> it = keys.iterator();

			while (it.hasNext()) {
				Long key = (Long) it.next();
				SourceToDestinationDetails stdDetails = mapOfCarpooler.get(key);
				boolean status = false;
				StringTokenizer stk2 = new StringTokenizer(toArea," ");
				while(stk2.hasMoreTokens()){
					String token2 = stk2.nextToken();
					if(stdDetails.getDestinationPlace().contains(token2) || (stdDetails.getInBetweenPlaces()!=null && stdDetails.getInBetweenPlaces().contains(token2)) ){
						status = true;
						break;
					}
				}
				if(status==false){
					it.remove();
				}
			}
		}
		return mapOfCarpooler;
	}

	private List<UICarpooler> getListOfUICarpooler(List<Carpooler> listOfCarpooler){
		log.debug("Getting list of UI Carpoolers.");
		List<UICarpooler> listOfUICarpoolers = new ArrayList<UICarpooler>();

		for(Carpooler carpooler: listOfCarpooler){

			UICarpooler uiCarpooler = new UICarpooler();	
			uiCarpooler.setCarpoolerId(carpooler.getCarpoolerId());
			uiCarpooler.setNameOfCarpooler(carpooler.getUser().getUserName());
			uiCarpooler.setPhotoOfCarpooler(carpooler.getUser().getUserProfilePic());
			uiCarpooler.setListOfSourceToDestinationDetails(carpooler.getListOfSourceToDestinationDetails());

			log.debug("Getting Carpooler Prefernce started.");
			CarpoolerPreference cp = carpoolService.getCarpoolerPreferenceByCarpooler(carpooler);
			log.debug("Getting Carpooler Prefernce completed :"+cp);

			uiCarpooler.setCarpoolerPreference(cp);

			listOfUICarpoolers.add(uiCarpooler);


		}

		log.debug("leaving method :"+listOfUICarpoolers);
		return listOfUICarpoolers;
	}
	
	@RequestMapping(value = "/carpoolerDetails.jsp")
	public ModelAndView getCarpoolerDetailsPage(HttpServletRequest req){
		
		UICarpooler uiCarpooler = new UICarpooler();
		
		
		boolean longFormatStatus = true;
		long id=0;
		ModelAndView modelAndView = new ModelAndView("viewsCarpool/nonAdminPages/carpoolerDetails");

		if(req.getParameter("id")!=null){
			log.debug("Got the id parameter :"+req.getParameter("id"));
			try{
				id = Long.parseLong(req.getParameter("id"));
			}catch (Exception e) {
				longFormatStatus = false;
				log.debug("Exception parsing String to Long :"+req.getParameter("id") + " and got exception as :"+e.getMessage());
			}

			if(longFormatStatus){
				Carpooler carpooler = carpoolService.getCarpoolerByCarpoolerId(id);
								
				if(carpooler!=null){
				
					CarpoolerPreference cp1 = carpoolService.getCarpoolerPreferenceByCarpooler(carpooler);
					uiCarpooler.setCarpoolerPreference(cp1);
					
					
					String userProfilePicURL = carpooler.getUser().getUserProfilePic();
					
					String append = "/profilePicture/";
					//carpooler.getUser().setUserProfilePic(append+userProfilePicURL);
					//uiCarpooler.setPhotoOfCarpooler(append+userProfilePicURL);
					uiCarpooler.setPhotoOfCarpooler(userProfilePicURL);
					
					uiCarpooler.setEmailIdOfCarpooler(carpooler.getUser().getEmailId());
					uiCarpooler.setGender(carpooler.getUser().getGender());
					uiCarpooler.setDob(carpooler.getUser().getDob());
					uiCarpooler.setPrimaryContactNumber(carpooler.getUser().getPrimaryContactNumber());
					uiCarpooler.setSecondarContactNumber(carpooler.getUser().getSecondaryContactNumber());
					uiCarpooler.setNameOfCarpooler(carpooler.getUser().getUserName());
					
					modelAndView.addObject("carpooler", uiCarpooler);
					
					if(carpooler.getListOfSourceToDestinationDetails()!=null){
						
						if(carpooler.getListOfSourceToDestinationDetails().size()>0){
							if(carpooler.getListOfSourceToDestinationDetails().size()==1){
								log.debug("Size is 1, So only one route is available");
								
								//log.debug("Adding first route details of user as :"+carpooler.getListOfSourceToDestinationDetails().get(0));
								
//								CarpoolerPreference cp = carpoolService.getCarpoolerPreferenceByCarpooler(carpooler);
//								uiCarpooler.setCarpoolerPreference(cp);
								
								uiCarpooler.setListOfSourceToDestinationDetails(carpooler.getListOfSourceToDestinationDetails());
								if(uiCarpooler.getListOfSourceToDestinationDetails().get(0).isAvailability()){
									modelAndView.addObject("firstRoute", uiCarpooler.getListOfSourceToDestinationDetails().get(0));
								}else{
									modelAndView.addObject("firstRoute", null);
								}
							}else{
								
								log.debug("Size is 2, So both routes are available");
								
								//log.debug("Adding first route details of user as :"+carpooler.getListOfSourceToDestinationDetails().get(0));

								
//								CarpoolerPreference cp = carpoolService.getCarpoolerPreferenceByCarpooler(carpooler);
//								uiCarpooler.setCarpoolerPreference(cp);
								
								uiCarpooler.setListOfSourceToDestinationDetails(carpooler.getListOfSourceToDestinationDetails());
								
								if(uiCarpooler.getListOfSourceToDestinationDetails().get(0).isAvailability()){
									modelAndView.addObject("firstRoute", uiCarpooler.getListOfSourceToDestinationDetails().get(0));
								}else{
									modelAndView.addObject("firstRoute", null);
								}
								
								if(uiCarpooler.getListOfSourceToDestinationDetails().get(1).isAvailability()){
									log.debug("Adding second route details of user as :"+carpooler.getListOfSourceToDestinationDetails().get(1));
									modelAndView.addObject("secondRoute", uiCarpooler.getListOfSourceToDestinationDetails().get(1));

								}else{
									modelAndView.addObject("secondRoute", null);
								}		
							}
						}
						
					}else{
						log.debug("Adding first and second route as null for user because found ListOfSourceToDestinationDetails as null");
						modelAndView.addObject("firstRoute", null);
						modelAndView.addObject("secondRoute", null);	
					}
					
					log.debug("Fetching Testimonial for user by user name :"+carpooler.getUser().getUserName());
					UserTestimonial userTestimonial = carpoolService.getTestimonialByUserName(carpooler.getUser().getUserName());
					modelAndView.addObject("userTestimonial", userTestimonial);
				}else{
					modelAndView.addObject("carpooler", null);
					log.debug("Not fetching Testimonial for user, as carpooler object is null");
				}
			}else{
				log.debug("Not hitting to DB as long id is not in proper format");
			}
		}else{
			log.debug("Not get any id parameter, so returning back.");
		}
		return modelAndView;
	}

	
}
