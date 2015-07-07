package com.corporate.transport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.VehicleUpdated;

@Controller("AdminVehicleManipulation")
@RequestMapping("/transport/admin/av")
public class AdminVehicleManipulation {



	@Autowired
	private TransportServiceUpdated transportServiceUpdated;


	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}


	@RequestMapping(value="/vehicleManipulation")
	public ModelAndView vehicleManipulation(HttpServletRequest request) {

		System.out.println("AdminPlaceManipulation.addRoute()");

		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/vehicleManipulation");

		String requestFor = request.getParameter("request");

		System.out.println("Request :"+requestFor);

		if(requestFor!=null && requestFor.equals("addVehicle")){
			mnv.addObject("request", "addVehicle");
			System.out.println("Adding Place");

		}
		else if(requestFor!=null && requestFor.equals("modifyVehicle")){
			mnv.addObject("request", "modifyVehicle");
			List<VehicleUpdated> listOfVehicleUpdated = transportServiceUpdated.getAllVehicles();
			mnv.addObject("listOfVehicleUpdated", listOfVehicleUpdated);

		}
		else if(requestFor!=null && requestFor.equals("modifyVehicleDetails")){

			String vehicleId = request.getParameter("vehicleId");

			if(vehicleId!=null && !vehicleId.trim().equals("")){
				VehicleUpdated vehicleUpdated = transportServiceUpdated.getVehicleByVehicleId(Long.parseLong(vehicleId));
				if(vehicleUpdated!=null){
					mnv.addObject("vehicleUpdated", vehicleUpdated);
				}else{
					mnv.addObject("status", "No Vehicle Found by Given Name");
				}
			}
			mnv.addObject("request", "modifyVehicleDetails");
		}

		System.out.println("returning");				
		return mnv;	
	}



	@RequestMapping(value="/addVehicle")
	public ModelAndView addVehicle(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/vehicleManipulation");

		String vehicleNumber = request.getParameter("vehicleNumber");
		String vehicleCapacity = request.getParameter("vehicleCapacity");


		if(vehicleNumber!=null && !vehicleNumber.trim().equals("") && vehicleCapacity!=null && !vehicleCapacity.trim().equals("")){
			VehicleUpdated vehicleUpdated = new VehicleUpdated();
			vehicleUpdated.setVehicleNumber(vehicleNumber);
			vehicleUpdated.setVehicleCapacity(vehicleCapacity);

			transportServiceUpdated.saveVehicle(vehicleUpdated);
			mnv.addObject("status", "Vehicle added successfully");

			mnv.addObject("request", "modifyVehicle");
			List<VehicleUpdated> listOfVehicleUpdated = transportServiceUpdated.getAllVehicles();
			mnv.addObject("listOfVehicleUpdated", listOfVehicleUpdated);

		}else{
			mnv.addObject("status", "Please provide Vehicle Name...");
		}

		return mnv;	
	}


	@RequestMapping(value="/modifyVehicle")
	public ModelAndView modifyVehicle(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/vehicleManipulation");

		String vehicleId = request.getParameter("vehicleId");

		if(vehicleId!=null && !vehicleId.trim().equals("")){
			VehicleUpdated vehicleUpdated = transportServiceUpdated.getVehicleByVehicleId(Long.parseLong(vehicleId));

			if(vehicleUpdated!=null){
				String vehicleNumber = request.getParameter("vehicleNumber");
				String vehicleCapacity = request.getParameter("vehicleCapacity");

				if(vehicleNumber!=null && !vehicleNumber.trim().equals("") && vehicleCapacity!=null && !vehicleCapacity.trim().equals("")){
					
					vehicleUpdated.setVehicleNumber(vehicleNumber);
					vehicleUpdated.setVehicleCapacity(vehicleCapacity);


					boolean vehicleUpdateFlag = transportServiceUpdated.updateVehicle(vehicleUpdated);

					mnv.addObject("request", "modifyVehicle");
					List<VehicleUpdated> listOfVehicleUpdated = transportServiceUpdated.getAllVehicles();
					mnv.addObject("listOfVehicleUpdated", listOfVehicleUpdated);

					if(vehicleUpdateFlag){
						mnv.addObject("status", "Vehicle modified Successfully");
					}else{
						mnv.addObject("status", "Error while modifying Vehicle, Please try again.");
					}
	
				}else{
					mnv.addObject("status", "Illegal Parameters provided for modifying Vehicle details...");	
				}

				
				}else{
					mnv.addObject("status", "No Vehicle Found by Given Name");
				}
			}else{
				mnv.addObject("status", "Illegal Parameters provided for modifying Vehicle details...");
			}

			return mnv;	
		}


		@RequestMapping(value="/deleteVehicle")
		public ModelAndView deleteVehicle(HttpServletRequest request) {
			ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/vehicleManipulation");

			String vehicleId = request.getParameter("vehicleId");

			if(vehicleId!=null && !vehicleId.trim().equals("")){
				VehicleUpdated vehicleUpdated = transportServiceUpdated.getVehicleByVehicleId(Long.parseLong(vehicleId));

				if(vehicleUpdated!=null){
					boolean deleteFlag = transportServiceUpdated.deleteVehicle(vehicleUpdated);

					if(deleteFlag){
						mnv.addObject("request", "modifyVehicle");
						List<VehicleUpdated> listOfVehicleUpdated = transportServiceUpdated.getAllVehicles();
						mnv.addObject("listOfVehicleUpdated", listOfVehicleUpdated);

						mnv.addObject("status", "Vehicle Deleted Successfully.");
					}else{
						mnv.addObject("status", "No Vehicle Found by Given Name");
					}

				}else{
					mnv.addObject("status", "No Vehicle Found by Given Name");
				}

			}else{
				mnv.addObject("status", "Please provide Vehicle Name...");
			}

			return mnv;	
		}
	}
