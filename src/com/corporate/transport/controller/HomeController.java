package com.corporate.transport.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.ConnectException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;





import com.corporate.transport.authentication.LDAPConnectivityException;
import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.User;
import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.domain.RouteDetailsHelper;
import com.corporate.transportdb.dto.updated.DriverUpdated;
import com.corporate.transportdb.dto.updated.News;
import com.corporate.transportdb.dto.updated.PlaceUpdated;
import com.corporate.transportdb.dto.updated.RouteDriverVehicleMappingUpdated;
import com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated;
import com.corporate.transportdb.dto.updated.RouteUpdated;
import com.corporate.transportdb.dto.updated.UserRequestNew;
import com.corporate.transportdb.dto.updated.UserRouteMappingForNightCabUpdated;
import com.corporate.transportdb.dto.updated.UserRouteMappingUpdated;
import com.corporate.transportdb.dto.updated.UserUpdated;
import com.corporate.transportdb.dto.updated.VehicleUpdated;
import com.corporate.transportdb.util.TransportConstants;

@Controller("transport")
@RequestMapping("/transport")
public class HomeController {

	@Autowired
	private TransportServiceUpdated transportServiceUpdated;

	@Autowired
	CarpoolService carpoolService=null;

	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}


	@RequestMapping(value="/ganesh")
	public void checkGanesh(HttpServletRequest req, HttpServletResponse resp){
		System.out.println("ganesh");
		String greet = req.getParameter("greet");
		try {
			ServletOutputStream sos = resp.getOutputStream();
			sos.write(("Hello "+greet).getBytes());
		} catch (IOException e) {
			System.out.println("Exception :"+e.getMessage());
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/login.jsp")
	public void getLoginPage(HttpServletRequest req, HttpServletResponse resp){
		System.out.println("Login Page");
	}


	@RequestMapping(value="/home", method = RequestMethod.GET)
	public ModelAndView getHomePage(Principal principal) {
		System.out.println("HomeController.getHomePage() :"+principal);

		if(principal!=null){
			System.out.println("Principal object :"+principal.getName());
		}

		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/index");

		List<News> listOfNews = transportServiceUpdated.getAllActiveNews();

		for (int i = 0; i < listOfNews.size(); i++) {
			News news= listOfNews.get(i);
			System.out.println("News is :"+ news.getNewsSubject() + "  " +news.getNewsContent());
		}

		
		List<User> listOfAllUser= carpoolService.getAllUser();
		System.out.println("Completed fetching list of all user with object value :"+listOfAllUser);

		mnv.addObject("totalUserCount", listOfAllUser.size());
		
		mnv.addObject("listOfNews", listOfNews);		
		return mnv;
	}

	@RequestMapping(value="/giveMarble", method = RequestMethod.GET)
	public String getGiveMarblePage() { 
		return "home";
	}

	@RequestMapping(value="/browse", method = RequestMethod.GET)
	public String getBrowsePage() { 
		return "browse";
	}


	@RequestMapping(value="/cabBooking", method = RequestMethod.GET)
	public ModelAndView getCabBookingPage(Principal principal) {
		System.out.println("Request Received for Transport Page");
		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/cabBooking");

		String user = principal.getName();

		if(user!=null){

			List<RouteDetailsHelper> listOfRouteDetailsHelper = 
					transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.LATE_NIGHT_CAB);

			mnv.addObject("listOfRouteDetailsHelper", listOfRouteDetailsHelper);

			if(listOfRouteDetailsHelper!=null && listOfRouteDetailsHelper.size()>0){
				System.out.println("INSIDE 1");
				for(RouteDetailsHelper routeDetailsHelper: listOfRouteDetailsHelper){
					List<UserRouteMappingForNightCabUpdated> listOfUserRouteMappingForNightCabUpdated = routeDetailsHelper.getListOfUserRouteMappingForNightCabUpdated();

					if(listOfUserRouteMappingForNightCabUpdated!=null && listOfUserRouteMappingForNightCabUpdated.size()>0){

						System.out.println("INSIDE 2 ");

						for(UserRouteMappingForNightCabUpdated userRouteMappingForNightCabUpdated: listOfUserRouteMappingForNightCabUpdated){

							System.out.println("INSIDE 3 :"+userRouteMappingForNightCabUpdated.getRoute().getRouteName());

							System.out.println(userRouteMappingForNightCabUpdated.getUser().getUserName());
							System.out.println(userRouteMappingForNightCabUpdated.getUser().getEmailId());
							if(user.equals(userRouteMappingForNightCabUpdated.getUser().getEmailId())){
								mnv.addObject("routeBooked", userRouteMappingForNightCabUpdated.getRoute().getRouteName());
							}
						}
					}
				}
			}

			System.out.println("Request completed for Transport Page");
		}
		return mnv;
	}



	/**
	 * This Function is helpful when there is Bus Pass System as it will help you start Camera and take photo and Upload.
	 * Right now this function is not called from any page. 
	 *  
	 * @param request
	 * @param principal
	 * @return
	 */
	@RequestMapping(value="/getInPlaceSelection", method = RequestMethod.GET)
	public ModelAndView getInPlaceSelection(HttpServletRequest request, Principal principal) {
		System.out.println("Inside getInPlaceSelection..");
		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/getInPlaceSelection");

		String routeName = request.getParameter("route");
		System.out.println("Route Name got is :"+routeName);
		RouteDetailsHelper routeDetailsUpdated = transportServiceUpdated.getAllInBetweenPlaceOfRouteByRouteName(routeName);
		System.out.println("Route Object got is :"+routeDetailsUpdated);
		mnv.addObject("routeDetailsUpdated", routeDetailsUpdated);
		return mnv;
	}



	@RequestMapping(value="/passRequest")
	public ModelAndView passRequest(HttpServletRequest request, Principal principal) {

		ModelAndView mnv = new ModelAndView();

		String routeId = request.getParameter("routeId");
		String requestFor = request.getParameter("request");

		if(routeId!=null && requestFor!=null && !routeId.trim().equals("") && !requestFor.trim().equals("")){

			RouteUpdated route = transportServiceUpdated.getRouteByRouteId(Long.parseLong(routeId));
			if(requestFor.equals("book")){

				String placeId = request.getParameter("placeId");
				PlaceUpdated place = transportServiceUpdated.getPlacebyPlaceId(Long.parseLong(placeId));

				UserUpdated user = transportServiceUpdated.getUserByEmailId(principal.getName());
				if(user!=null){
					UserRouteMappingUpdated urmu = transportServiceUpdated.getUserRouteMappingByUser(user);
					if(urmu==null){

						UserRouteMappingUpdated userRouteMapping = new UserRouteMappingUpdated();  
						userRouteMapping.setUser(user);
						userRouteMapping.setRoute(route);
						userRouteMapping.setPlace(place);
						boolean userRouteSaveResult = transportServiceUpdated.saveUserRouteMapping(userRouteMapping);

						if(userRouteSaveResult){
							mnv.addObject("status", "Data Saved Successfully.");
						}else{
							mnv.addObject("status", "Error, while Saving data, Please try again.");
						}

					}else{

						//User already have mapping, So first delete existing one and then add another one.
						boolean deleteUserRouteMappingStatus = transportServiceUpdated.deleteUserRouteMappingByUserRouteMapping(urmu);
						if(deleteUserRouteMappingStatus){

							UserRouteMappingUpdated userRouteMapping = new UserRouteMappingUpdated();  
							userRouteMapping.setUser(user);
							userRouteMapping.setRoute(route);
							userRouteMapping.setPlace(place);
							boolean userRouteSaveResult = transportServiceUpdated.saveUserRouteMapping(userRouteMapping);

							if(userRouteSaveResult){
								mnv.addObject("status", "Data Saved Successfully.");
							}else{
								mnv.addObject("status", "Error, while Saving data, Please try again.");
							}

						}else{
							mnv.addObject("status", "Error, while deleting current route, Please try again.");
						}
					}
				}

				mnv.setViewName("getPass");
				List<RouteDetailsHelper> listOfRouteDetailsUpdated = transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);
				mnv.addObject("listOfRouteDetailsUpdated", listOfRouteDetailsUpdated);

				return mnv;

			}else if(requestFor.equals("modifyRoute")){

				String placeId = request.getParameter("placeId");
				PlaceUpdated place = transportServiceUpdated.getPlacebyPlaceId(Long.parseLong(placeId));

				UserUpdated user = transportServiceUpdated.getUserByEmailId(principal.getName());
				if(user!=null){
					UserRouteMappingUpdated urmu = transportServiceUpdated.getUserRouteMappingByUser(user);
					if(urmu!=null){

						urmu.setPlace(place);
						boolean userRouteUpdateResult = transportServiceUpdated.updateUserRouteMapping(urmu);

						if(userRouteUpdateResult){
							mnv.addObject("status", "Data Updated Successfully.");
						}else{
							mnv.addObject("status", "Error, while updating data, Please try again.");
						}

					}else{
						mnv.addObject("status", "No User-Route Mapping found to update.");
					}

				}else{
					mnv.addObject("status", "No User found to update.");
				}

				mnv.setViewName("getPass");
				List<RouteDetailsHelper> listOfRouteDetailsUpdated = transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);
				mnv.addObject("listOfRouteDetailsUpdated", listOfRouteDetailsUpdated);

				return mnv;

			}else if(requestFor.equals("selectPlace")){

				List<RoutePlaceMappingUpdated> listOfRoutePlaceMapping = transportServiceUpdated.getAllInBetweenPlaceOfRouteByRouteId(Long.parseLong(routeId));
				mnv.setViewName("placeSelection");
				mnv.addObject("listOfRoutePlaceMapping", listOfRoutePlaceMapping);
				mnv.addObject("show", "newRouteBook");

				return mnv;

			}else if(requestFor.equals("modify")){

				List<RoutePlaceMappingUpdated> listOfRoutePlaceMapping = transportServiceUpdated.getAllInBetweenPlaceOfRouteByRouteId(Long.parseLong(routeId));
				mnv.setViewName("placeSelection");
				mnv.addObject("listOfRoutePlaceMapping", listOfRoutePlaceMapping);
				mnv.addObject("show", "sameRouteModify");
				return mnv;

			}else if(requestFor.equals("cancel")){
				//Request for cancellation of Bus Pass

				UserUpdated user = transportServiceUpdated.getUserByEmailId(principal.getName());
				if(user!=null){
					UserRouteMappingUpdated urmu = transportServiceUpdated.getUserRouteMappingByUser(user);
					if(urmu!=null){
						boolean deleteUserRouteMappingStatus = transportServiceUpdated.deleteUserRouteMappingByUserRouteMapping(urmu);

						if(deleteUserRouteMappingStatus){
							mnv.addObject("status", "Data deleted Successfully.");
						}else{
							mnv.addObject("status", "Error, while deleting data, Please try again.");
						}

					}else{
						mnv.addObject("status", "Error, while deleting current route, Please try again.");
					}

				}else{
					mnv.addObject("status", "No User found.");
				}

				mnv.setViewName("getPass");
				List<RouteDetailsHelper> listOfRouteDetailsUpdated = transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);
				mnv.addObject("listOfRouteDetailsUpdated", listOfRouteDetailsUpdated);
				return mnv;
			}

		}else{
			mnv.addObject("status", "Some parameters are missing for request to get completed, Please supply correct parameters...");			
		}

		mnv.setViewName("getPass");
		List<RouteDetailsHelper> listOfRouteDetailsUpdated = transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);
		mnv.addObject("listOfRouteDetailsUpdated", listOfRouteDetailsUpdated);
		return mnv;
	}


	/*		

	@RequestMapping(value="/applyForMonthyPass", method = RequestMethod.GET)
	public ModelAndView getCabBookingPage(HttpServletRequest request, Principal principal) {

		ModelAndView mnv = new ModelAndView("home");


		String routeName = request.getParameter("route");
		String userEmailId = "jay3@avaya.com"; 

		UserUpdated user = transportServiceUpdated.getUserByEmailId(userEmailId);
		user.setAvailBusService(true);
		RouteUpdated route = transportServiceUpdated.getRouteByRouteName(routeName);
		boolean status = transportServiceUpdated.enableMonthlyBusPassToUserForRoute(user, route);

		String message=null;
		if(status){
			message = "You monthly pass is enabled.";
		}else{
			message = "Some technical error is enabling your monthly pass, Please try again.";
		}
		mnv.addObject("listOfRouteDetailsUpdated", message);
		return mnv;
	}

	 */	

	@RequestMapping(value="/bookCabForUser", method = RequestMethod.GET)
	public ModelAndView bookCabForUser(HttpServletRequest req, Principal principal) {
		System.out.println("HomeController.bookCabForUser() 1");
		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/cabBooking");

		String currentUser = principal.getName();
		//String currentUser = "jay1@avaya.com";

		UserUpdated user = transportServiceUpdated.getUserByEmailId(currentUser);

		if(user!=null){	
			String routeId = req.getParameter("route");
			RouteUpdated routeUpdated = transportServiceUpdated.getRouteByRouteId(Long.parseLong(routeId));

			UserRouteMappingForNightCabUpdated userRouteMappingForNightCabUpdated = new UserRouteMappingForNightCabUpdated();
			userRouteMappingForNightCabUpdated.setDateOfBooking(new Date());
			userRouteMappingForNightCabUpdated.setRoute(routeUpdated);
			userRouteMappingForNightCabUpdated.setUser(user);

			PlaceUpdated place = transportServiceUpdated.getPlacebyPlaceId(TransportConstants.ELECTRONIC_CITY_PLACE_ID);
			userRouteMappingForNightCabUpdated.setPlace(place);

			boolean result = transportServiceUpdated.saveUserRouteMappingForNightCabUpdatedDetails(userRouteMappingForNightCabUpdated);
			System.out.println("HomeController.bookCabForUser() 1 :"+result);
			if(result){
				mnv.addObject("status","Your Request is Logged Successfully and same you can see in todays Employee Cab's list");
			}else{
				mnv.addObject("status","Due to some Technical error, we are unable to log your request. Please try again, If problem continues then contact admin.");
			}


		}else{
			mnv.addObject("status","Unable to find user with name "+principal.getName()+" in our Records.");
		}
		List<RouteDetailsHelper> listOfRouteDetailsHelper = 
				transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.LATE_NIGHT_CAB);
		mnv.addObject("listOfRouteDetailsHelper", listOfRouteDetailsHelper);

		if(listOfRouteDetailsHelper!=null && listOfRouteDetailsHelper.size()>0){
			System.out.println("INSIDE 1");
			for(RouteDetailsHelper routeDetailsHelper: listOfRouteDetailsHelper){
				List<UserRouteMappingForNightCabUpdated> listOfUserRouteMappingForNightCabUpdated = routeDetailsHelper.getListOfUserRouteMappingForNightCabUpdated();

				if(listOfUserRouteMappingForNightCabUpdated!=null && listOfUserRouteMappingForNightCabUpdated.size()>0){

					System.out.println("INSIDE 2 ");

					for(UserRouteMappingForNightCabUpdated userRouteMappingForNightCabUpdated1: listOfUserRouteMappingForNightCabUpdated){

						System.out.println("INSIDE 3 :"+userRouteMappingForNightCabUpdated1.getRoute().getRouteName());

						System.out.println(userRouteMappingForNightCabUpdated1.getUser().getUserName());
						System.out.println(userRouteMappingForNightCabUpdated1.getUser().getEmailId());
						if(currentUser.equals(userRouteMappingForNightCabUpdated1.getUser().getEmailId())){
							mnv.addObject("routeBooked", userRouteMappingForNightCabUpdated1.getRoute().getRouteName());
						}
					}
				}
			}
		}


		return mnv;
	}


	@RequestMapping(value="/unBookCabForUser", method = RequestMethod.GET)
	public ModelAndView unBookCabForUser(HttpServletRequest req, Principal principal) {
		System.out.println("HomeController.bookCabForUser() 1");
		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/cabBooking");

		String currentUser = principal.getName();
		//String currentUser = "jay1@avaya.com";

		if(currentUser!=null){

			UserUpdated user = transportServiceUpdated.getUserByEmailId(currentUser);
			boolean status = transportServiceUpdated.deleteUserRouteMappingForNightCabUpdatedDetailsByUserId(user.getUserId());

			if(status)
				mnv.addObject("status", "Your name is UnBooked properly.");
			else
				mnv.addObject("status", "Your name is not UnBooked properly, Please try again.");

			List<RouteDetailsHelper> listOfRouteDetailsHelper = 
					transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.LATE_NIGHT_CAB);

			mnv.addObject("listOfRouteDetailsHelper", listOfRouteDetailsHelper);

			if(listOfRouteDetailsHelper!=null && listOfRouteDetailsHelper.size()>0){
				System.out.println("INSIDE 1");
				for(RouteDetailsHelper routeDetailsHelper: listOfRouteDetailsHelper){
					List<UserRouteMappingForNightCabUpdated> listOfUserRouteMappingForNightCabUpdated = routeDetailsHelper.getListOfUserRouteMappingForNightCabUpdated();

					if(listOfUserRouteMappingForNightCabUpdated!=null && listOfUserRouteMappingForNightCabUpdated.size()>0){

						System.out.println("INSIDE 2 ");

						for(UserRouteMappingForNightCabUpdated userRouteMappingForNightCabUpdated: listOfUserRouteMappingForNightCabUpdated){

							System.out.println("INSIDE 3 :"+userRouteMappingForNightCabUpdated.getRoute().getRouteName());

							System.out.println(userRouteMappingForNightCabUpdated.getUser().getUserName());
							System.out.println(userRouteMappingForNightCabUpdated.getUser().getEmailId());
							if(currentUser.equals(userRouteMappingForNightCabUpdated.getUser().getEmailId())){
								mnv.addObject("routeBooked", userRouteMappingForNightCabUpdated.getRoute().getRouteName());
							}
						}
					}
				}
			}

			System.out.println("Request completed for Transport Page");
		}

		return mnv;
	}

	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String getUploadPage() { 
		System.out.println("HomeController.getUploadPage()");
		return "upload";
	}

	@RequestMapping(value="/busFareAndPass")
	public ModelAndView busFareAndPass() { 
		ModelAndView mnv = new ModelAndView("busFareAndPass");
		List<RouteDetailsHelper> listOfRouteDetailsUpdated = transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);
		mnv.addObject("listOfRouteDetailsUpdated", listOfRouteDetailsUpdated);
		return mnv;
	}

	@RequestMapping(value="/getPass")
	public ModelAndView getPass() { 
		ModelAndView mnv = new ModelAndView("getPass");
		List<RouteDetailsHelper> listOfRouteDetailsUpdated = transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);
		mnv.addObject("listOfRouteDetailsUpdated", listOfRouteDetailsUpdated);
		return mnv;
	}

	@RequestMapping(value="/userStats")
	public ModelAndView getUserStatsPage() { 

		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/userStats");
		List<RouteDetailsHelper> listOfRouteDetailsHelper = transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);

		String routeName = null;
		String jsonString=null;

		if(listOfRouteDetailsHelper!=null && listOfRouteDetailsHelper.size()>0){


			String actualUsage="[";
			String busCapacity="[";
			for(int i=0; i<listOfRouteDetailsHelper.size();i++){
				RouteDetailsHelper routeDetailsHelper = listOfRouteDetailsHelper.get(i);

				if(routeDetailsHelper.getRouteDriverVehicleMappingUpdated()!=null && routeDetailsHelper.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated()!=null && 
						routeDetailsHelper.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated().getVehicle()!=null){
					busCapacity = busCapacity + routeDetailsHelper.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated().getVehicle().getVehicleCapacity() + ",";
				}

				if(routeDetailsHelper.getListOfUserRouteMappingUpdated()!=null){
					actualUsage = actualUsage + routeDetailsHelper.getListOfUserRouteMappingUpdated().size() + ",";
				}
				//System.out.println("Route -> "+routeDetailsHelper.getRoute().getRouteName() + " capacty -> "+routeDetailsHelper.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated().getVehicle().getVehicleCapacity() + "Actual Usage -> "+routeDetailsHelper.getListOfUserRouteMappingUpdated().size());
			}
			busCapacity = busCapacity.substring(0,busCapacity.length()-1);
			busCapacity = busCapacity + "]";


			actualUsage = actualUsage.substring(0,actualUsage.length()-1);
			actualUsage = actualUsage + "]";


			jsonString = 
					"[{"+
							"name: 'Bus Capacity',"+
							"data: " + busCapacity +
							"}, {"+
							"name: 'Actual Usage',"+
							"data:" + actualUsage +
							"}]";

			routeName="[";
			for(int i=0; i<listOfRouteDetailsHelper.size();i++){
				RouteDetailsHelper routeDetailsUpdated = listOfRouteDetailsHelper.get(i);
				if(routeDetailsUpdated.getRoute()!=null){
					routeName = routeName + "'" +routeDetailsUpdated.getRoute().getRouteName() + "',";
				}
			}

			routeName = routeName.substring(0, routeName.length()-1);
			routeName = routeName + "]";



			String chartTitle = "Bus Capacity and Actual Usage";
			mnv.addObject("chartTitle", chartTitle);

			String sourceName = "Avaya DB Records";
			mnv.addObject("sourceName", sourceName);
		}

		mnv.addObject("routeName", routeName);
		mnv.addObject("barChart", jsonString);	
		mnv.addObject("barChartRender", true);	
		mnv.addObject("pieChartRender", false);
		return mnv;
	}



	@RequestMapping(value="/renderChart")
	public ModelAndView renderChart(HttpServletRequest req) {

		System.out.println("HomeController.renderChart()");

		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/userStats");

		String[] choiceOfDataAndChart = req.getParameterValues("choiceOfDataAndChart");

		if(choiceOfDataAndChart!=null && !( Arrays.asList(choiceOfDataAndChart).contains("emp-bus"))){
			mnv.addObject("pieChartRender", false);
			mnv.addObject("barChartRender", false);
			mnv.addObject("status", "Please Select What Relation you want to see...");
			return mnv;
		}


		List<RouteDetailsHelper> listOfRouteDetailsUpdated = transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);

		if(listOfRouteDetailsUpdated!=null && listOfRouteDetailsUpdated.size()>0){
			String actualUsage="[";
			String busCapacity="[";

			HashMap<String, Integer> routeCapacityUsageMap = new HashMap<String, Integer>(); 

			for(int i=0; i<listOfRouteDetailsUpdated.size();i++){
				RouteDetailsHelper routeDetailsUpdated = listOfRouteDetailsUpdated.get(i);

				if(routeDetailsUpdated.getRouteDriverVehicleMappingUpdated()!=null && routeDetailsUpdated.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated()!=null && 
						routeDetailsUpdated.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated().getVehicle()!=null){
					busCapacity = busCapacity + routeDetailsUpdated.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated().getVehicle().getVehicleCapacity() + ",";
				}

				if(routeDetailsUpdated.getListOfUserRouteMappingUpdated()!=null){
					actualUsage = actualUsage + routeDetailsUpdated.getListOfUserRouteMappingUpdated().size() + ",";
				}


				if(routeDetailsUpdated.getRoute()!=null && routeDetailsUpdated.getRoute().getRouteName()!=null && 
						routeDetailsUpdated.getRouteDriverVehicleMappingUpdated()!=null && 
						routeDetailsUpdated.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated()!=null &&
						routeDetailsUpdated.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated().getVehicle()!=null &&
						routeDetailsUpdated.getListOfUserRouteMappingUpdated()!=null){

					routeCapacityUsageMap.put(routeDetailsUpdated.getRoute().getRouteName() + " | C = "  + 
							routeDetailsUpdated.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated().getVehicle().getVehicleCapacity() 
							+ " | U = ", routeDetailsUpdated.getListOfUserRouteMappingUpdated().size());
				}

				//System.out.println("Route -> "+routeDetailsUpdated.getRoute().getRouteName() + " capacty -> "+routeDetailsUpdated.getRouteDriverVehicleMappingUpdated().getDriverVehicleMappingUpdated().getVehicle().getVehicleCapacity() + "Actual Usage -> "+routeDetailsUpdated.getListOfUserRouteMappingUpdated().size());
			}
			busCapacity = busCapacity.substring(0,busCapacity.length()-1);
			busCapacity = busCapacity + "]";

			actualUsage = actualUsage.substring(0,actualUsage.length()-1);
			actualUsage = actualUsage + "]";


			String jsonString = 
					"[{"+
							"name: 'Bus Capacity',"+
							"data: " + busCapacity +
							"}, {"+
							"name: 'Actual Usage',"+
							"data:" + actualUsage +
							"}]";

			String routeName="[";
			for(int i=0; i<listOfRouteDetailsUpdated.size();i++){
				RouteDetailsHelper routeDetailsUpdated = listOfRouteDetailsUpdated.get(i);
				routeName = routeName + "'" +routeDetailsUpdated.getRoute().getRouteName() + "',";
			}

			routeName = routeName.substring(0, routeName.length()-1);
			routeName = routeName + "]";

			String chartTitle = "Bus Capacity and Actual Usage";
			String sourceName = "Avaya DB Records";

			if(choiceOfDataAndChart!=null && Arrays.asList(choiceOfDataAndChart).contains("bar")){
				mnv.addObject("chartTitle", chartTitle);
				mnv.addObject("sourceName", sourceName);

				mnv.addObject("routeName", routeName);
				mnv.addObject("barChart", jsonString);	
				mnv.addObject("barChartRender", true);	

			}else{
				mnv.addObject("barChartRender", false);
			}



			if(choiceOfDataAndChart!=null && Arrays.asList(choiceOfDataAndChart).contains("pie")){

				//PIE CHART CALCULATION STARTED
				String jsonStringForPie= "[{"+
						"type: 'pie',"+
						"name: '"+chartTitle+"',"+
						"data: [";

				for (Map.Entry<String, Integer> entry : routeCapacityUsageMap.entrySet()){
					String key = entry.getKey();
					Integer value = entry.getValue();
					jsonStringForPie = jsonStringForPie + "['" + key + "'," + value +  "],";
				}

				jsonStringForPie = jsonStringForPie.substring(0,jsonStringForPie.length()-1);
				jsonStringForPie = jsonStringForPie + "]"+ "}]";
				//PIE CHART CALCULATION ENDED	


				mnv.addObject("pieChart", jsonStringForPie);
				mnv.addObject("chartTitle", chartTitle);
				mnv.addObject("pieChartRender", true);
			}else{
				mnv.addObject("pieChartRender", false);
			}
		}else{
			mnv.addObject("status", "No Data Present");
		}

		return mnv;

	}	


	@RequestMapping(value="/contactUs")
	public String getContactUsPage() { 
		return "viewsTransport/nonAdminPages/contact";
	}	

	@RequestMapping(value="/transportTeam")
	public ModelAndView getTransportTeamPage() {
		System.out.println("Request Received for Transport Page");
		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/transportTeam");
		List<RouteDetailsHelper> listOfRouteDetailsHelper = 
				transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);

		mnv.addObject("listOfRouteDetailsHelper", listOfRouteDetailsHelper);
		System.out.println("Request completed for Transport Page");
		return mnv;
	}


	/*
	@RequestMapping(value="/printPassengerList")
	public String getPrintPassengerListPage() { 
		return "printPassengerList";
	}

	 */
	@RequestMapping(value="/printTransportTeamDetails")
	public ModelAndView getPrinterFriendlyPageForTeamDetails(HttpServletRequest req) { 
		System.out.println("HomeController.getPrinterFriendlyPage()");
		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/printerFriendlyPage");


		String cabType = req.getParameter("cabType");
		String routeName = req.getParameter("route");

		String cabChoice=null;

		if(cabType.equals("regular")){
			cabChoice = TransportConstants.REGULAR_CAB;
		}else{
			cabChoice = TransportConstants.LATE_NIGHT_CAB;
		}

		RouteDetailsHelper routeDetailsUpdated = transportServiceUpdated.getCompleteTravellerDetailsByRoute(routeName, cabChoice);
		mnv.addObject("routeDetailsUpdated", routeDetailsUpdated);
		mnv.addObject("requestPrintingFor", "particularRoute");
		mnv.addObject("cabType", cabChoice);


		return mnv;	
	}


	@RequestMapping(value="/printAllPassengerList")
	public ModelAndView getPrinterFriendlyPageForAllTeam(HttpServletRequest req) { 
		System.out.println("HomeController.getPrinterFriendlyPageForAllTeam()");
		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/printerFriendlyPage");

		List<RouteDetailsHelper> listOfAllRouteDetailsUpdated = transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);
		mnv.addObject("routeDetailsUpdated", listOfAllRouteDetailsUpdated);
		mnv.addObject("requestPrintingFor", "allRoute");
		mnv.addObject("cabType", "regular_cab");

		return mnv;	
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



	@RequestMapping(value = "/searchMatchingRoutes")
	public ModelAndView searchMatchingRoutes(HttpServletRequest request, HttpServletResponse response){
		System.out.println("INSIDE 1");
		int placeIdToSearch = Integer.parseInt(request.getParameter("searchTextFieldFrom"));

		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/transportTeam");
		try{
			List<RouteDetailsHelper> listOfRouteDetailsHelper = 
					transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);

			mnv.addObject("listOfRouteDetailsHelper", listOfRouteDetailsHelper);
			mnv.addObject("searchFlag", true);
			mnv.addObject("searchPlaceId", placeIdToSearch);


			String query = request.getParameter("searchTextFieldFrom");
			System.out.println("Query formed is :"+query);
		} catch(Exception e){ 
			e.printStackTrace(); 
		}
		return mnv;
	}



	/**
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/saveBusPassRequest")
	public ModelAndView saveBusPassRequest(HttpServletRequest request, HttpServletResponse response, Principal principal){
		System.out.println("INSIDE 1");
		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/myDashboard");

		try{
			String routeName = request.getParameter("routeName");
			String getInPlaceName = request.getParameter("getInPlace");

			System.out.println("Route Name :"+ routeName + " " + getInPlaceName);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("action", "newPass");
			jsonObject.put("routeName", routeName);
			jsonObject.put("placeName", getInPlaceName);

			System.out.println("JSON REQUEST :"+jsonObject.toString());

			UserRequestNew userRequestNew = new UserRequestNew();
			userRequestNew.setAction(jsonObject.toString());
			userRequestNew.setEmailId(principal.getName());
			userRequestNew.setRequestDate(new Date());
			userRequestNew.setRequestStatus(TransportConstants.REQUEST_PENDING);



			boolean requestSaveStatus = transportServiceUpdated.saveUserRequestNew(userRequestNew);
			if(requestSaveStatus){
				mnv.addObject("status", "Your Request saved Successfully.");
			}else{
				mnv.addObject("status", "Error while saving Request, Please try again.");
			}

			List<UserRequestNew> listOfUserRequestNew = transportServiceUpdated.getAllUserRequestNewWithEmailId(principal.getName());
			System.out.println(listOfUserRequestNew);
			mnv.addObject("listOfUserRequestNew", listOfUserRequestNew);

		} catch(Exception e){ 
			e.printStackTrace(); 
		}
		return mnv;
	}



	@RequestMapping(value = "/myDashboard")
	public ModelAndView myDashboard(HttpServletRequest request, HttpServletResponse response, Principal principal){
		System.out.println("INSIDE 1");

		String principalName = principal.getName();

		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/myDashboard");
		try{
			List<UserRequestNew> listOfUserRequestNew = transportServiceUpdated.getAllUserRequestNewWithEmailId(principalName);
			System.out.println(listOfUserRequestNew);
			mnv.addObject("listOfUserRequestNew", listOfUserRequestNew);

		} catch(Exception e){ 
			e.printStackTrace(); 
		}
		return mnv;
	}


	@RequestMapping(value = "/allEvents")
	public ModelAndView allEvents(HttpServletRequest request, HttpServletResponse response, Principal principal){
		ModelAndView mnv = new ModelAndView("viewsTransport/nonAdminPages/allEvents");

		String eventId = request.getParameter("eventId");

		List<News> listOfNews = transportServiceUpdated.getAllActiveNews();

		for (int i = 0; i < listOfNews.size(); i++) {
			News news= listOfNews.get(i);
			System.out.println("News is :"+ news.getNewsSubject() + "  " +news.getNewsContent());
		}

		mnv.addObject("listOfNews", listOfNews);
		mnv.addObject("eventId", eventId);
		return mnv;
	}

	@RequestMapping(value = "/faq")
	public String faq(){
		return "viewsTransport/nonAdminPages/faqs";
	}



	@ExceptionHandler(Throwable.class)
	public ModelAndView handleException(Throwable throwable, HttpServletRequest request){
		System.out.println("HomeController.handleException()");
		ModelAndView mnv = new ModelAndView();
		if (throwable instanceof ConnectException){
			mnv.addObject("status", 1);
			mnv.setViewName("../../errorPage");

		}else if(throwable instanceof BadCredentialsException){
			System.out.println("Exception of BAD");
			mnv.addObject("status", "Bad Credentials");
			mnv.setViewName("redirect:../../login");

		} else if(throwable instanceof LDAPConnectivityException){
			System.out.println("LDAPConnectivityException");
			mnv.addObject("status", 2);
			mnv.setViewName("../../errorPage");
		}
		mnv.addObject("status", 1);
		return mnv;
	}

}
