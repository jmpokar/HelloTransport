package com.corporate.transport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.PlaceUpdated;

@Controller("AdminPlaceManipulation")
@RequestMapping("/transport/admin/ap")
public class AdminPlaceManipulation {


	@Autowired
	private TransportServiceUpdated transportServiceUpdated;


	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}


	@RequestMapping(value="/placeManipulation")
	public ModelAndView placeManipulation(HttpServletRequest request) {

		System.out.println("AdminPlaceManipulation.addRoute()");

		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/placeManipulation");

		String requestFor = request.getParameter("request");

		System.out.println("Request :"+requestFor);

		if(requestFor!=null && requestFor.equals("addPlace")){
			mnv.addObject("request", "addPlace");
			System.out.println("Adding Place");

		}
		else if(requestFor!=null && requestFor.equals("modifyPlace")){
			mnv.addObject("request", "modifyPlace");
			List<PlaceUpdated> listOfPlaceUpdated = transportServiceUpdated.getAllPlace();
			mnv.addObject("listOfPlaceUpdated", listOfPlaceUpdated);

		}
		else if(requestFor!=null && requestFor.equals("modifyPlaceDetails")){

			String placeId = request.getParameter("placeId");

			if(placeId!=null && !placeId.trim().equals("")){
				PlaceUpdated placeUpdated = transportServiceUpdated.getPlacebyPlaceId(Long.parseLong(placeId));
				if(placeUpdated!=null){
					mnv.addObject("placeUpdated", placeUpdated);
				}else{
					mnv.addObject("status", "No Place Found by Given Name");
				}
			}
			mnv.addObject("request", "modifyPlaceDetails");
		}

		System.out.println("returning");				
		return mnv;	
	}



	@RequestMapping(value="/addPlace")
	public ModelAndView addPlace(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/placeManipulation");

		String placeName = request.getParameter("placeName");

		if(placeName!=null && !placeName.trim().equals("")){
			PlaceUpdated placeUpdated = new PlaceUpdated();
			placeUpdated.setPlaceName(placeName);
			transportServiceUpdated.savePlace(placeUpdated);
			mnv.addObject("status", "Place added successfully");
			
			mnv.addObject("request", "modifyPlace");
			List<PlaceUpdated> listOfPlaceUpdated = transportServiceUpdated.getAllPlace();
			mnv.addObject("listOfPlaceUpdated", listOfPlaceUpdated);
			
		}else{
			mnv.addObject("status", "Please provide Place Name...");
		}

		return mnv;	
	}


	@RequestMapping(value="/modifyPlace")
	public ModelAndView modifyPlace(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/placeManipulation");

		String placeId = request.getParameter("placeId");

		if(placeId!=null && !placeId.trim().equals("")){
			PlaceUpdated placeUpdated = transportServiceUpdated.getPlacebyPlaceId(Long.parseLong(placeId));

			if(placeUpdated!=null){
				String placeNewName = request.getParameter("placeName");
				placeUpdated.setPlaceName(placeNewName);
				boolean placeUpdateFlag = transportServiceUpdated.updatePlace(placeUpdated);

				mnv.addObject("request", "modifyPlace");
				List<PlaceUpdated> listOfPlaceUpdated = transportServiceUpdated.getAllPlace();
				mnv.addObject("listOfPlaceUpdated", listOfPlaceUpdated);

				if(placeUpdateFlag){
					mnv.addObject("status", "Place modified Successfully");
				}else{
					mnv.addObject("status", "Error while modifying Place, Please try again.");
				}

			}else{
				mnv.addObject("status", "No Place Found by Given Name");
			}
		}else{
			mnv.addObject("status", "Please provide Place Name...");
		}

		return mnv;	
	}


	@RequestMapping(value="/deletePlace")
	public ModelAndView deletePlace(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/placeManipulation");

		String placeId = request.getParameter("placeId");

		if(placeId!=null && !placeId.trim().equals("")){
			PlaceUpdated placeUpdated = transportServiceUpdated.getPlacebyPlaceId(Long.parseLong(placeId));

			if(placeUpdated!=null){
				boolean deleteFlag = transportServiceUpdated.deletePlace(placeUpdated);

				if(deleteFlag){
					mnv.addObject("request", "modifyPlace");
					List<PlaceUpdated> listOfPlaceUpdated = transportServiceUpdated.getAllPlace();
					mnv.addObject("listOfPlaceUpdated", listOfPlaceUpdated);
					
					mnv.addObject("status", "Place Deleted Successfully.");
				}else{
					mnv.addObject("status", "No Place Found by Given Name");
				}

			}else{
				mnv.addObject("status", "No Place Found by Given Name");
			}

		}else{
			mnv.addObject("status", "Please provide Place Name...");
		}

		return mnv;	
	}
}
