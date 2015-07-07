package com.corporate.transport.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.BusFare;
import com.corporate.transportdb.dto.updated.News;


@Controller("AdminBusFareController")
@RequestMapping("/transport/admin/ab")
public class AdminBusFareController {

	@Autowired
	private TransportServiceUpdated transportServiceUpdated;


	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}

	@RequestMapping(value="/getBusFare")
	public ModelAndView getBusFare(HttpServletRequest req, HttpServletResponse resp){
		System.out.println("ganesh");
		
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/busFare");
		BusFare busFare = transportServiceUpdated.getBusFare(1);
		mnv.addObject("busFare", busFare);	
		
		return mnv;

	}

	@RequestMapping(value="/modifyBusFare")
	public ModelAndView modifyBusFare(HttpServletRequest req, HttpServletResponse resp){
		System.out.println("ganesh");

		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/busFare");
		
		String newFare = req.getParameter("newFare");
		
		if(newFare!=null){
			BusFare busFare = transportServiceUpdated.getBusFare(1);
			busFare.setBusFareAmount(Integer.parseInt(newFare));
			boolean saveStatus = transportServiceUpdated.modifyBusFare(busFare);
			if(saveStatus){
				mnv.addObject("status", "Bus Fare updated successfully.");
			}else{
				mnv.addObject("status", "Error updating Bus Fare.");	
			}
		}
	
		BusFare busFare = transportServiceUpdated.getBusFare(1);
		mnv.addObject("busFare", busFare);	
		return mnv;
	}

}	
