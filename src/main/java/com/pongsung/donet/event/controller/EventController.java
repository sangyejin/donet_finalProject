package com.pongsung.donet.event.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.event.model.service.EventService;
import com.pongsung.donet.event.model.vo.Attachment;
import com.pongsung.donet.event.model.vo.Event;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("list.ev")
	public String selectList(@RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = eventService.selectEventListCount();
		System.out.println("listCount check : "+listCount); //페이지 카운트확인하기 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6 , 5);
		
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
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6 , 5);
		
		ArrayList<Event> list = eventService.afterList(pi);
		System.out.println("list check : "+list); //리스트 확인 
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "event/afterEventList";
	}
	
	@RequestMapping("detail.ev")
	public ModelAndView selectEvent(int eno, ModelAndView mv) {
		System.out.println("디테일 체크 : " + eno );
		
		Event ev = eventService.selectEvent(eno);
		Attachment at = eventService.selectEventAttach(eno);
		
		mv.addObject("ev", ev).setViewName("event/eventDetail");
		mv.addObject("at", at).setViewName("event/eventDetail");
		
		System.out.println("디테일 모델 체크 : " + mv );
		return mv;
	}
	
	@RequestMapping("enroll.ev")
	public String enrollForm() {
		return "event/eventEnroll";
	}
	
	@RequestMapping("insert.ev")
	public String insertEvent(Event e, Attachment at,MultipartHttpServletRequest request, Model model, @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		System.out.println("e check : " + e);
		System.out.println("file check : " + request);
		
		List<MultipartFile> fileList = request.getFiles("file");
		
		String src = request.getParameter("src");
		System.out.println("src check : " + src);
		System.out.println("file check : " + file);
		
		String path = "//upload_files//";
		

		if(!file.getOriginalFilename().equals("")) {
			for(MultipartFile mf : fileList) {
			
				String changeName = saveFile(file, request);
				
				if(changeName != null) {
					at.setRefEventNo(e.getEventNo());
					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(changeName);
					System.out.println("attachment check : " + at);
					
					/*
					try {
						mf.transferTo(new File(changeName));
					} catch (IllegalStateException | IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					*/
				}
			
				
			}
		
		}
		
		eventService.insertEvent(e, at);
		System.out.println("attachment return check : " + at);
		return "redirect:list.ev";
	}
	/*
	@RequestMapping("insert.ev")
	public String insertEvent(Event e, MultipartHttpServletRequest request, Model model, @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		System.out.println("e check : " + e);
		System.out.println("file check : " + file.getOriginalFilename());
		
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
	*/
	
	
	
	@RequestMapping("delete.ev")
	public String deleteEvent(int eno, String fileName, HttpServletRequest request) {
		System.out.println("delete check : " + eno );
		eventService.deleteEvent(eno);
		/*
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}*/
		
		return "redirect:list.ev";
	}
	
	@RequestMapping("updateForm.ev")
	public ModelAndView updateEventForm(int eno, ModelAndView mv) {
		Event ev = eventService.selectEvent(eno);
		mv.addObject("ev", ev).setViewName("event/eventUpdate");
		return mv;
	}

	@RequestMapping("update.ev")
	public ModelAndView updateEvent(Event ev, ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="reUploadFile", required=false) MultipartFile file) {
		/*
		if(!file.getOriginalFilename().equals("")) {
			if(ev.getChangeName() != null) {
				deleteFile(ev.getChangeName(), request);
			}
			String changeName = saveFile(file, request);
			
			ev.setOriginName(file.getOriginalFilename());
			ev.setChangeName(changeName);
		}*/
		System.out.println("update 중 event 객체확인중 : "+ev);
		eventService.updateEvent(ev);
		mv.addObject("eno", ev.getEventNo()).setViewName("redirect:detail.ev");
		return mv;
	}
	
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "//upload_files//";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "//upload_files//";
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
