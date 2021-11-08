package com.pongsung.donet.event.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.event.model.service.EventService;
import com.pongsung.donet.event.model.vo.Attachment;
import com.pongsung.donet.event.model.vo.Event;
import com.pongsung.donet.event.model.vo.EventReply;
import com.pongsung.donet.volunteer.model.vo.Volunteer;

@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventService eventService;
	
	
	@RequestMapping("list.ev")
	public String selectList(@RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = eventService.selectEventListCount();
		System.out.println("listCount check : "+listCount); //페이지 카운트확인하기 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5 , 9);
		
		ArrayList<Event> list = eventService.selectEventList(pi);
		System.out.println("list check : "+list); //리스트 확인 
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "event/eventList";
	}
	
	
	
	
	@RequestMapping("afterList.ev")
	public String afterList(@RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = eventService.afterListCount();
		System.out.println("After List Count check : "+listCount); //페이지 카운트확인하기 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5 , 9);
		
		ArrayList<Event> list = eventService.afterList(pi);
		System.out.println("list check : "+list); //리스트 확인 
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "event/afterEventList";
	}
	
	@RequestMapping("detail.ev")
	public String selectEvent(int eno, Model mv) {
		System.out.println("디테일 체크 : " + eno );
		
		Event ev = eventService.selectEvent(eno);

		
		mv.addAttribute("ev", ev);
		
		return "event/eventDetail";
	}
	
	@RequestMapping("enroll.ev")
	public String enrollForm() {
		return "event/eventEnroll";
	}
	
	@RequestMapping(value="imageFile.ev", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources  + "/upload_files/";
		
		String originalFileName = multipartFile.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String saveFileName = UUID.randomUUID()+extension;
			
		File targetFile = new File(savePath+saveFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "resources/upload_files/" + saveFileName);
			jsonObject.addProperty("responseCode", "succcess");
		} catch(IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}	

		
		String result = jsonObject.toString();
		return result;
	}

	
	@RequestMapping(value="insert.ev")
	public String insertEvent(Event e, MultipartHttpServletRequest request,
			@RequestParam(name="file", required=false) MultipartFile file) {
		
		e.setEventContent( (e.getEventContent()).replace("\n", "<br>"));
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			if(changeName != null) {
				e.setEventOrigin(file.getOriginalFilename());
				e.setEventChange(changeName);
			}
		}
		
		eventService.insertEvent(e);
		
		return "redirect:list.ev";
	}
	
	@RequestMapping("delete.ev")
	public String deleteEvent(int eno, String fileName, HttpServletRequest request) {
		System.out.println("delete check : " + eno );
		eventService.deleteEvent(eno);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		System.out.println("fileName : " + fileName);
		return "redirect:list.ev";
	}
	
	@RequestMapping("updateForm.ev")
	public ModelAndView updateEventForm(int eno, ModelAndView mv) {
		Event ev = eventService.selectEvent(eno);
		
		System.out.println("update 넘기기값 확인 : "+ev);
		
		mv.addObject("ev", ev).setViewName("event/eventUpdate");
		
		return mv;
	}

	@RequestMapping("update.ev")
	public ModelAndView updateEvent(Event e,ModelAndView mv, MultipartHttpServletRequest request,
			@RequestParam(name="file", required=false) MultipartFile file) {
		
		e.setEventContent( (e.getEventContent()).replace("\n", "<br>"));
		
		if(!file.getOriginalFilename().equals("")) {
			
			if(e.getEventChange() != null) {
				deleteFile(e.getEventChange(), request);
			}
			
			String changeName = saveFile(file, request);
			e.setEventOrigin(file.getOriginalFilename());
			e.setEventChange(changeName);
			
		}
		
		eventService.updateEvent(e);
		mv.addObject("eno", e.getEventNo()).setViewName("redirect:detail.ev");
		return mv;
	}
	
	@RequestMapping("search.ev")
	public String searchList(@RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage,
			Model model, @RequestParam("keyword") String keyword) throws Exception {
		
		int listCount = eventService.selectEventListCount();
		System.out.println("검색 listCount check : "+listCount); //페이지 카운트확인하기 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6 , 5);
		
		ArrayList<Volunteer> list = eventService.searchList(pi, keyword);
		System.out.println("검색 후 list check : "+list); //리스트 확인 
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "volunteer/volunteerList";
	}
	
	
	@ResponseBody
	@RequestMapping(value="{eno}/rinsert.ev")
	public String insertReply(EventReply re, @PathVariable("eno")int eno) {
		System.out.println("insert Reply check :" + re);
		int result = eventService.insertReply(re);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="{eno}/rlist.ev", produces="application/json; charset=utf-8")
	public String replyList(@PathVariable("eno")int eno) {
		ArrayList<EventReply> replyList = eventService.replyList(eno);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(replyList);
	}
	
	@ResponseBody
	@RequestMapping(value="{eno}/event/{replyNo}/updateReply.ev")
	public String updateReply(@PathVariable("eno")int eno, @PathVariable("replyNo")int replyNo, EventReply eventReply) {
		eventReply.setEventReplyNo(replyNo);
		
		int result = eventService.replyUpdate(eventReply);
		
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value="{eno}/event/{replyNo}/deleteReply.ev")
	public String deleteReply(@PathVariable("eno")int eno, @PathVariable("replyNo")int replyNo) {
		int result = eventService.deleteReply(replyNo);
		
		return String.valueOf(result);
	}
	
	
	/*얼굴인식 API 이벤트*/
	@RequestMapping("faceRecognition.ev")
	public String faceRecognition() {
		return "event/faceRecognition";
	}
	
	/* 
	 * =============== private ====================
	 */
	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("/resources");
		String savePath = resources + "/upload_files/" + "event/";
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("/resources");
		String savePath = resources  + "/upload_files/";
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ext;
		
			try {
				file.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new CommException("file upload error");
			}
		return changeName;
	}
	
}
