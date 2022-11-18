package com.ezen.sb.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.model.NoticeModel;
import com.ezen.sb.model.UserModel;
import com.ezen.sb.service.NoticeService;
import com.github.pagehelper.PageInfo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	@GetMapping("/noticeList") public @ResponseBody PageInfo<NoticeModel> getList(NoticeModel noticeModel){ 
		return noticeService.selectNoticeList(noticeModel); }
	
	/*
	 * @GetMapping("/notice") public @ResponseBody PageInfo<NoticeModel>
	 * getList(HttpSession session){ if(session.getAttribute("user") == null) {
	 * return null; } UserInfoModel user =
	 * (UserInfoModel)session.getAttribute("user"); 
	 * return noticeService.selectNoticeList(user.getUserNum()); 
	 * //Notice의 정수 데이터타입은 Integer UserInfoModel은 Long }
	 */
	
	@GetMapping("/noticeView/{noticeNum}")
	public @ResponseBody NoticeModel getView(@PathVariable("noticeNum") int noticeNum) {
		return noticeService.selectNoticeView(noticeNum);
	}
	
	/*
	 * @GetMapping("/noticeView/{noticeNum}") public @ResponseBody NoticeModel
	 * getView(HttpSession session, @PathVariable("noticeNum") int noticeNum) {
	 * UserInfoModel user = (UserInfoModel) session.getAttribute("user"); 
	 * return noticeService.selectNoticeView(user.getUserNum(), noticeNum); }
	 */
	/*
	@PostMapping("/addNotice")
	public @ResponseBody int addNotice(@RequestBody NoticeModel noticeModel) {
		return noticeService.insertNotice(noticeModel);
	}
	*/
	
	@PostMapping("/addNotice")
	public @ResponseBody int addNotice(HttpSession session, @RequestBody NoticeModel noticeModel) {
		UserModel user = (UserModel)session.getAttribute("user");
		
		return noticeService.insertNotice(user.getUserNum(), noticeModel);
	}
	 
	
	@PostMapping("/modifyNotice")
	public @ResponseBody int modifyNotice(@RequestBody NoticeModel noticeModel) {
		return noticeService.updateNotice(noticeModel);
	}
	
	@PostMapping("/removeNotice")
	public @ResponseBody int removeNotice(@RequestBody NoticeModel noticeModel) {
		return noticeService.deleteNotice(noticeModel);
	}
	
}
