package com.corporate.transport.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.News;
import com.corporate.transportdb.dto.updated.RouteUpdated;

@Controller
public class AndroidHomeController {


	@Autowired
	private TransportServiceUpdated transportServiceUpdated;


	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}


	@RequestMapping(value="/androidGetAllRoute", method = RequestMethod.GET)
	public void androidGetAllRoute(HttpServletRequest req, HttpServletResponse resp) {
		try {

			JSONObject jsonObject = new JSONObject();
			
			List<RouteUpdated> listOfAllRoute = transportServiceUpdated.getAllRoute();
			String jsonString = null;
			if(listOfAllRoute!=null){
				
//				for (RouteUpdated routeUpdated : listOfAllRoute) {
//					JSONObject json = new JSONObject();
//					json.put("routeId", routeUpdated.getRouteId());
//					json.put("routeName", routeUpdated.getRouteName());
//					
//					Gson gson = new Gson();
//					jsonString = gson.toJson(json);	
//				}

				Gson gson = new Gson();
				jsonString = gson.toJson(listOfAllRoute);	
				
			}		
			System.out.println(jsonString);
			
			resp.getOutputStream().write(jsonString.getBytes());

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
