package com.corporate.carpool.dto;

import java.util.Map;

public class GoogleAutocompletePrediction {

	private String placeName;
	private Map<String, String> hashMapOfTerms=null;

	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public Map<String, String> getHashMapOfTerms() {
		return hashMapOfTerms;
	}
	public void setHashMapOfTerms(Map<String, String> hashMapOfTerms) {
		this.hashMapOfTerms = hashMapOfTerms;
	}
	
}
