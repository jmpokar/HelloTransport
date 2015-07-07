package com.corporate.transport.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.transportdb.backend.TransportServiceUpdated;
import com.corporate.transportdb.dto.updated.News;


@Controller("AdminNewsManipulation")
@RequestMapping("/transport/admin/an")
public class AdminNewsManipulation {


	@Autowired
	private TransportServiceUpdated transportServiceUpdated;


	public TransportServiceUpdated getTransportServiceUpdated() {
		return transportServiceUpdated;
	}

	public void setTransportServiceUpdated(
			TransportServiceUpdated transportServiceUpdated) {
		this.transportServiceUpdated = transportServiceUpdated;
	}


	@RequestMapping(value="/newsManipulation")
	public ModelAndView newsManipulation (HttpServletRequest request) {

		System.out.println("AdminNewsManipulation.addNews()");

		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/newsManipulation");

		String requestFor = request.getParameter("request");

		System.out.println("Request :"+requestFor);

		if(requestFor!=null && requestFor.equals("addNews")){
			mnv.addObject("request", "addNews");
			System.out.println("Adding News");

		}
		else if(requestFor!=null && requestFor.equals("modifyNews")){
			mnv.addObject("request", "modifyNews");
			List<News> listOfNews = transportServiceUpdated.getAllNews();
			mnv.addObject("listOfNews", listOfNews);

		}
		else if(requestFor!=null && requestFor.equals("modifyNewsDetails")){

			String newsId = request.getParameter("newsId");

			if(newsId!=null && !newsId.trim().equals("")){
				News news = transportServiceUpdated.getNewsByNewsId(Long.parseLong(newsId));
				if(news!=null){
					mnv.addObject("newsUpdated", news);
				}else{
					mnv.addObject("status", "No News Found by Given Name");
				}
			}
			mnv.addObject("request", "modifyNewsDetails");
		}

		System.out.println("returning");				
		return mnv;	
	}



	@RequestMapping(value="/addNews")
	public ModelAndView addNews(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/newsManipulation");

		String newsSubject = request.getParameter("newsSubject");
		String newsContent = request.getParameter("newsContent");
		String newsActiveDateString = request.getParameter("activeDate");
		String newsExpiryDateString = request.getParameter("expiryDate");

		
		System.out.println("NEWS TO ADD IS :"+newsSubject + newsContent + newsActiveDateString + newsExpiryDateString);
		
		if(newsSubject!=null && !newsSubject.trim().equals("") && newsContent!=null && !newsContent.trim().equals("") && newsActiveDateString!=null && !newsActiveDateString.trim().equals("") && newsExpiryDateString!=null && !newsExpiryDateString.trim().equals("")){
			News news = new News();
			news.setNewsSubject(newsSubject);
			news.setNewsContent(newsContent);

			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-mm-yy"); 
			try{

				Date newsActiveDate = dateFormat.parse(newsActiveDateString); 
				Date newsExpiryDate = dateFormat.parse(newsExpiryDateString); 

				news.setNewsActiveFromDate(newsActiveDate);
				news.setNewsActiveTillDate(newsExpiryDate);

			}catch(Exception e){
				System.out.println("News Parsing Exception");	
			}

			System.out.println("Reach 1");
			transportServiceUpdated.saveNews(news);
			mnv.addObject("status", "News added successfully");
			
			System.out.println("Reach 2");
			
			mnv.addObject("request", "modifyNews");
			List<News> listOfNews = transportServiceUpdated.getAllNews();
			mnv.addObject("listOfNews", listOfNews);

			System.out.println("Reach 3");
			
		}else{
			mnv.addObject("status", "Please provide News Name...");
		}

		System.out.println("Reach 4");
		return mnv;	
	}


	@RequestMapping(value="/modifyNews")
	public ModelAndView modifyNews(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/newsManipulation");

		String newsId = request.getParameter("newsId");

		if(newsId!=null && !newsId.trim().equals("")){
			News news = transportServiceUpdated.getNewsByNewsId(Long.parseLong(newsId));

			if(news!=null){

				String newsSubject = request.getParameter("newsSubject");
				String newsContent = request.getParameter("newsContent");
				String newsActiveDateString = request.getParameter("activeDate");
				String newsExpiryDateString = request.getParameter("expiryDate");

				System.out.println("NEWS TO MODIFY IS :"+newsSubject + newsContent + newsActiveDateString + newsExpiryDateString);
				news.setNewsSubject(newsSubject);
				news.setNewsContent(newsContent);
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd-mm-yy"); 
				try{

					Date newsActiveDate = dateFormat.parse(newsActiveDateString); 
					Date newsExpiryDate = dateFormat.parse(newsExpiryDateString); 

					news.setNewsActiveFromDate(newsActiveDate);
					news.setNewsActiveTillDate(newsExpiryDate);


				}catch(Exception e){
					System.out.println("News Parsing Exception");	
				}
				
				boolean placeUpdateFlag = transportServiceUpdated.updateNews(news);

				mnv.addObject("request", "modifyNews");
				List<News> listOfNews = transportServiceUpdated.getAllNews();
				mnv.addObject("listOfNews", listOfNews);

				if(placeUpdateFlag){
					mnv.addObject("status", "News modified Successfully");
				}else{
					mnv.addObject("status", "Error while modifying News, Please try again.");
				}

			}else{
				mnv.addObject("status", "No News Found by Given Name");
			}
		}else{
			mnv.addObject("status", "Please provide News Name...");
		}

		return mnv;	
	}


	@RequestMapping(value="/deleteNews")
	public ModelAndView deleteNews(HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView("viewsTransport/adminPages/newsManipulation");

		String newsId = request.getParameter("newsId");

		if(newsId!=null && !newsId.trim().equals("")){
			News news = transportServiceUpdated.getNewsByNewsId(Long.parseLong(newsId));

			if(news!=null){
				boolean deleteFlag = transportServiceUpdated.deleteNews(news);

				if(deleteFlag){
					mnv.addObject("request", "modifyNews");
					List<News> listOfNews = transportServiceUpdated.getAllNews();
					mnv.addObject("listOfNews", listOfNews);

					mnv.addObject("status", "News Deleted Successfully.");
				}else{
					mnv.addObject("status", "No News Found by Given Name");
				}

			}else{
				mnv.addObject("status", "No News Found by Given Name");
			}

		}else{
			mnv.addObject("status", "Please provide News Name...");
		}

		return mnv;	
	}
}
