package com.corporate.carpool.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.corporate.carpooldb.dto.CarpoolerPreference;
import com.corporate.carpooldb.dto.SourceToDestinationDetails;

public class UICarpooler implements Serializable{

	private static final long serialVersionUID = -3962963503543790966L;
	
	private long carpoolerId;
	private String photoOfCarpooler;
	private String nameOfCarpooler;
	private String emailIdOfCarpooler;
	private int gender;
	private Date dob;
	private String primaryContactNumber=null;
	private String secondarContactNumber=null;
	
	
	private List<SourceToDestinationDetails> listOfSourceToDestinationDetails=null;
	private CarpoolerPreference carpoolerPreference=null;
	
	private String carpoolingWhen;
	private String daysIfCarpoolingOnDays;
	private String daysIfCarpoolingOnDaysReturn;
	
	private String dateIfCarpoolingOnDates;
	private String dateIfCarpoolingOnDatesReturn;
	
	private String sourceLeavingTime;
	private String sourceLeavingTimeReturn;
	
	private String carpoolOneWayOrTwoWay;
	private String carpoolReturnRouteSameOrNot;
	
	private String wantToBeHiddenFromRoute;
	private String sourcePLace;
	private String destinationPLace;
	private String inBetweenPLace;
	
	private String wantToBeHiddenFromRouteReturn;
	private String sourcePLaceReturn;
	private String destinationPLaceReturn;
	private String inBetweenPLaceReturn;
	

	private String genderPreference;
	private String contactPreference;
	private String compensation;
	
	private String compensationAmount;
	

	

	public String getPrimaryContactNumber() {
		return primaryContactNumber;
	}
	public void setPrimaryContactNumber(String primaryContactNumber) {
		this.primaryContactNumber = primaryContactNumber;
	}
	public String getSecondarContactNumber() {
		return secondarContactNumber;
	}
	public void setSecondarContactNumber(String secondarContactNumber) {
		this.secondarContactNumber = secondarContactNumber;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getEmailIdOfCarpooler() {
		return emailIdOfCarpooler;
	}
	public void setEmailIdOfCarpooler(String emailIdOfCarpooler) {
		this.emailIdOfCarpooler = emailIdOfCarpooler;
	}
	public List<SourceToDestinationDetails> getListOfSourceToDestinationDetails() {
		return listOfSourceToDestinationDetails;
	}
	public void setListOfSourceToDestinationDetails(
			List<SourceToDestinationDetails> listOfSourceToDestinationDetails) {
		this.listOfSourceToDestinationDetails = listOfSourceToDestinationDetails;
	}
	public CarpoolerPreference getCarpoolerPreference() {
		return carpoolerPreference;
	}
	public void setCarpoolerPreference(CarpoolerPreference carpoolerPreference) {
		this.carpoolerPreference = carpoolerPreference;
	}
	public String getPhotoOfCarpooler() {
		return photoOfCarpooler;
	}
	public void setPhotoOfCarpooler(String photoOfCarpooler) {
		this.photoOfCarpooler = photoOfCarpooler;
	}
	public String getNameOfCarpooler() {
		return nameOfCarpooler;
	}
	public void setNameOfCarpooler(String nameOfCarpooler) {
		this.nameOfCarpooler = nameOfCarpooler;
	}
	public long getCarpoolerId() {
		return carpoolerId;
	}
	public void setCarpoolerId(long carpoolerId) {
		this.carpoolerId = carpoolerId;
	}
	public String getCompensationAmount() {
		return compensationAmount;
	}
	public void setCompensationAmount(String compensationAmount) {
		this.compensationAmount = compensationAmount;
	}
	public String getCarpoolingWhen() {
		return carpoolingWhen;
	}
	public void setCarpoolingWhen(String carpoolingWhen) {
		this.carpoolingWhen = carpoolingWhen;
	}
	public String getDaysIfCarpoolingOnDays() {
		return daysIfCarpoolingOnDays;
	}
	public void setDaysIfCarpoolingOnDays(String daysIfCarpoolingOnDays) {
		this.daysIfCarpoolingOnDays = daysIfCarpoolingOnDays;
	}
	public String getCarpoolOneWayOrTwoWay() {
		return carpoolOneWayOrTwoWay;
	}
	public void setCarpoolOneWayOrTwoWay(String carpoolOneWayOrTwoWay) {
		this.carpoolOneWayOrTwoWay = carpoolOneWayOrTwoWay;
	}
	public String getCarpoolReturnRouteSameOrNot() {
		return carpoolReturnRouteSameOrNot;
	}
	public void setCarpoolReturnRouteSameOrNot(String carpoolReturnRouteSameOrNot) {
		this.carpoolReturnRouteSameOrNot = carpoolReturnRouteSameOrNot;
	}
	public String getWantToBeHiddenFromRoute() {
		return wantToBeHiddenFromRoute;
	}
	public void setWantToBeHiddenFromRoute(String wantToBeHiddenFromRoute) {
		this.wantToBeHiddenFromRoute = wantToBeHiddenFromRoute;
	}
	public String getSourcePLace() {
		return sourcePLace;
	}
	public void setSourcePLace(String sourcePLace) {
		this.sourcePLace = sourcePLace;
	}
	public String getDestinationPLace() {
		return destinationPLace;
	}
	public void setDestinationPLace(String destinationPLace) {
		this.destinationPLace = destinationPLace;
	}
	public String getInBetweenPLace() {
		return inBetweenPLace;
	}
	public void setInBetweenPLace(String inBetweenPLace) {
		this.inBetweenPLace = inBetweenPLace;
	}
	
	public String getGenderPreference() {
		return genderPreference;
	}
	public void setGenderPreference(String genderPreference) {
		this.genderPreference = genderPreference;
	}
	public String getContactPreference() {
		return contactPreference;
	}
	public void setContactPreference(String contactPreference) {
		this.contactPreference = contactPreference;
	}
	public String getCompensation() {
		return compensation;
	}
	public void setCompensation(String compensation) {
		this.compensation = compensation;
	}
	public String getDateIfCarpoolingOnDates() {
		return dateIfCarpoolingOnDates;
	}
	public void setDateIfCarpoolingOnDates(String dateIfCarpoolingOnDates) {
		this.dateIfCarpoolingOnDates = dateIfCarpoolingOnDates;
	}
	
	public String getSourceLeavingTime() {
		return sourceLeavingTime;
	}
	public void setSourceLeavingTime(String sourceLeavingTime) {
		this.sourceLeavingTime = sourceLeavingTime;
	}
	public String getDaysIfCarpoolingOnDaysReturn() {
		return daysIfCarpoolingOnDaysReturn;
	}
	public void setDaysIfCarpoolingOnDaysReturn(String daysIfCarpoolingOnDaysReturn) {
		this.daysIfCarpoolingOnDaysReturn = daysIfCarpoolingOnDaysReturn;
	}
	public String getDateIfCarpoolingOnDatesReturn() {
		return dateIfCarpoolingOnDatesReturn;
	}
	public void setDateIfCarpoolingOnDatesReturn(
			String dateIfCarpoolingOnDatesReturn) {
		this.dateIfCarpoolingOnDatesReturn = dateIfCarpoolingOnDatesReturn;
	}
	public String getSourceLeavingTimeReturn() {
		return sourceLeavingTimeReturn;
	}
	public void setSourceLeavingTimeReturn(String sourceLeavingTimeReturn) {
		this.sourceLeavingTimeReturn = sourceLeavingTimeReturn;
	}
	public String getWantToBeHiddenFromRouteReturn() {
		return wantToBeHiddenFromRouteReturn;
	}
	public void setWantToBeHiddenFromRouteReturn(
			String wantToBeHiddenFromRouteReturn) {
		this.wantToBeHiddenFromRouteReturn = wantToBeHiddenFromRouteReturn;
	}
	public String getSourcePLaceReturn() {
		return sourcePLaceReturn;
	}
	public void setSourcePLaceReturn(String sourcePLaceReturn) {
		this.sourcePLaceReturn = sourcePLaceReturn;
	}
	public String getDestinationPLaceReturn() {
		return destinationPLaceReturn;
	}
	public void setDestinationPLaceReturn(String destinationPLaceReturn) {
		this.destinationPLaceReturn = destinationPLaceReturn;
	}
	public String getInBetweenPLaceReturn() {
		return inBetweenPLaceReturn;
	}
	public void setInBetweenPLaceReturn(String inBetweenPLaceReturn) {
		this.inBetweenPLaceReturn = inBetweenPLaceReturn;
	}
	@Override
	public String toString() {
		return "UICarpooler [carpoolerId=" + carpoolerId
				+ ", photoOfCarpooler=" + photoOfCarpooler
				+ ", nameOfCarpooler=" + nameOfCarpooler
				+ ", listOfSourceToDestinationDetails="
				+ listOfSourceToDestinationDetails + ", carpoolerPreference="
				+ carpoolerPreference + ", carpoolingWhen=" + carpoolingWhen
				+ ", daysIfCarpoolingOnDays=" + daysIfCarpoolingOnDays
				+ ", daysIfCarpoolingOnDaysReturn="
				+ daysIfCarpoolingOnDaysReturn + ", dateIfCarpoolingOnDates="
				+ dateIfCarpoolingOnDates + ", dateIfCarpoolingOnDatesReturn="
				+ dateIfCarpoolingOnDatesReturn + ", sourceLeavingTime="
				+ sourceLeavingTime + ", sourceLeavingTimeReturn="
				+ sourceLeavingTimeReturn + ", carpoolOneWayOrTwoWay="
				+ carpoolOneWayOrTwoWay + ", carpoolReturnRouteSameOrNot="
				+ carpoolReturnRouteSameOrNot + ", wantToBeHiddenFromRoute="
				+ wantToBeHiddenFromRoute + ", sourcePLace=" + sourcePLace
				+ ", destinationPLace=" + destinationPLace
				+ ", inBetweenPLace=" + inBetweenPLace
				+ ", wantToBeHiddenFromRouteReturn="
				+ wantToBeHiddenFromRouteReturn + ", sourcePLaceReturn="
				+ sourcePLaceReturn + ", destinationPLaceReturn="
				+ destinationPLaceReturn + ", inBetweenPLaceReturn="
				+ inBetweenPLaceReturn + ", genderPreference="
				+ genderPreference + ", contactPreference=" + contactPreference
				+ ", compensation=" + compensation + ", compensationAmount="
				+ compensationAmount + "]";
	}

	
	
	
}
