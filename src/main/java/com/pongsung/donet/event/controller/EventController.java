package com.pongsung.donet.event.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		List<Attachment> at = eventService.selectEventAttach(eno);
		
		mv.addAttribute("ev", ev);
		mv.addAttribute("at", at);
		
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
		String resources = request.getSession().getServletContext().getRealPath("/resources");
		String savePath = resources  + "/upload_files/";
		
		String originalFileName = multipartFile.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String saveFileName = UUID.randomUUID()+extension;
			
		File targetFile = new File(savePath+saveFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "/summernoteImg/"+saveFileName);
			jsonObject.addProperty("responseCode", "succcess");
		} catch(IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}	



		/*
		String changeName = saveFile(multipartFile, request);
		
		File targetFile = new File(changeName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/upload_files/"+changeName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		 */
		
		String result = jsonObject.toString();
		return result;
	}

	
	@RequestMapping(value="insert.ev")
	public String insertEvent(Event e, MultipartHttpServletRequest request) {
		
		e.setEventContent( (e.getEventContent()).replace("\n", "<br>"));
		
		
		eventService.insertEvent(e);
		
		return "redirect:list.ev";
	}
	
	/*
	@RequestMapping("insert.ev")
	public String insertEvent(Event e,HttpServletRequest request, 
			MultipartHttpServletRequest multiRequest, Model model )
			throws Exception {
		
		e.setEventContent( (e.getEventContent()).replace("\n", "<br>"));
		
		
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		List<Attachment> attList = new ArrayList<>();
		
		Map<String, List<MultipartFile>> MapList = multiRequest.getMultiFileMap();
		
		for(Entry<String, List<MultipartFile>> entry : MapList.entrySet()) {
			List<MultipartFile> fileList = entry.getValue();
			
			for(int i=0; i<fileList.size(); i++) {
				String fileName = fileList.get(i).getOriginalFilename();
				
				if(fileName != "") {
					String originName = fileList.get(i).getOriginalFilename();
					String changeName = saveFile(fileList.get(i), request);	
					
					if(!("thumFile").isEmpty()) {
						
					}
					else{ 
						Attachment at = new Attachment();
						at.setOriginName(originName);
						at.setChangeName(changeName);
						at.setRefEventNo(e.getEventNo());
						attList.add(at);
					}
				}
			}
		}
		
		eventService.insertEvent(e, attList);
		
		return "redirect:list.ev";
		
	}
	
	*/
	@RequestMapping("delete.ev")
	public String deleteEvent(int eno, String fileName, HttpServletRequest request) {
		System.out.println("delete check : " + eno );
		eventService.deleteEvent(eno);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		
		return "redirect:list.ev";
	}
	
	@RequestMapping("updateForm.ev")
	public ModelAndView updateEventForm(int eno, ModelAndView mv) {
		Event ev = eventService.selectEvent(eno);
		List<Attachment> at = eventService.selectEventAttach(eno);
		System.out.println("update 넘기기값 확인 : "+ev);
		System.out.println("update 넘기기 첨부파일 확인 : "+at);
		mv.addObject("ev", ev).setViewName("event/eventUpdate");
		mv.addObject("at", at).setViewName("event/eventUpdate");
		return mv;
	}

	@RequestMapping("update.ev")
	public ModelAndView updateEvent(Event e, Attachment at, ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="reUploadFile", required=false) MultipartFile file, MultipartHttpServletRequest multiRequest) {
		
		e.setEventContent( (e.getEventContent()).replace("\n", "<br>"));
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		List<Attachment> attList = new ArrayList<>();
		
		Map<String, List<MultipartFile>> MapList = multiRequest.getMultiFileMap();
		for(Entry<String, List<MultipartFile>> entry : MapList.entrySet()) {
			List<MultipartFile> fileList = entry.getValue();
			
			for(int i=0; i<fileList.size(); i++) {
				String fileName = fileList.get(i).getOriginalFilename();
				
				if(fileName != "") {
					
					String originName = fileList.get(i).getOriginalFilename();
					String changeName = saveFile(fileList.get(i), request);	
					
					if((entry.getKey()).equals("thumFile")) {
					
					}
					else{ 
						at.setOriginName(originName);
						at.setChangeName(changeName);
						at.setRefEventNo(e.getEventNo());
						attList.add(at);
					}
				}
			}
		}
		//
		System.out.println("update 중 event 객체확인중 : "+e);
		eventService.updateEvent(e, attList);
		mv.addObject("eno", e.getEventNo()).setViewName("redirect:detail.ev");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.ev")
	public String insertReply(EventReply re) {
		System.out.println("insert Reply check :" + re);
		int result = eventService.insertReply(re);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.ev", produces="application/json; charset=utf-8")
	public String replyList(int eno) {
		ArrayList<EventReply> replyList = eventService.replyList(eno);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(replyList);
	}
	
	@ResponseBody
	@RequestMapping(value="updateReply.ev")
	public String updateReply(int replyNo, EventReply eventReply) {
		int result = eventService.replyUpdate(eventReply);
		
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value="deleteReply.ev")
	public String deleteReply(int replyNo) {
		int result = eventService.deleteReply(replyNo);
		
		return String.valueOf(result);
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
