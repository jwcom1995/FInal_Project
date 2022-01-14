package com.project.eatda.biz;

import java.util.List;

import com.project.eatda.dto.EventDto;

public interface EventBiz {
	public List<EventDto> eventList();
	public EventDto selectOne(int event_no);
	public int insert(EventDto dto);
	public int update(EventDto dto);
	public int delete(int event_no);
	
	
	/* 관리자 이벤트 진행 현황 */
	public int adminEventStatus(EventDto dto);
}
