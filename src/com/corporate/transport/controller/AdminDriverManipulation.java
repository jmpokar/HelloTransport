package com.corporate.transport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.DriverUpdated;

@Controller("AdminDriverManipulation")
@RequestMapping("/transport/admin/ad")
public class AdminDriverManipulation {



	@Autowired
	private TransportServiceUpdated transportServiceUpdated;


	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}


	@RequestMapping(value="/driverManipulation")
	public ModelAndView driverManipulation(HttpServletRequest request) {

		System.out.println("AdminPlaceManipulation.addRoute()");

		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/driverManipulation");

		String requestFor = request.getParameter("request");

		System.out.println("Request :"+requestFor);

		if(requestFor!=null && requestFor.equals("addDriver")){
			mnv.addObject("request", "addDriver");
			System.out.println("Adding Place");

		}
		else if(requestFor!=null && requestFor.equals("modifyDriver")){
			mnv.addObject("request", "modifyDriver");
			List<DriverUpdated> listOfDriverUpdated = transportServiceUpdated.getAllDriver();
			mnv.addObject("listOfDriverUpdated", listOfDriverUpdated);

		}
		else if(requestFor!=null && requestFor.equals("modifyDriverDetails")){

			String driverId = request.getParameter("driverId");

			if(driverId!=null && !driverId.trim().equals("")){
				DriverUpdated driverUpdated = transportServiceUpdated.getDriverByDriverId(Long.parseLong(driverId));
				if(driverUpdated!=null){
					mnv.addObject("driverUpdated", driverUpdated);
				}else{
					mnv.addObject("status", "No Driver Found by Given Name");
				}
			}
			mnv.addObject("request", "modifyDriverDetails");
		}

		System.out.println("returning");				
		return mnv;	
	}



	@RequestMapping(value="/addDriver")
	public ModelAndView addDriver(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/driverManipulation");

		String driverName = request.getParameter("driverName");
		String driverMobNumber = request.getParameter("driverMobileNumber");


		if(driverName!=null && !driverName.trim().equals("") && driverMobNumber!=null && !driverMobNumber.trim().equals("")){
			DriverUpdated driverUpdated = new DriverUpdated();
			driverUpdated.setDriverName(driverName);
			driverUpdated.setDriverMobileNumber(driverMobNumber);

			transportServiceUpdated.saveDriver(driverUpdated);
			mnv.addObject("status", "Driver added successfully");

			mnv.addObject("request", "modifyDriver");
			List<DriverUpdated> listOfDriverUpdated = transportServiceUpdated.getAllDriver();
			mnv.addObject("listOfDriverUpdated", listOfDriverUpdated);

		}else{
			mnv.addObject("status", "Some Mandatory Parameters are missing, Please provide to Save Driver...");
		}

		return mnv;	
	}


	@RequestMapping(value="/modifyDriver")
	public ModelAndView modifyDriver(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/driverManipulation");

		String driverId = request.getParameter("driverId");

		if(driverId!=null && !driverId.trim().equals("")){
			DriverUpdated driverUpdated = transportServiceUpdated.getDriverByDriverId(Long.parseLong(driverId));

			if(driverUpdated!=null){
				String driverName = request.getParameter("driverName");
				String driverMobNumber = request.getParameter("driverMobileNumber");

				if(driverName!=null && !driverName.trim().equals("") && driverMobNumber!=null && !driverMobNumber.trim().equals("")){
					
					driverUpdated.setDriverName(driverName);
					driverUpdated.setDriverMobileNumber(driverMobNumber);


					boolean driverUpdateFlag = transportServiceUpdated.updateDriver(driverUpdated);

					mnv.addObject("request", "modifyDriver");
					List<DriverUpdated> listOfDriverUpdated = transportServiceUpdated.getAllDriver();
					mnv.addObject("listOfDriverUpdated", listOfDriverUpdated);

					if(driverUpdateFlag){
						mnv.addObject("status", "Driver modified Successfully");
					}else{
						mnv.addObject("status", "Error while modifying Driver, Please try again.");
					}
	
				}else{
					mnv.addObject("status", "Illegal Parameters provided for modifying Driver details...");	
				}

				
				}else{
					mnv.addObject("status", "No Driver Found by Given Name");
				}
			}else{
				mnv.addObject("status", "Illegal Parameters provided for modifying Driver details...");
			}

			return mnv;	
		}


		@RequestMapping(value="/deleteDriver")
		public ModelAndView deleteDriver(HttpServletRequest request) {
			ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/driverManipulation");

			String driverId = request.getParameter("driverId");

			if(driverId!=null && !driverId.trim().equals("")){
				DriverUpdated driverUpdated = transportServiceUpdated.getDriverByDriverId(Long.parseLong(driverId));

				if(driverUpdated!=null){
					boolean deleteFlag = transportServiceUpdated.deleteDriver(driverUpdated);

					if(deleteFlag){
						mnv.addObject("request", "modifyDriver");
						List<DriverUpdated> listOfDriverUpdated = transportServiceUpdated.getAllDriver();
						mnv.addObject("listOfDriverUpdated", listOfDriverUpdated);

						mnv.addObject("status", "Driver Deleted Successfully.");
					}else{
						mnv.addObject("status", "No Driver Found by Given Name");
					}

				}else{
					mnv.addObject("status", "No Driver Found by Given Name");
				}

			}else{
				mnv.addObject("status", "Please provide Driver Name...");
			}

			return mnv;	
		}
	}
