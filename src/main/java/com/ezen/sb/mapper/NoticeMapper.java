package com.ezen.sb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.sb.model.NoticeModel;

public interface NoticeMapper {
	List<NoticeModel> selectNoticeList(Integer userNum);
	//List<NoticeModel> selectNoticeList(int noticeNum);
	
	NoticeModel selectNoticeView(@Param("noticeNum") Integer noticeNum);
	//NoticeModel selectNoticeView(@Param("noticeNum") int noticeNum);
	
	int insertNotice(NoticeModel noticeModel);
	
	int updateNotice(NoticeModel noticeModel);
	
	int deleteNotice(NoticeModel noticeModel);
}
