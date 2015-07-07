package com.corporate.transport.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.DriverUpdated;
import com.corporate.transportdb.dto.updated.RouteUpdated;
import com.corporate.transportdb.dto.updated.RouteUpdated;
import com.corporate.transportdb.dto.updated.VehicleUpdated;
import com.corporate.transportdb.util.TransportConstants;


@Controller("AdminRouteManipulation")
@RequestMapping("/transport/admin/ar")
public class AdminRouteManipulation {

	@Autowired
	private TransportServiceUpdated transportServiceUpdated;


	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}


	
	
	@RequestMapping(value="/routeManipulation")
	public ModelAndView routeManipulation(HttpServletRequest request) {

		System.out.println("AdminRouteManipulation.addRoute()");

		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/routeManipulation");

		String requestFor = request.getParameter("request");

		System.out.println("Request :"+requestFor);

		if(requestFor!=null && requestFor.equals("addRoute")){
			mnv.addObject("request", "addRoute");
			System.out.println("Adding Route");

		}
		else if(requestFor!=null && requestFor.equals("modifyRoute")){
			mnv.addObject("request", "modifyRoute");
			List<RouteUpdated> listOfRouteUpdated = transportServiceUpdated.getAllRoute();
			mnv.addObject("listOfRouteUpdated", listOfRouteUpdated);

		}
		else if(requestFor!=null && requestFor.equals("modifyRouteDetails")){

			String routeId = request.getParameter("routeId");

			if(routeId!=null && !routeId.trim().equals("")){
				RouteUpdated routeUpdated = transportServiceUpdated.getRouteByRouteId(Long.parseLong(routeId));
				if(routeUpdated!=null){
					mnv.addObject("routeUpdated", routeUpdated);
				}else{
					mnv.addObject("status", "No Route Found by Given Name");
				}
			}
			mnv.addObject("request", "modifyRouteDetails");
		}

		System.out.println("returning");				
		return mnv;	
	}



	@RequestMapping(value="/addRoute")
	public ModelAndView addRoute(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("adminPages/routeManipulation");

		String routeName = request.getParameter("routeName");
		String routeType = request.getParameter("routeType");

		if(routeName!=null && !routeName.trim().equals("")){
			RouteUpdated routeUpdated = new RouteUpdated();
			routeUpdated.setRouteName(routeName);
			
			if(routeType!=null && (routeType.equals("regular") || routeType.equals("night")) ){
				if(routeType.equals("regular"))
					routeUpdated.setRegularCab(true);
				else
					routeUpdated.setRegularCab(false);
			}else{
				mnv.addObject("status", "Route added successfully");
		
			}
				
			
			transportServiceUpdated.saveRoute(routeUpdated);
			mnv.addObject("status", "Route added successfully");
			
			mnv.addObject("request", "modifyRoute");
			List<RouteUpdated> listOfRouteUpdated = transportServiceUpdated.getAllRoute();
			mnv.addObject("listOfRouteUpdated", listOfRouteUpdated);
			
		}else{
			mnv.addObject("status", "Please provide Route Name...");
		}

		return mnv;	
	}


	@RequestMapping(value="/modifyRoute")
	public ModelAndView modifyRoute(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("adminPages/routeManipulation");

		String routeId = request.getParameter("routeId");
		

		if(routeId!=null && !routeId.trim().equals("")){
			RouteUpdated routeUpdated = transportServiceUpdated.getRouteByRouteId(Long.parseLong(routeId));

			if(routeUpdated!=null){
				String routeNewName = request.getParameter("routeName");
				routeUpdated.setRouteName(routeNewName);
				
				String routeType = request.getParameter("routeType");
				
				if(routeType!=null && (routeType.equals("regular")||routeType.equals("night"))){
					if(routeType.equals("regular"))
						routeUpdated.setRegularCab(true);	
					if(routeType.equals("night"))
						routeUpdated.setRegularCab(false);	
				}
				
				boolean routeUpdateFlag = transportServiceUpdated.updateRoute(routeUpdated);

				mnv.addObject("request", "modifyRoute");
				List<RouteUpdated> listOfRouteUpdated = transportServiceUpdated.getAllRoute();
				mnv.addObject("listOfRouteUpdated", listOfRouteUpdated);

				if(routeUpdateFlag){
					mnv.addObject("status", "Route modified Successfully");
				}else{
					mnv.addObject("status", "Error while modifying Route, Please try again.");
				}

			}else{
				mnv.addObject("status", "No Route Found by Given Name");
			}
		}else{
			mnv.addObject("status", "Please provide Route Name...");
		}

		return mnv;	
	}


	@RequestMapping(value="/deleteRoute")
	public ModelAndView deleteRoute(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("adminPages/routeManipulation");

		String routeId = request.getParameter("routeId");

		if(routeId!=null && !routeId.trim().equals("")){
			RouteUpdated routeUpdated = transportServiceUpdated.getRouteByRouteId(Long.parseLong(routeId));

			if(routeUpdated!=null){
				boolean deleteFlag = transportServiceUpdated.deleteRoute(routeUpdated);

				if(deleteFlag){
					mnv.addObject("request", "modifyRoute");
					List<RouteUpdated> listOfRouteUpdated = transportServiceUpdated.getAllRoute();
					mnv.addObject("listOfRouteUpdated", listOfRouteUpdated);
					
					mnv.addObject("status", "Route Deleted Successfully.");
				}else{
					mnv.addObject("status", "No Route Found by Given Name");
				}

			}else{
				mnv.addObject("status", "No Route Found by Given Name");
			}

		}else{
			mnv.addObject("status", "Please provide Route Name...");
		}

		return mnv;	
	}
	
}
