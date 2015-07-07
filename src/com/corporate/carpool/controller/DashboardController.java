package com.corporate.carpool.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.carpool.dto.UICarpooler;
import com.corporate.carpool.util.CarpoolConstants;
import com.corporate.carpool.util.PropertiesUtil;
import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.Carpooler;
import com.corporate.carpooldb.dto.CarpoolerPreference;
import com.corporate.carpooldb.dto.FeedbackUpdated;
import com.corporate.carpooldb.dto.SourceToDestinationDetails;
import com.corporate.carpooldb.dto.User;

@Controller("DashboardControllerCarpool")
@RequestMapping("/carpool/dashboard")
public class DashboardController {

	Logger log = Logger.getLogger(DashboardController.class);

	private PropertiesUtil propertiesUtil=null;

	public DashboardController() {
		propertiesUtil = new PropertiesUtil();
	}
	
	@Autowired
	CarpoolService carpoolService=null;

	@RequestMapping(value = "/home.jsp")
	public ModelAndView getLoginPage1(HttpServletRequest req, Principal principal){

		String viewName = "index";
		log.debug("Request came for displaying home page.");
		ModelAndView modelAndView = new ModelAndView(viewName);


		log.debug("Fetching list of all user, to display count on home page.");
		List<User> listOfAllUser= carpoolService.getAllUser();
		log.debug("Completed fetching list of all user with object value :"+listOfAllUser);

		log.info("Adding count of all registered users, so that view can display it.");
		modelAndView.addObject("totalUserCount", listOfAllUser.size());


		return modelAndView;

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
				carpooler.getUser().setUserProfilePic(append + profilePicName);	
				//				}else{
				//					log.debug("File doesn't exist");
				//				}


				listOfFinalCarpooler.add(carpooler);
			}
		}

		log.debug("Request completed to insert complete path for user profile pic.");
		return listOfFinalCarpooler;
	}

	@RequestMapping(value = "/testimonials.jsp")
	public ModelAndView getAllTestimonialPage(HttpServletRequest req){
		log.debug("Request received to fetch all Testimonials");
		ModelAndView modelAndView = new ModelAndView("viewsCarpool/nonAdminPages/testimonials");

		log.debug("Fetching list of Praise Feedback, to display on testimonials page.");
		List<FeedbackUpdated> listOfPraiseFeedback = carpoolService.getActiveFeedbackByType(CarpoolConstants.FEEDBACK_PRAISE);
		log.debug("Completed fetching list of Praise Feedback with object value :"+listOfPraiseFeedback);		

		log.info("Adding list of testimonial model, so that view can display it.");
		modelAndView.addObject("listOfPraiseFeedback", setCompletePathForUserProfilePicInFeedbackUpdatedList(listOfPraiseFeedback,req));

		log.debug("Returning from the function.");
		return modelAndView;
	}

	/*@RequestMapping(value = "/letspoolit.jsp")
	public ModelAndView getLetsPoolPage(Model model, Principal principal){
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
			modelAndView.setViewName("redirect:home.jsp");
			modelAndView.addObject("alreadyProvidingCarpool","We found you as a member already going green, <br><br>So any changes to your Carpool details need to be changed under <br>[ My Account --> Carpool Settings link ] ");
		}else{
			log.debug("Not providing carpool.");
			modelAndView.addObject("alreadyProvidingCarpool",false);
			modelAndView.setViewName("letspool");
			model.addAttribute("LetsPoolIt", new UICarpooler());
		}

		return modelAndView;
	}
*/
	@RequestMapping(value = "/logout.jsp")
	public String getLogoutPage(){
		return "logout";
	}


/*	@RequestMapping(value = "/result.jsp")
	public ModelAndView getResultPage(HttpServletRequest request){
		log.debug("request received to fetch matching carpooler");
		ModelAndView modelAndView = new ModelAndView("viewsCarpool/result");

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
		 if(listOfFinalCarpoolers!=null && listOfFinalCarpoolers.size()>0){
			listOfFinalCarpoolers = filterListOfAvailableCarpooler(listOfFinalCarpoolers);
		} 


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
*/

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


	/**
	 * This function filter outs carpooler which are no more available from the given list.
	 * This function is not used now as we are displaying "Availability" column in result table, but in future we can remove the carpooler from list if needed.
	 * 
	 * @param listOfCarpooler
	 * @return
	 */
	private List<Carpooler> filterListOfAvailableCarpooler(List<Carpooler> listOfCarpooler){
		for (int i = 0; i < listOfCarpooler.size(); i++) {
			Carpooler carpooler = listOfCarpooler.get(i);
			if(!carpooler.isAvailability()){
				listOfCarpooler.remove(i);
			}
		}
		return listOfCarpooler;
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



	@RequestMapping(value = "/contactUs.jsp")
	public String getContactPage(){
		return "contactUs";
	}

/*	@RequestMapping(value = "/faq.jsp")
	public String getFAQPage(){
		return "faq";
	}
*/
}

