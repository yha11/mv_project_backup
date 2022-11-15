package com.ezen.sb.mapper;

import java.util.List;


import com.ezen.sb.model.NoticeModel;

public interface NoticeMapper {
	List<NoticeModel> selectNoticeList(NoticeModel noticeModel);
	//List<NoticeModel> selectNoticeList(int noticeNum);
	
	NoticeModel selectNoticeView(int noticeNum);
	//NoticeModel selectNoticeView(@Param("noticeNum") int noticeNum);
	
	int insertNotice(NoticeModel noticeModel);
	
	int updateNotice(NoticeModel noticeModel);
	
	int deleteNotice(NoticeModel noticeModel);
}
