package com.tob.event;

import java.io.Serializable;

import org.springframework.stereotype.Component;
 
@Component
public class EventVO  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String evtId;
	private String evtName;
	private String fromDt;
	private String toDt;
	private String profile;

	
	public EventVO() {
		// TODO Auto-generated constructor stub
	}
	
	public EventVO(String evtId,String evtName,String fromDt,String toDt,String profile) {
		this.evtId = evtId;
		this.evtName = evtName;
		this.fromDt = fromDt;
		this.toDt = toDt;
		this.profile = profile;
	}
	public String getEvtId() {
		return evtId;
	}
	public String getEvtName() {
		return evtName;
	}
	public String getFromDt() {
		return fromDt;
	}
	public String getToDt() {
		return toDt;
	}
	public void setEvtId(String evtId) {
		this.evtId = evtId;
	}
	public void setEvtName(String evtName) {
		this.evtName = evtName;
	}
	public void setFromDt(String fromDt) {
		this.fromDt = fromDt;
	}
	public void setToDt(String toDt) {
		this.toDt = toDt;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	@Override
	public String toString() {
		return "EventVO [evtId=" + evtId + ", evtName=" + evtName + ", fromDt=" + fromDt + ", toDt=" + toDt
				+ ", profile=" + profile + "]";
	}
	
	
	
}