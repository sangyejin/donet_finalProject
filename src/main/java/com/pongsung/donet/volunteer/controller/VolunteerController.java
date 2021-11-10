package com.pongsung.donet.volunteer.controller;

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
import com.pongsung.donet.event.model.vo.EventReply;
import com.pongsung.donet.volunteer.model.service.VolunteerService;
import com.pongsung.donet.volunteer.model.vo.Volunteer;
import com.pongsung.donet.volunteer.model.vo.VolunteerReply;

@Controller
public class VolunteerController {
	
	private static final Logger logger = LoggerFactory.getLogger(VolunteerController.class);
	
	@Autowired
	private VolunteerService volunteerService;
	
	@RequestMapping("sort.vo")
	public String sortList(@RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage, Model model) throws Exception {
		
		int listCount = volunteerService.selectVolunteerListCount();
		System.out.println("listCount check : "+listCount); //페이지 카운트확인하기 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6 , 5);
		
		ArrayList<Volunteer> list = volunteerService.sortList(pi);
		System.out.println("list check : "+list); //리스트 확인 
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "volunteer/volunteerList";
	}
	@RequestMapping("list.vo")
	public String selectList(@RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage, Model model) throws Exception {
		
		int listCount = volunteerService.selectVolunteerListCount();
		System.out.println("listCount check : "+listCount); //페이지 카운트확인하기 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6 , 5);
		
		ArrayList<Volunteer> list = volunteerService.selectVolunteerList(pi);
		System.out.println("list check : "+list); //리스트 확인 
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "volunteer/volunteerList";
	}
	@RequestMapping("choseList.vo")
	public String choseList(@RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage, Model model,HttpServletRequest request) throws Exception {
		String chose = request.getParameter("chose");
		System.out.println("category value check : "+ chose); //category value check
		int listCount = volunteerService.choseListCount(chose);
		System.out.println("listCount check : "+listCount); //페이지 카운트확인하기 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6 , 5);
		
		ArrayList<Volunteer> list = volunteerService.choseList(pi,chose);
		System.out.println("list check : "+list); //리스트 확인 
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "volunteer/volunteerList";
	}
	
	@RequestMapping("enroll.vo")
	public String enrollForm() {
		return "volunteer/volunteerEnroll";
	}
	
	@RequestMapping(value="insert.vo")
	public String insertVolunteer(Volunteer vo, MultipartHttpServletRequest request,
			@RequestParam(name="file", required=false) MultipartFile file) throws Exception {
		
		vo.setVolContent((vo.getVolContent()).replace("\n", "<br>"));
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			if(changeName != null) {
				vo.setVolOrigin(file.getOriginalFilename());
				vo.setVolChange(changeName);
			}
		}
		volunteerService.insertVolunteer(vo);
		
		return "redirect:list.vo";
	}
	
	@RequestMapping(value="imageFile.vo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request ) throws Exception {
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
	
	@RequestMapping("detail.vo")
	public String selectVolunteer( int vno, Model mv) throws Exception {
		System.out.println("디테일 체크 : " + vno );
	
		Volunteer vo = volunteerService.selectVolunteer(vno);
		
		mv.addAttribute("vo", vo);
		
		System.out.println("디테일 모델 체크 : " + mv );
		return "volunteer/volunteerDetail";
	}
	@RequestMapping("delete.vo")
	public String deleteVolunteer(int vno, String fileName, HttpServletRequest request)throws Exception {
		System.out.println("delete check : " + vno );
		volunteerService.deleteVolunteer(vno);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		System.out.println("fileName : " + fileName);
		return "redirect:list.vo";
	}
	@RequestMapping("updateForm.vo")
	public ModelAndView updateVolForm(int vno, ModelAndView mv) throws Exception {
		Volunteer vo =  volunteerService.selectVolunteer(vno);
		
		System.out.println("update 넘기기값 확인 : "+vo);
		
		mv.addObject("vo", vo).setViewName("volunteer/volunteerUpdate");
		
		return mv;
	}
	@RequestMapping("update.vo")
	public ModelAndView updateVolunteer(Volunteer vo,ModelAndView mv, MultipartHttpServletRequest request,
			@RequestParam(name="file", required=false) MultipartFile file)throws Exception {
		
		vo.setVolContent((vo.getVolContent().replace("\n", "<br>")));
		
		if(!file.getOriginalFilename().equals("")) {
			
			if(vo.getVolChange() != null) {
				deleteFile(vo.getVolChange(), request);
			}
			
			String changeName = saveFile(file, request);
			vo.setVolOrigin(file.getOriginalFilename());
			vo.setVolChange(changeName);
			
		}
		
		volunteerService.updateVolunteer(vo);
		mv.addObject("vno", vo.getVolNo()).setViewName("redirect:detail.vo");
		return mv;
	}
	
	@RequestMapping("search.vo")
	public String searchList(@RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage, 
			Model model, @RequestParam("keyword") String keyword) throws Exception {
		
		int listCount = volunteerService.selectVolunteerListCount();
		System.out.println("검색 listCount check : "+listCount); //페이지 카운트확인하기 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6 , 5);
		
		ArrayList<Volunteer> list = volunteerService.searchList(pi, keyword);
		System.out.println("검색 후 list check : "+list); //리스트 확인 
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "volunteer/volunteerList";
	}
	
	@RequestMapping("{vno}/addPoint.vo")
	public String updatePoint (@PathVariable("vno") int vno) {
		int result = volunteerService.updatePoint(vno);
		
		return String.valueOf(result);
	}
	/*
	 * =========== Reply ==================
	 */
	@ResponseBody
	@RequestMapping(value="{vno}/rinsert.vo")
	public String insertReply(VolunteerReply re, @PathVariable("vno")int vno) {
		System.out.println("insert Reply check :" + re);
		int result = volunteerService.insertReply(re);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="{vno}/rlist.vo", produces="application/json; charset=utf-8")
	public String replyList(@PathVariable("vno")int vno) {
		ArrayList<VolunteerReply> replyList = volunteerService.replyList(vno);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(replyList);
	}
	
	@ResponseBody
	@RequestMapping(value="{vno}/volunteer/{replyNo}/updateReply.vo")
	public String updateReply(@PathVariable("vno")int vno, @PathVariable("replyNo")int replyNo, VolunteerReply volReply) {
		volReply.setVolReplyNo(replyNo);
		
		int result = volunteerService.replyUpdate(volReply);
		
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value="{vno}/volunteer/{replyNo}/deleteReply.vo")
	public String deleteReply(@PathVariable("vno")int vno, @PathVariable("replyNo")int replyNo) {
		int result = volunteerService.deleteReply(replyNo);
		
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
