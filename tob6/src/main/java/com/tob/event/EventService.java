package com.tob.event;

import java.util.List;

import com.tob.global.Command;
 
public interface EventService {
	public int insert(EventVO o);
	public int update(EventVO o);
	public int delete(String evtId);
	public int count();
	public List<EventVO> selectAll(CommandEvent command);
	public EventVO searchByEvent(String event);
	public List<EventVO> searchByEventName(CommandEvent command);
}