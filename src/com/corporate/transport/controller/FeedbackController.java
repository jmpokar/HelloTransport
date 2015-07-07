package com.corporate.transport.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.FeedbackUpdated;
import com.corporate.transportdb.dto.updated.UserUpdated;
import com.corporate.transportdb.util.TransportConstants;

@Controller
public class FeedbackController {

	@Autowired
	private TransportServiceUpdated transportServiceUpdated;


	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}

	@RequestMapping(value = "/general.jsp")
	public ModelAndView submitFeedback(HttpServletRequest request, Principal principal){
		System.out.println("Request received to save feedback of Type General");
		System.out.println("feedback Contents :"+request.getParameter("feedback_field"));

		String userName = principal.getName();

		UserUpdated u = transportServiceUpdated.getUserByEmailId(userName);
		FeedbackUpdated feedbackUpdated = new FeedbackUpdated();
		feedbackUpdated.setFeedbackType(TransportConstants.FEEDBACK_GENERAL_COMMENT);
		feedbackUpdated.setFeedbackContents(request.getParameter("feedback_field"));
		feedbackUpdated.setUser(u);
		feedbackUpdated.setActive(TransportConstants.FEEDBACK_INACTIVE);

		boolean result = transportServiceUpdated.saveFeedback(feedbackUpdated);

		String status=null;
		if(result)
			status=TransportConstants.FEEDBACK_SAVING_SUCCESS;
		else
			status=TransportConstants.FEEDBACK_SAVING_FAILURE;

		ModelAndView modelAndView = new ModelAndView("redirect:home.jsp");
		modelAndView.addObject("feedbackSavingResult", status);

		System.out.println("Request completed to save feedback of Type General");

		return modelAndView;	
	}

	@RequestMapping(value = "/suggestion.jsp")
	public ModelAndView submitSuggestion(HttpServletRequest request, Principal principal){
		System.out.println("Request received to save feedback of Type Suggestion");
		System.out.println("feedback Contents :"+request.getParameter("feedback_field"));


		System.out.println("Parameters are 1:"+request.getQueryString());
		System.out.println("Parameters are 2:"+request.getParameterMap().toString());
		System.out.println("Parameters are 3:"+request.getParameterNames().toString());

		String userName = principal.getName();
		UserUpdated u = transportServiceUpdated.getUserByEmailId(userName);
	
		FeedbackUpdated feedbackUpdated = new FeedbackUpdated();
		feedbackUpdated.setFeedbackType(TransportConstants.FEEDBACK_SUGGESTION);
		feedbackUpdated.setFeedbackContents(request.getParameter("feedback_field"));
		feedbackUpdated.setUser(u);
		feedbackUpdated.setActive(TransportConstants.FEEDBACK_INACTIVE);

		boolean result = transportServiceUpdated.saveFeedback(feedbackUpdated);

		String status=null;
		if(result)
			status=TransportConstants.FEEDBACK_SAVING_SUCCESS;
		else
			status=TransportConstants.FEEDBACK_SAVING_FAILURE;


		ModelAndView modelAndView = new ModelAndView("redirect:home.jsp");
		modelAndView.addObject("feedbackSavingResult", status);

		System.out.println("Request completed to save feedback of Type Suggestion");
		return modelAndView;	
	}


	@RequestMapping(value = "/problem.jsp")
	public ModelAndView submitProblem(HttpServletRequest request, Principal principal){
		System.out.println("Request received to save feedback of Type Problem");
		System.out.println("feedback Contents :"+request.getParameter("feedback_field"));

		String userName = principal.getName();
		UserUpdated u = transportServiceUpdated.getUserByEmailId(userName);

		FeedbackUpdated feedbackUpdated = new FeedbackUpdated();
		feedbackUpdated.setFeedbackType(TransportConstants.FEEDBACK_PROBLEM);
		feedbackUpdated.setFeedbackContents(request.getParameter("feedback_field"));
		feedbackUpdated.setUser(u);
		feedbackUpdated.setActive(TransportConstants.FEEDBACK_INACTIVE);

		boolean result = transportServiceUpdated.saveFeedback(feedbackUpdated);

		String status=null;
		if(result)
			status=TransportConstants.FEEDBACK_SAVING_SUCCESS;
		else
			status=TransportConstants.FEEDBACK_SAVING_FAILURE;

		ModelAndView modelAndView = new ModelAndView("redirect:home.jsp");
		modelAndView.addObject("feedbackSavingResult", status);

		System.out.println("Request completed to save feedback of Type Problem");
		return modelAndView;	
	}


	@RequestMapping(value = "/praise.jsp")
	public ModelAndView submitPraise(HttpServletRequest request, Principal principal){
		System.out.println("Request received to save feedback of Type Praise");
		System.out.println("feedback Contents :"+request.getParameter("feedback_field"));

		String userName = principal.getName();
		UserUpdated u = transportServiceUpdated.getUserByEmailId(userName);

		FeedbackUpdated feedbackUpdated = new FeedbackUpdated();
		feedbackUpdated.setFeedbackType(TransportConstants.FEEDBACK_PRAISE);
		feedbackUpdated.setFeedbackContents(request.getParameter("feedback_field"));
		feedbackUpdated.setUser(u);
		feedbackUpdated.setActive(TransportConstants.FEEDBACK_INACTIVE);

		boolean result = transportServiceUpdated.saveFeedback(feedbackUpdated);

		String status=null;
		if(result)
			status=TransportConstants.FEEDBACK_SAVING_SUCCESS;
		else
			status=TransportConstants.FEEDBACK_SAVING_FAILURE;

		ModelAndView modelAndView = new ModelAndView("redirect:home.jsp");
		modelAndView.addObject("feedbackSavingResult", status);

		System.out.println("Request completed to save feedback of Type Praise");
		return modelAndView;	
	}

}
