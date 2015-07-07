package com.corporate.carpool.email;

import org.springframework.web.servlet.ModelAndView;

import com.corporate.carpooldb.dto.User;

public interface Email {

	public ModelAndView emailSentSuccessfully(User userWithResetPasswordToSave, int criteria);
	public ModelAndView emailSentFailure(User userWhosePassworddetailsToRollback, int criteria);
}
