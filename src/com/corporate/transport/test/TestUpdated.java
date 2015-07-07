package com.corporate.transport.test;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.corporate.transportdb.dto.updated.PlaceUpdated;

import com.corporate.transportdb.dto.updated.RouteDriverVehicleMappingUpdated;
import com.corporate.transportdb.dto.updated.RouteUpdated;
import com.corporate.transportdb.dto.updated.UserRouteMappingUpdated;
import com.corporate.transportdb.dto.updated.UserUpdated;


public class TestUpdated {

	public static void main(String[] args) {

		System.out.println("Hibernate One-To-One example (Annotation)");
		new TestUpdated();

		//	        SessionFactory sf = HibernateUtil.getSessionFactory();
		//	        Session session = sf.openSession();
		//	        session.beginTransaction();


		//	        List<User> employees = session.createQuery("from User").list();
		//	        for (User employee1 : employees) {
		//	            System.out.println(employee1.getUserName());
		//	        }



		//GET ALL USER DETAILS
		//GET ALL DRIVER DETAILS	        
		//GET ALL ROUTE DETAILS
		//GET ALL USER GOING BY ROUTE X
		//GET ALL BUS WHICH STOPS AT X PLACE
		//GET ALL VEHICLE DETAILS
		//GET ALL USER WHICH IS ACTIVE/NON ACTIVE FOR TRANSPORT 

		//UPDATE USER DATA
		//UPDATE USER ROUTE DETAILS
		//UPDATE ROUTE IN BETWEEN PLACE 
		//UPDATE ROUTE IN BETWEEN PLACE TIME
		//UPDATE VEHICLE DETAILS
		//UPDATE DRIVER DETAILS


		//DELETE ROUTE
		//DELETE USER
		//DELETE VEHICLE
		//DELETE DELETE DRIVER





		//	        String hql = "FROM BusDriverVehicleRouteMapping E WHERE E.busDriver.driverName = :employee_id";
		//	        org.hibernate.Query query = session.createQuery(hql);
		//	        query.setParameter("employee_id","Ganga Reddy");
		//	        
		//	       
		//	        List<BusDriverVehicleRouteMapping> employees = query.list();
		//	        
		//	        for (BusDriverVehicleRouteMapping employee1 : employees) {
		//	            System.out.println(employee1.getVehicle().getVehicleCapacity());
		//	        }
		//
		//	 
		//	        session.getTransaction().commit();
		//	        session.close();

	}

	public TestUpdated() {
		//getAllUser();
		//getUserByUserName("jayesh1");
		//getAllUserByRoute("route 1");
		//getCompleteTravellerDetailsByRoute("route 1");
		//getAllInBetweenPlaceOfRoute("roiute 1");
		//getDriverDetailsByRoute("roiute 1");
		//getAllRouteDetails();
	}

	
	


/*	private RouteDetailsUpdated getCompleteTravellerDetailsByRoute(String routeName){

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();


		String hql1 = "FROM RouteUpdated route where route.routeName = :routeName";
		org.hibernate.Query query1 = session.createQuery(hql1);
		query1.setParameter("routeName",routeName);
		List<RouteUpdated> listORoutes = query1.list();

		//for (int i = 0; i < listORoutes.size(); i++) {

		RouteDetailsUpdated routeDetailsUpdated=null;
		if(listORoutes!=null && listORoutes.size()>0){

			RouteUpdated route = listORoutes.get(0);

			String hql2 = "FROM PlaceUpdated place where route.routeName = :routeName";
			org.hibernate.Query query2 = session.createQuery(hql2);
			query2.setParameter("routeName",routeName);
			List<PlaceUpdated> listOfPlaceUpdated = query2.list();


			String hql3 = "FROM UserRouteMappingUpdated urm where urm.route.routeName = :routeName";
			org.hibernate.Query query3 = session.createQuery(hql3);
			query3.setParameter("routeName",routeName);
			List<UserRouteMappingUpdated> listOfUserRouteMappingUpdated = query3.list();


			String hql4 = "FROM RouteDriverMappingUpdated rdm where rdm.route.routeName = :routeName";
			org.hibernate.Query query4 = session.createQuery(hql4);
			query4.setParameter("routeName",routeName);
			List<RouteDriverVehicleMappingUpdated> listOfDriverMappingUpdated = query4.list();


			routeDetailsUpdated = new RouteDetailsUpdated();
			routeDetailsUpdated.setRoute(route);
			routeDetailsUpdated.setListOfPlaceUpdated(listOfPlaceUpdated);
			routeDetailsUpdated.setListOfUserRouteMappingUpdated(listOfUserRouteMappingUpdated);
			if(listOfDriverMappingUpdated!=null && listOfDriverMappingUpdated.size()>0){
				routeDetailsUpdated.setRouteDriverMappingUpdated(listOfDriverMappingUpdated.get(0));
			}

		}
		//}

		System.out.println("Reached");


		session.getTransaction().commit();
		session.close();

		return routeDetailsUpdated;
	}

	private RouteDetailsUpdated getAllInBetweenPlaceOfRoute(String routeName){

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();

		String hql1 = "FROM RouteUpdated route where route.routeName = :routeName";
		org.hibernate.Query query1 = session.createQuery(hql1);
		query1.setParameter("routeName",routeName);
		List<RouteUpdated> listORoutes = query1.list();


		RouteDetailsUpdated routeDetailsUpdated=null;
		if(listORoutes!=null && listORoutes.size()>0){

			RouteUpdated route = listORoutes.get(0);

			String hql2 = "FROM PlaceUpdated place where route.routeName = :routeName";
			org.hibernate.Query query2 = session.createQuery(hql2);
			query2.setParameter("routeName",routeName);
			List<PlaceUpdated> listOfPlaceUpdated = query2.list();


			routeDetailsUpdated = new RouteDetailsUpdated();
			routeDetailsUpdated.setRoute(route);
			routeDetailsUpdated.setListOfPlaceUpdated(listOfPlaceUpdated);

		}


		System.out.println("Reached");




		session.getTransaction().commit();
		session.close();

		return routeDetailsUpdated;
	}



	private List<RouteDetailsUpdated> getAllRouteDetails(){

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();


		String hql1 = "FROM RouteUpdated route";
		org.hibernate.Query query1 = session.createQuery(hql1);
		List<RouteUpdated> listORoutes = query1.list();

		List<RouteDetailsUpdated> listOfRouteDetailsUpdated = new ArrayList<RouteDetailsUpdated>();

		if(listORoutes!=null && listORoutes.size()>0){

			for (int i = 0; i < listORoutes.size(); i++) {

				RouteUpdated route = listORoutes.get(i);

				String hql2 = "FROM PlaceUpdated place where route.routeName = :routeName";
				org.hibernate.Query query2 = session.createQuery(hql2);
				query2.setParameter("routeName",route.getRouteName());
				List<PlaceUpdated> listOfPlaceUpdated = query2.list();


				String hql3 = "FROM UserRouteMappingUpdated urm where urm.route.routeName = :routeName";
				org.hibernate.Query query3 = session.createQuery(hql3);
				query3.setParameter("routeName",route.getRouteName());
				List<UserRouteMappingUpdated> listOfUserRouteMappingUpdated = query3.list();


				String hql4 = "FROM RouteDriverMappingUpdated rdm where rdm.route.routeName = :routeName";
				org.hibernate.Query query4 = session.createQuery(hql4);
				query4.setParameter("routeName",route.getRouteName());
				List<RouteDriverVehicleMappingUpdated> listOfDriverMappingUpdated = query4.list();


				RouteDetailsUpdated routeDetailsUpdated = new RouteDetailsUpdated();
				routeDetailsUpdated.setRoute(route);
				routeDetailsUpdated.setListOfPlaceUpdated(listOfPlaceUpdated);
				routeDetailsUpdated.setListOfUserRouteMappingUpdated(listOfUserRouteMappingUpdated);
				if(listOfDriverMappingUpdated!=null && listOfDriverMappingUpdated.size()>0){
					routeDetailsUpdated.setRouteDriverMappingUpdated(listOfDriverMappingUpdated.get(0));
				}

				listOfRouteDetailsUpdated.add(routeDetailsUpdated);

			}
		}

		System.out.println("Reached");


		session.getTransaction().commit();
		session.close();

		return listOfRouteDetailsUpdated;

	}*/



}
