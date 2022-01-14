package com.project.eatda.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.eatda.dao.EventDao;
import com.project.eatda.dto.EventDto;

@Service
public class EventBizImpl implements EventBiz{
	
	@Autowired
	public EventDao dao;
	
	@Override
	public List<EventDto> eventList() {
		return dao.eventList();
	}
	
	@Override
	public EventDto selectOne(int event_no) {
		return dao.selectOne(event_no);
	}
	
	@Override
	public int insert(EventDto dto) {
		return dao.insert(dto);
	}
	
	@Override
	public int update(EventDto dto) {
		System.out.println("update biz");
		return dao.update(dto);
	}
	
	@Override
	public int delete(int event_no) {
		System.out.println("delete biz");
		return dao.delete(event_no);
	}

	/* 관리자 이벤트 진행 현황 */
	@Override
	public int adminEventStatus(EventDto dto) {
		return dao.adminEventStatus(dto);
	}
}
