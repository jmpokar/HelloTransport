package com.corporate.carpool.util;

import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;

public class PropertiesUtil {

	private static Logger log = Logger.getLogger(PropertiesUtil.class);

	private Properties properties = null;

	public PropertiesUtil() {
		log.debug("Inside default Constructor");
		log.debug("Going to read properties file server.properties started");

		try{
			properties = new Properties();
			properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("carpool.properties"));

			log.debug("reading properties file server.properties completed :"+properties);

		}catch(IOException e){
			e.printStackTrace();
			log.error("Not able to read properties file carpool.properties.");
		}

	}
	
	
	/**
	 * This function returns the Value of the Key provided.
	 * @param key key aginst which properties file will be checked for corresponding value.
	 * @return String value of the key.
	 */
	public String getValueOfKeyProvided(String key){
		log.debug("Request came for value having key :"+key);
		if(properties!=null){
			String value = properties.getProperty(key);
			log.debug("Returning response value :"+ value +" having key :"+key);
			return value;
		}
		log.debug("Returning from function as not able to read properties file");
		return null;
	}
	
}
