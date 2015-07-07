package com.corporate.transport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.domain.RouteDetailsHelper;
import com.corporate.transportdb.dto.updated.BusFare;
import com.corporate.transportdb.dto.updated.PlaceUpdated;
import com.corporate.transportdb.util.TransportConstants;

@Controller("AdminChargingModuleManipulation")
@RequestMapping("/transport/admin/ac")
public class AdminChargingModuleManipulation {


	@Autowired
	private TransportServiceUpdated transportServiceUpdated;


	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}


	@RequestMapping(value="/chargingModule")
	public ModelAndView chargingModule(HttpServletRequest request) {
		System.out.println("AdminChargingModuleManipulation.placeManipulation()");
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/charging");

		List<RouteDetailsHelper> listOfRouteDetailsHelper = 
				transportServiceUpdated.getAllRouteDetailsWithAllUserAndInBetweenPlaces(TransportConstants.REGULAR_CAB);

		BusFare busFare = transportServiceUpdated.getBusFare(1);
		
		mnv.addObject("listOfRouteDetailsHelper", listOfRouteDetailsHelper);
		mnv.addObject("busFare", busFare);

		System.out.println("returning");				
		return mnv;	
	}

}
