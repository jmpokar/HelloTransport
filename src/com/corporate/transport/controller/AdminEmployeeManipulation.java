package com.corporate.transport.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.domain.RouteDetailsHelper;
import com.corporate.transportdb.dto.updated.News;
import com.corporate.transportdb.dto.updated.PlaceUpdated;
import com.corporate.transportdb.dto.updated.RouteDriverVehicleMappingUpdated;
import com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated;
import com.corporate.transportdb.dto.updated.RouteUpdated;
import com.corporate.transportdb.dto.updated.UserRequestNew;
import com.corporate.transportdb.dto.updated.UserRouteMappingUpdated;
import com.corporate.transportdb.dto.updated.UserUpdated;
import com.corporate.transportdb.util.TransportConstants;

@Controller("AdminEmployeeManipulation")
@RequestMapping("/transport/admin/ae")
public class AdminEmployeeManipulation {


	@Autowired
	private TransportServiceUpdated transportServiceUpdated;


	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}


	@RequestMapping(value="/selectEmployee", method = RequestMethod.GET)
	public ModelAndView employeeManipulation(Principal principal) {
		System.out.println("AdminEmployeeManipulation.employeeManipulation()");
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/employeeManipulation");
		
		List<UserRequestNew> listOfUserRequestNew = transportServiceUpdated.getAllUserRequestNewHavingStatus(TransportConstants.REQUEST_ON_HOLD);
		mnv.addObject("listOfUserRequestNew", listOfUserRequestNew);	
		
		mnv.addObject("request", "selectEmployee");	
		
		Gson gson = new Gson();
		String data = gson.toJson(listOfUserRequestNew);
		System.out.println("JSON IS :"+data);
		mnv.addObject("listOfUserRequestNewJson", data);	
		System.out.println("listOfUserRequestNewJson :"+data);
		
		List<RouteUpdated> listOfAllRoute = transportServiceUpdated.getAllRoute();
		mnv.addObject("listOfAllRoute", listOfAllRoute);	
		System.out.println("List Of all Route is :"+listOfAllRoute);
		
		List<RoutePlaceMappingUpdated> listOfRoutePlaceMappingUpdated = transportServiceUpdated.getAllRoutePlaceMapping();
		String listOfRoutePlaceMappingUpdatedJson = gson.toJson(listOfRoutePlaceMappingUpdated);
		mnv.addObject("listOfRoutePlaceMappingUpdatedJson", listOfRoutePlaceMappingUpdatedJson);	
		System.out.println("listOfRoutePlaceMappingUpdatedJson :"+listOfRoutePlaceMappingUpdatedJson);
		
		return mnv;
	}

	
	@RequestMapping(value="/removeEmployee", method = RequestMethod.GET)
	public ModelAndView removeEmployee(Principal principal) {
		System.out.println("AdminEmployeeManipulation.employeeManipulation()");
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/employeeManipulation");
		
		List<UserUpdated> listOfUserUpdated = transportServiceUpdated.getAllUserUpdated();
		mnv.addObject("listOfUserUpdated", listOfUserUpdated);	
		
		mnv.addObject("request", "removeEmployee");			
		return mnv;
	}
	
	@RequestMapping(value="/addEmployeeEntryAsPassHolder", method = RequestMethod.GET)
	public ModelAndView addEmployeeEntryAsPassHolder(HttpServletRequest request) {
		System.out.println("AdminEmployeeManipulation.addEmployeeEntryAsPassHolder()");
		
		RedirectView rv = new RedirectView("adminHome", true);
		ModelAndView mnv = new ModelAndView(rv);

		String routeId = request.getParameter("routeId");
		String placeId = request.getParameter("placeId");
		String requestAndEmailId = request.getParameter("requestAndEmailId");
		System.out.println("requestAndEmailId is :"+requestAndEmailId);
		String[] arr=null;
		if(requestAndEmailId!=null){
			arr = requestAndEmailId.split(",");
		}
		
		if(arr!=null){
			for (String string : arr) {
				System.out.println("DD :"+string);
			}
		}else{
			System.out.println("arr is null");
		}
		
		UserUpdated userUpdated = new UserUpdated();
		userUpdated.setEmailId(arr[1]);
		userUpdated.setAvailBusService(true);
		userUpdated.setRole(transportServiceUpdated.getRoleByRoleName(TransportConstants.ROLE_USER));
		userUpdated.setStatus(transportServiceUpdated.getStatusByName(TransportConstants.STATUS_ACTIVE));
		
		boolean userSaveStatus = transportServiceUpdated.saveUser(userUpdated);
		
		if(userSaveStatus){
		
			PlaceUpdated place = transportServiceUpdated.getPlacebyPlaceId(Long.parseLong(placeId));
			RouteUpdated route = transportServiceUpdated.getRouteByRouteId(Long.parseLong(routeId));
			
			UserRouteMappingUpdated userRouteMappingUpdated = new UserRouteMappingUpdated();
			userRouteMappingUpdated.setPlace(place);
			userRouteMappingUpdated.setRoute(route);
			userRouteMappingUpdated.setUser(transportServiceUpdated.getUserByEmailId(arr[1]));
			
			boolean userRouteMappingStatus = transportServiceUpdated.saveUserRouteMapping(userRouteMappingUpdated);
			if(userRouteMappingStatus){
				UserRequestNew userRequestNew = transportServiceUpdated.getUserRequestNewWithMatchingEmailIdAndRequestId(arr[1], Long.parseLong(arr[0]));
				userRequestNew.setRequestStatus(TransportConstants.REQUEST_CLOSED);
				userRequestNew.setAdminComment(userRequestNew.getAdminComment() + TransportConstants.ADMIN_COMMENT_SEPERATOR + TransportConstants.ADMIN_COMMENT_BUS_PASS_COLLECTED);
				boolean updatingUserRequestNewStatus = transportServiceUpdated.modifyUserRequestNew(userRequestNew);
				
				if(updatingUserRequestNewStatus){
					mnv.addObject("status", "Request Updated Successfully.");	
				}else{
					mnv.addObject("status", "Error updating request, Please try again.");
				}
			}else{
				mnv.addObject("status", "Error updating request, Please try again.");
			}
		}else{
			mnv.addObject("status", "Error updating request, Please try again.");
		}
		
		
		List<UserRequestNew> listOfUserRequestNew = transportServiceUpdated.getAllUserRequestNewWithStatusPending();
		mnv.addObject("listOfUserRequestNew", listOfUserRequestNew);
		
		List<RouteDriverVehicleMappingUpdated> listOfRouteDriverVehicleMappingUpdated = transportServiceUpdated.getListOfRouteDriverVehicleMappingUpdated();
		mnv.addObject("listOfRouteDriverVehicleMappingUpdated", listOfRouteDriverVehicleMappingUpdated);
		
		List<List<UserRouteMappingUpdated>> listOfUserRouteMappingUpdated = transportServiceUpdated.getAllUserRouteMapping();
		mnv.addObject("listOfUserRouteMappingUpdated", listOfUserRouteMappingUpdated);
		
		mnv.addObject("listOfRouteDriverVehicleMappingUpdated", listOfRouteDriverVehicleMappingUpdated);
		
		List<RouteDetailsHelper> listOfRouteDetailsHelper = 
				transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);

		mnv.addObject("listOfRouteDetailsHelper", listOfRouteDetailsHelper);

		return mnv;
	}

	
	
	@RequestMapping(value="/removeEmployeeEntryAsPassHolder", method = RequestMethod.GET)
	public ModelAndView removeEmployeeEntryAsPassHolder(HttpServletRequest request) {
		System.out.println("AdminEmployeeManipulation.removeEmployeeEntryAsPassHolder()");		
		
		RedirectView rv = new RedirectView("adminHome", true);
		ModelAndView mnv = new ModelAndView(rv);

		String userId = request.getParameter("userId");
		System.out.println("User ID IS :"+userId);
		
		UserUpdated uu1 = transportServiceUpdated.getUserByUserId(Long.parseLong(userId));
		
		if(uu1!=null){
			boolean deleteFlag = transportServiceUpdated.deleteUserUpdated(uu1);
			if(deleteFlag)
				mnv.addObject("status", "Your Bus pass is deleted successfully, Hope to see you back soon.");
			else
				mnv.addObject("status", "Error deleting User From Route, Please try again.");				
		}else{
			mnv.addObject("status", "No user found by the given User id.");
		}
		
		
		List<UserRequestNew> listOfUserRequestNew = transportServiceUpdated.getAllUserRequestNewWithStatusPending();
		mnv.addObject("listOfUserRequestNew", listOfUserRequestNew);
		
		List<RouteDriverVehicleMappingUpdated> listOfRouteDriverVehicleMappingUpdated = transportServiceUpdated.getListOfRouteDriverVehicleMappingUpdated();
		mnv.addObject("listOfRouteDriverVehicleMappingUpdated", listOfRouteDriverVehicleMappingUpdated);
		
		List<List<UserRouteMappingUpdated>> listOfUserRouteMappingUpdated = transportServiceUpdated.getAllUserRouteMapping();
		mnv.addObject("listOfUserRouteMappingUpdated", listOfUserRouteMappingUpdated);
		
		mnv.addObject("listOfRouteDriverVehicleMappingUpdated", listOfRouteDriverVehicleMappingUpdated);
		
		List<RouteDetailsHelper> listOfRouteDetailsHelper = 
				transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);

		mnv.addObject("listOfRouteDetailsHelper", listOfRouteDetailsHelper);
		
		return mnv;
	}

	
	@RequestMapping(value="/getEmployeeDetails", method = RequestMethod.GET)
	public ModelAndView getEmployeeRequestDetails(HttpServletRequest request) {
		System.out.println("AdminEmployeeManipulation.getEmployeeRequestDetails()");
		
		String emailId = request.getParameter("emailId");
		
		ModelAndView mnv = new ModelAndView("adminPages/employeeManipulation");
		UserRequestNew userRequestNew = transportServiceUpdated.getUserRequestNewWithMatchingEmailId(emailId);
		
		List<RouteUpdated> listOfAllRoute = transportServiceUpdated.getAllRoute();
		mnv.addObject("listOfAllRoute", listOfAllRoute);	
		
//		List<PlaceUpdated> listOfAllPlace = transportServiceUpdated.getAllRInBetweenPlaceOfRouteByRouteName(routeName)
//		mnv.addObject("listOfAllRoute", listOfAllRoute);	
		
		
		mnv.addObject("userRequestNew", "userRequestNew");	
		mnv.addObject("request", "addEmployeeRoute");	
		
		return mnv;
	}


	
	@RequestMapping(value="/adminHome")
	public ModelAndView getAdminHomePage() { 
		System.out.println("Inside getAdminHomePage()111");
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/adminHome");

		List<UserRequestNew> listOfUserRequestNew = transportServiceUpdated.getAllUserRequestNewWithStatusPending();
		mnv.addObject("listOfUserRequestNew", listOfUserRequestNew);
		
		List<RouteDriverVehicleMappingUpdated> listOfRouteDriverVehicleMappingUpdated = transportServiceUpdated.getListOfRouteDriverVehicleMappingUpdated();
		mnv.addObject("listOfRouteDriverVehicleMappingUpdated", listOfRouteDriverVehicleMappingUpdated);
		
		List<List<UserRouteMappingUpdated>> listOfUserRouteMappingUpdated = transportServiceUpdated.getAllUserRouteMapping();
		mnv.addObject("listOfUserRouteMappingUpdated", listOfUserRouteMappingUpdated);
		
		mnv.addObject("listOfRouteDriverVehicleMappingUpdated", listOfRouteDriverVehicleMappingUpdated);
		
		List<RouteDetailsHelper> listOfRouteDetailsHelper = 
				transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);

		mnv.addObject("listOfRouteDetailsHelper", listOfRouteDetailsHelper);

		
		return mnv;	
	}

	@RequestMapping(value = "/adminResponse")
	public ModelAndView adminResponse(HttpServletRequest request, HttpServletResponse response, Principal principal){
		System.out.println("INSIDE 1");
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/adminHome");

		String adminComment = request.getParameter("adminComment");
		String emailId = request.getParameter("emailId");
		String requestId = request.getParameter("requestId");
		String adminStatus = request.getParameter("adminStatus");

		UserRequestNew userRequestNew = transportServiceUpdated.getUserRequestNewWithMatchingEmailIdAndRequestId(emailId, Long.parseLong(requestId));
		if(userRequestNew!=null){
			userRequestNew.setAdminComment(adminComment);
			if(adminStatus!=null){
				int status = Integer.parseInt(adminStatus);
				if(status == TransportConstants.REQUEST_CLOSED){
					userRequestNew.setRequestStatus(TransportConstants.REQUEST_CLOSED);		

				}else if(status == TransportConstants.REQUEST_ON_HOLD){
					userRequestNew.setRequestStatus(TransportConstants.REQUEST_ON_HOLD);

				}else if(status == TransportConstants.REQUEST_PENDING){
					userRequestNew.setRequestStatus(TransportConstants.REQUEST_ON_HOLD);
				}
			}	

			boolean result = transportServiceUpdated.modifyUserRequestNew(userRequestNew);
			if(result){
				mnv.addObject("status", "Request updated Successfully.");
			}else{
				mnv.addObject("status", "Error updating status, please try again.");
			}
		}else{
			mnv.addObject("status", "No Request found to update..");
		}

		List<UserRequestNew> listOfUserRequestNew = transportServiceUpdated.getAllUserRequestNewWithStatusPending();
		mnv.addObject("listOfUserRequestNew", listOfUserRequestNew);

		List<RouteDriverVehicleMappingUpdated> listOfRouteDriverVehicleMappingUpdated = transportServiceUpdated.getListOfRouteDriverVehicleMappingUpdated();
		mnv.addObject("listOfRouteDriverVehicleMappingUpdated", listOfRouteDriverVehicleMappingUpdated);

		List<List<UserRouteMappingUpdated>> listOfUserRouteMappingUpdated = transportServiceUpdated.getAllUserRouteMapping();
		mnv.addObject("listOfUserRouteMappingUpdated", listOfUserRouteMappingUpdated);

		mnv.addObject("listOfRouteDriverVehicleMappingUpdated", listOfRouteDriverVehicleMappingUpdated);

		List<RouteDetailsHelper> listOfRouteDetailsHelper = 
				transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);

		mnv.addObject("listOfRouteDetailsHelper", listOfRouteDetailsHelper);

		return mnv;
	}

	
}
