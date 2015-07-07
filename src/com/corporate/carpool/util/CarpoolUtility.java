package com.corporate.carpool.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.log4j.Logger;

import com.corporate.carpool.controller.DashboardController;

public class CarpoolUtility {

	private static Logger log = Logger.getLogger(CarpoolUtility.class);

	public static String constructTargetFileName(String userName, String contentType) {
		int baseFileName = 1;
		String targetFilePath = userName + baseFileName + "." +contentType;
		while ((new File(targetFilePath)).exists()) {
			baseFileName++;
			targetFilePath = userName + baseFileName + "." + contentType;
		}

		log.debug("Returning path :"+(userName + baseFileName + "." + contentType));
		return (userName + baseFileName + "." + contentType);
	}


	/**
	 * Writes the contents of the given byte array to a file given by the
	 * 'targetFilePath'
	 * 
	 * @param input
	 * @param targetFilePath
	 * @param append
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static String copyFile(byte[] input, String targetFilePath,
			boolean append) throws FileNotFoundException, IOException {
		log.debug("Request received to copy bytes to a file.");
		
		log.debug("bytes : "+input);
		log.debug("target file path : "+targetFilePath);
		log.debug("append : "+append);
		
		
		File targetFile = new File(targetFilePath);
		log.debug("File Object is :"+targetFilePath);
		
		
		if (!targetFile.exists()) {
			log.debug("Target file Not Exist, So going to create one");
			log.debug("Parent of target is :"+targetFile.getParent());
			
			File parentDir = new File(targetFile.getParent());
			
			log.debug("ParentDir object is : "+parentDir);
			
			if (!parentDir.exists()) {
				log.debug("Parent Dir exist");
				if(parentDir.mkdirs()){
					log.debug("Creating Parent Dir");
				}else{
					log.debug("Failed creating parent Dir");
				}
			}else{
				log.debug("Parent Dir doesn't exist.");
			}
			
			if(targetFile.createNewFile()){
				log.debug("Creating New File.");
			}else{
				log.debug("Failed creating new File");
			}
		}else{
			log.debug("Target file Exist");
		}
		log.debug("Now Writing bytes to a file.");
		InputStream in = new ByteArrayInputStream(input);
		OutputStream out = new FileOutputStream(targetFile, append);

		byte[] buf = new byte[1024];
		int len;
		while ((len = in.read(buf)) > 0) {
		//	log.debug("Writing bytes :"+len);
			out.write(buf, 0, len);
		}
		
		log.debug("Writing bytes completed");
		in.close();
		out.close();
		
		return targetFile.getAbsolutePath();
	}


	public static String getGenderAsString(int genderCode){
		String gender = null;
		if(genderCode==0){
			gender="male";
		}else{
			gender="female";
		}
		return gender;
	}
}
