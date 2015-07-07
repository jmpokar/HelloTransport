package com.corporate.transport.controller;
//package com.corporate.transport.controller;
//
//
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Locale;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.view.RedirectView;
//
//import com.corporate.transport.backend.TransportServiceUpdated;
//import com.corporate.transport.domain.RouteDetailsHelper;
//import com.corporate.transport.dto.updated.DriverUpdated;
//import com.corporate.transport.dto.updated.DriverVehicleMappingUpdated;
//import com.corporate.transport.dto.updated.PlaceUpdated;
//import com.corporate.transport.dto.updated.RouteDriverVehicleMappingUpdated;
//import com.corporate.transport.dto.updated.RoutePlaceMappingUpdated;
//import com.corporate.transport.dto.updated.RouteUpdated;
//import com.corporate.transport.dto.updated.VehicleUpdated;
//import com.corporate.transport.util.TransportConstants;
//
//
//
//@Controller
//public class AdminDriverVehicleManipulation {
//
//	@Autowired
//	private TransportServiceUpdated transportServiceUpdated;
//
//
//	public TransportServiceUpdated getTransportServiceUpdated() {
//		return transportServiceUpdated;
//	}
//
//	public void setTransportServiceUpdated(
//			TransportServiceUpdated transportServiceUpdated) {
//		this.transportServiceUpdated = transportServiceUpdated;
//	}
//
//
//	@RequestMapping(value="/addRoutePlace")
//	public ModelAndView addRoute(HttpServletRequest request) {
//		System.out.println("AdminRoutePlaceManipulation.addRoute()");
//
//		RedirectView rv = new RedirectView("routeManipulationPlace", true);
//		ModelAndView mnv = new ModelAndView(rv);
//
//		String[] hour = request.getParameterValues("time_hour");
//		String[] minute = request.getParameterValues("time_minute");
//		String[] place = request.getParameterValues("place");
//		String routeId = request.getParameter("routeId");
//		String routeType = request.getParameter("routeType");
//		String driverVehicleMappingId = request.getParameter("driverVehicleMappingId");
//
//		if( (routeType!=null && (routeType.equals("regular") || routeType.equals("night"))) && 
//				driverVehicleMappingId!=null && !driverVehicleMappingId.trim().equals("")){
//
//			DriverVehicleMappingUpdated dvmu = transportServiceUpdated.getDriverVehicleMappingById(Long.parseLong(driverVehicleMappingId));
//
//			if(dvmu!=null){
//
//				RouteUpdated routeUpdated = transportServiceUpdated.getRouteByRouteId(Long.parseLong(routeId));
//
//				int flag = 0;
//				if(routeUpdated!=null){
//
//					RouteDriverVehicleMappingUpdated rdvmu = new RouteDriverVehicleMappingUpdated();
//					rdvmu.setDriverVehicleMappingUpdated(dvmu);
//					rdvmu.setRoute(routeUpdated);
//
//					boolean rdvmuSaveStatus = transportServiceUpdated.saveRouteDriverVehicleMappingUpdated(rdvmu);
//
//					if(rdvmuSaveStatus){
//
//						String string = "HH:mm:ss";
//						for (int i=0, j=0 , c=0; i < hour.length && j<place.length && c<minute.length; i++, j++, c++) {
//
//							PlaceUpdated p = transportServiceUpdated.getPlacebyPlaceName(place[i]);
//
//							if(p!=null){
//								RoutePlaceMappingUpdated routePlaceMappingUpdated = new RoutePlaceMappingUpdated();
//								routePlaceMappingUpdated.setPlace(p);
//								routePlaceMappingUpdated.setRoute(routeUpdated);
//
//								try{
//
//									String startTimeSource = hour[i]+":"+minute[c]+":00";
//									Date d1 = new SimpleDateFormat(string, Locale.ENGLISH).parse(startTimeSource);
//									routePlaceMappingUpdated.setArrivalTime(d1);
//
//								}catch (Exception e) {
//									System.out.println("Exception Parsing date : "+e.getMessage());
//								}
//								routePlaceMappingUpdated.setSequenceArrivalAtPlace(""+i);
//								boolean rpmuSaveStatus = transportServiceUpdated.saveRoutePlaceMapping(routePlaceMappingUpdated);
//								if(!rpmuSaveStatus){
//									flag = 1;
//									break;
//								}
//
//							}else{
//								mnv.addObject("status", "Place not found");							
//							}
//						}
//
//						if(flag==1){
//							mnv.addObject("status", "Fail to add Route-Place-Mapping, Please try again");
//						}else{
//							mnv.addObject("status", "Route-Plcae Mapping added successfully.");
//						}
//					}else{
//						mnv.addObject("status", "Fail to add Route-Driver-Vehicle-Mapping, Please try again");
//					}
//				}else{
//					mnv.addObject("status", "No Route Found by Given Route Name");
//				}
//			}else{
//				mnv.addObject("status", "Technical error (Failed to fetch Driver-Vehicle Mapping), Please try again");
//			}
//
//		}else{
//			mnv.addObject("status", "Some Parameter are missing, Please try again");
//		}
//
//
//		List<RouteDetailsHelper> listOfAllRouteData = transportServiceUpdated.getAllRouteDetailsWithInBetweenPlacesAndRouteDriverVehicleMapping(TransportConstants.REGULAR_CAB);
//		mnv.addObject("request", "modifyRoutePlace");
//		mnv.addObject("listOfAllRouteData", listOfAllRouteData);
//
//		return mnv;	
//	}
//
//
//
//	@RequestMapping(value="/routeManipulationPlace")
//	public ModelAndView getRouteManipulationPage(HttpServletRequest request) {
//
//		ModelAndView mnv = new ModelAndView("adminPages/routeManipulationPlace");
//
//		if(request.getParameter("request")!=null && request.getParameter("request").equals("addRoutePlace")){
//
//			List<PlaceUpdated> listOfAllPlaces = transportServiceUpdated.getAllPlace();
//			mnv.addObject("listOfAllPlaces", listOfAllPlaces);
//
//			List<DriverVehicleMappingUpdated> listOfDriverVehicleMappingUpdated = transportServiceUpdated.getAllDriverVehicleMapping();
//			mnv.addObject("listOfDriverVehicleMappingUpdated", listOfDriverVehicleMappingUpdated);
//
//			List<RouteUpdated> listOfRoute = transportServiceUpdated.getAllRoute();
//			mnv.addObject("listOfRoute", listOfRoute);
//
//
//
//			//			List<VehicleUpdated> listOfAllVehicles = transportServiceUpdated.getAllVehicles();
//			//			mnv.addObject("listOfAllVehicles", listOfAllVehicles);
//			//			
//			//			List<DriverUpdated> listOfAllDrivers = transportServiceUpdated.getAllDriver();
//			//			mnv.addObject("listOfAllDrivers", listOfAllDrivers);
//
//			mnv.addObject("request", "addRoutePlace");
//
//		}
//		if(request.getParameter("request")!=null && request.getParameter("request").equals("modifyRoutePlace")){
//			List<RouteDetailsHelper> listOfAllRouteData = transportServiceUpdated.getAllRouteDetailsWithInBetweenPlacesAndRouteDriverVehicleMapping(TransportConstants.REGULAR_CAB);
//			mnv.addObject("request", "modifyRoutePlace");
//			mnv.addObject("listOfAllRouteData", listOfAllRouteData);
//		}
//		return mnv;	
//	}
//
//
//	@RequestMapping(value="/modifyOrDeleteRoutePlace")
//	public ModelAndView modifyOrDeleteRoute(HttpServletRequest request) {
//		System.out.println("AdminRouteManipulation.modifyOrDeleteRoute()");
//		ModelAndView mnv = new ModelAndView();
//		String routeId = request.getParameter("routeId");
//
//		if(routeId!=null && !routeId.equals("")){
//
//			if(request.getParameter("request")!=null && request.getParameter("request").equals("modifyRoutePlaceRequest")){
//
//				mnv.setViewName("adminPages/routeManipulationPlaceModify");
//
//				RouteDetailsHelper routePlaceData = transportServiceUpdated.
//						getAllRouteDetailsWithInBetweenPlacesAndRouteDriverVehicleMappingByRouteId(Long.parseLong(routeId), TransportConstants.REGULAR_CAB);
//
//				List<PlaceUpdated> listOfAllPlaces = transportServiceUpdated.getAllPlace();
//				mnv.addObject("listOfAllPlaces", listOfAllPlaces);
//
//				List<DriverVehicleMappingUpdated> listOfDriverVehicleMappingUpdated = transportServiceUpdated.getAllDriverVehicleMapping();
//				mnv.addObject("listOfDriverVehicleMappingUpdated", listOfDriverVehicleMappingUpdated);
//
//				List<RouteUpdated> listOfRoute = transportServiceUpdated.getAllRoute();
//				mnv.addObject("listOfRoute", listOfRoute);
//
//
//				mnv.addObject("request", "modifyRoutePlaceDetails");
//				mnv.addObject("routePlaceData", routePlaceData);
//
//			}
//
//			/*			if(request.getParameter("request")!=null && request.getParameter("request").equals("delete")){
//				boolean status = transportServiceUpdated.deleteVehicleByVehicleId(Long.parseLong(vehicleId));
//
//				List<VehicleUpdated> listOfAllVehicles = transportServiceUpdated.getAllVehicles();
//				mnv.addObject("listOfAllVehicles", listOfAllVehicles);				
//				mnv.addObject("request", "modifyVehicle");
//
//				if(status){
//					mnv.addObject("status", "Vehicle deleted successfully.");
//				}else{
//					mnv.addObject("status", "Fail to delete vehicle, Please try again");
//				}
//
//			}
//			 */		
//		}else{
//			mnv.addObject("status", "Some Parameters is invalid, Please give proper data to save.");
//		}
//
//		return mnv;	
//	}
//
//
//
//
//
//	@RequestMapping(value="/modifyRoutePlaceData")
//	public ModelAndView modifyRoute(HttpServletRequest request) {
//
//		ModelAndView mnv = new ModelAndView("adminPages/routeManipulationPlace");
//		String routeId = request.getParameter("routeId");
//
//		if(routeId!=null){
//
//			RouteUpdated routeUpdated = transportServiceUpdated.getRouteByRouteId(Long.parseLong(routeId));
//			if(routeUpdated!=null){
//
//				String[] hour = request.getParameterValues("time_hour");
//				String[] minute = request.getParameterValues("time_minute");	
//				String[] place = request.getParameterValues("place");
//				//String routeType = request.getParameter("routeType");
//				String driverVehicleMappingId = request.getParameter("driverVehicleMappingId");
//
//
//
////				if( (routeType!=null && (routeType.equals("regular") || routeType.equals("night"))) && 
////						driverVehicleMappingId!=null && !driverVehicleMappingId.trim().equals("")){
//
//					DriverVehicleMappingUpdated dvmu = transportServiceUpdated.getDriverVehicleMappingById(Long.parseLong(driverVehicleMappingId));
//
//
//					if(dvmu!=null){
//
//						int flag = 0;
//
//						RouteDriverVehicleMappingUpdated rdvmu = transportServiceUpdated.getRouteDriverVehicleMappingUpdatedByRouteId(Long.parseLong(routeId));
//						rdvmu.setDriverVehicleMappingUpdated(dvmu);
//						rdvmu.setRoute(routeUpdated);
//
//						boolean rdvmuSaveStatus = transportServiceUpdated.updateRouteDriverVehicleMappingUpdated(rdvmu);
//
//						if(rdvmuSaveStatus){
//
//							//DELETE ALL ROUTE-PLACE MAPPING AND ADD FRESH GIVEN BY USER
//							boolean routePlaceDelResult = transportServiceUpdated.deleteAllInBetweenPlaceOfRouteByRouteId(Long.parseLong(routeId));
//							//boolean routePlaceDelResult = transportServiceUpdated.deleteAllInBetweenPlaceOfRouteByRouteObject(routeUpdated);
//
//							if(routePlaceDelResult){
//
//								String string = "HH:mm:ss";
//								for (int i=0, j=0 , c=0; i < hour.length && j<place.length && c<minute.length; i++, j++, c++) {
//
//									PlaceUpdated p = transportServiceUpdated.getPlacebyPlaceId(Long.parseLong(place[i]));
//
//									if(p!=null){
//
//
//										RoutePlaceMappingUpdated routePlaceMappingUpdated = new RoutePlaceMappingUpdated();
//										routePlaceMappingUpdated.setPlace(p);
//										routePlaceMappingUpdated.setRoute(routeUpdated);
//
//										try{
//
//											String startTimeSource = hour[i]+":"+minute[c]+":00";
//											Date d1 = new SimpleDateFormat(string, Locale.ENGLISH).parse(startTimeSource);
//											routePlaceMappingUpdated.setArrivalTime(d1);
//
//										}catch (Exception e) {
//											System.out.println("Exception Parsing date : "+e.getMessage());
//										}
//										routePlaceMappingUpdated.setSequenceArrivalAtPlace(""+(i+1));
//										boolean rpmuSaveStatus = transportServiceUpdated.saveRoutePlaceMapping(routePlaceMappingUpdated);
//
//										if(!rpmuSaveStatus){
//											flag = 1;
//											break;
//										}
//
//									}else{
//										mnv.addObject("status", "Place not found");
//										break;
//									}
//								}
//								if(flag==1){
//									mnv.addObject("status", "Fail to add Route-Place-Mapping, Please try again");
//								}else{
//									mnv.addObject("status", "Route Updated Successfully");
//								}
//							}else{
//								mnv.addObject("status", "Fail to delete Route-Place-Mapping, Please try again");
//							}
//
//						}else{
//							mnv.addObject("status", "Fail to add Route-Driver-Vehicle-Mapping, Please try again");
//						}
//					}else{
//						mnv.addObject("status", "Technical error (Failed to fetch Driver-Vehicle Mapping), Please try again");
//					}
//
////				}else{
////					mnv.addObject("status", "Some Parameter are missing, Please try again");
////				}
//			}else{
//				mnv.addObject("status", "Roote by given ID Not found");
//			}
//
//		}else{
//			mnv.addObject("status", "Some Parameter are missing, Please try again");
//		}
//
//		List<RouteDetailsHelper> listOfAllRouteData = transportServiceUpdated.getAllRouteDetailsWithInBetweenPlacesAndRouteDriverVehicleMapping(TransportConstants.REGULAR_CAB);
//		mnv.addObject("request", "modifyRoutePlace");
//		mnv.addObject("listOfAllRouteData", listOfAllRouteData);
//
//		return mnv;	
//	}
//
//
//	/*			boolean routeDeleteStatus = transportServiceUpdated.deleteRouteByRouteId(Long.parseLong(routeId));
//
//			if(routeDeleteStatus){
//
//				String[] hour = request.getParameterValues("time_hour");
//				String[] minute = request.getParameterValues("time_minute");
//
//				//String[] time = request.getParameterValues("time");
//				String[] place = request.getParameterValues("place");
//				String vehicle = request.getParameter("vehicle");
//				String routeName = request.getParameter("routeName");
//
//				for (int i=0, j=0 , c=0; i < hour.length && j<place.length && c<minute.length; i++, j++, c++) {
//					System.out.println("TIME hour :"+ hour[i] + " min: "+minute[c] +  " PLACE :"+ place[j]);
//				}
//
//				System.out.println("Vehicle :"+vehicle);
//				System.out.println("Route Name :"+routeName);
//
//
//				RouteUpdated routeUpdated = new RouteUpdated();
//				routeUpdated.setRouteStartPlace(place[0]);
//
//				try{
//					String startTimeSource = hour[0]+":"+minute[0]+":00";
//					String string = "HH:mm:ss";
//					Date d1 = new SimpleDateFormat(string, Locale.ENGLISH).parse(startTimeSource);
//					System.out.println("D1 :"+d1);
//					routeUpdated.setSourceStartTime(d1);
//
//
//					String startTimeDestination = hour[hour.length-1]+":"+minute[minute.length-1]+":00";
//					Date d2 = new SimpleDateFormat(string, Locale.ENGLISH).parse(startTimeDestination);
//					System.out.println("D2 :"+d2);
//					routeUpdated.setDestinationStartTime(d2);
//				}catch (Exception e) {
//					System.out.println("Exception Parsing date : "+e.getMessage());
//				}
//
//				routeUpdated.setRouteDetinationPlace(place[place.length-1]);
//				routeUpdated.setRouteName(routeName);
//
//				boolean routeSaveStatus = transportServiceUpdated.saveRoute(routeUpdated);
//				boolean placeSaveStatus=true;
//
//				if(routeSaveStatus){
//					RouteUpdated route = transportServiceUpdated.getRouteByRouteName(routeName);
//
//
//					String string = "HH:mm:ss";
//					for (int i=0, j=0 , c=0; i < hour.length && j<place.length && c<minute.length; i++, j++, c++) {
//
//						PlaceUpdated p1 = new PlaceUpdated();
//						p1.setPlaceName(place[i]);
//						p1.setRoute(route);
//
//						try{
//
//							String startTimeSource = hour[i]+":"+minute[c]+":00";
//							Date d1 = new SimpleDateFormat(string, Locale.ENGLISH).parse(startTimeSource);
//							p1.setArrivalTime(d1);
//
//						}catch (Exception e) {
//							System.out.println("Exception Parsing date : "+e.getMessage());
//						}
//						p1.setSequenceArrivalOfPlace(""+(i+1));
//
//						placeSaveStatus = transportServiceUpdated.savePlace(p1);
//
//						if(!placeSaveStatus){
//							placeSaveStatus=false;
//							break;
//						}
//
//						System.out.println("TIME hour :"+ hour[i] + " min: "+minute[c] +  " PLACE :"+ place[j]);
//					}
//				}else{
//					mnv.addObject("status", "Fail to add Route, Please try again");
//				}
//
//				if(!placeSaveStatus){
//					mnv.addObject("status", "Fail to add Route, Please try again");
//
//				}else{
//					List<RouteUpdated> listOfAllRouteData = transportServiceUpdated.getAllRouteData(TransportConstants.REGULAR_CAB);
//					mnv.addObject("request", "modifyRoute");
//					mnv.addObject("listOfAllRouteData", listOfAllRouteData);
//					mnv.addObject("status", "Route modified successfully");
//				}
//
//			}else{
//				mnv.addObject("status", "Fail to add Route, Please try again");
//			}*/
//
//	//		}else{
//	//			mnv.addObject("status", "Some Parameters is invalid, Please give proper data to save.");
//	//		}
//	//
//	//		return mnv;	
//	//	}
//
//
//}
