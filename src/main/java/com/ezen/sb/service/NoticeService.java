package com.ezen.sb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.NoticeMapper;
import com.ezen.sb.model.NoticeModel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	public PageInfo<NoticeModel> selectNoticeList(Integer userNum, NoticeModel noticeModel){
		PageHelper.startPage(noticeModel.getPage(), noticeModel.getPageSize());
		return PageInfo.of(noticeMapper.selectNoticeList(userNum));
	}
	
	/*
	 * public PageInfo<NoticeModel> selectNoticeList(int noticeNum){
	 * PageHelper.startPage(1, 10); return
	 * PageInfo.of(noticeMapper.selectNoticeList(noticeNum)); }
	 */
	
	public NoticeModel selectNoticeView(Integer noticeNum) {
		return noticeMapper.selectNoticeView(noticeNum);
	}
	
	/*
	 * public NoticeModel selectNoticeView(long userNum, long noticeNum) { return
	 * noticeMapper.selectNoticeView(userNum, noticeNum); }
	 */
	
	/*
	public int insertNotice(NoticeModel noticeModel) {
		return noticeMapper.insertNotice(noticeModel);
	}
	*/
	
	public int insertNotice(Integer userNum, NoticeModel noticeModel) {
	 noticeModel.setUserNum(userNum); 
	 return noticeMapper.insertNotice(noticeModel); 
	}
	 
	
	public int updateNotice(NoticeModel noticeModel) {
		return noticeMapper.updateNotice(noticeModel);
	}
	
	public int deleteNotice(NoticeModel noticeModel) {
		return noticeMapper.deleteNotice(noticeModel);
	}
}
