package com.pongsung.donet.volunteer.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.volunteer.model.service.VolunteerService;
import com.pongsung.donet.volunteer.model.vo.VolAttachment;
import com.pongsung.donet.volunteer.model.vo.Volunteer;

@Controller
public class VolunteerController {
	
	private static final Logger logger = LoggerFactory.getLogger(VolunteerController.class);
	
	@Autowired
	private VolunteerService volunteerService;
	
	@RequestMapping("list.vo")
	public String selectList(@RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = volunteerService.selectVolunteerListCount();
		System.out.println("listCount check : "+listCount); //페이지 카운트확인하기 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6 , 5);
		
		ArrayList<Volunteer> list = volunteerService.selectVolunteerList(pi);
		System.out.println("list check : "+list); //리스트 확인 
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "volunteer/volunteerList";
	}
	
	@RequestMapping("enroll.vo")
	public String enrollForm() {
		return "volunteer/volunteerEnroll";
	}
	
	@RequestMapping("insert.vo")
	public String insertVolunteer(Volunteer vo,HttpServletRequest request, 
			MultipartHttpServletRequest multiRequest, @ModelAttribute Model model )
			throws Exception {
		vo.setVolContent(vo.getVolContent().replace("\n", "<br>"));
		
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		List<VolAttachment> attList = new ArrayList<>();
		
		Map<String, List<MultipartFile>> MapList = multiRequest.getMultiFileMap();
		for(Entry<String, List<MultipartFile>> entry : MapList.entrySet()) {
			List<MultipartFile> fileList = entry.getValue();
			logger.info("현재 태그 name: "+entry.getKey()+fileList.size());
			for(int i=0; i<fileList.size(); i++) {
				String fileName = fileList.get(i).getOriginalFilename();
				if(fileName != "") {
					String originName = fileList.get(i).getOriginalFilename();
					String changeName = saveFile(fileList.get(i), request);
					
					if((entry.getKey()).equals("thumFile")) {
						vo.setVolOrigin(originName);
						vo.setVolChange(changeName);
					}else {
						VolAttachment at = new VolAttachment();
						at.setOriginName(originName);
						at.setChangeName(changeName);
						attList.add(at);
					}
				}
			}
		}
		System.out.println("attachment return check : " + attList);
		volunteerService.insertVolunteer(vo, attList);
		System.out.println("attachment return check : " + attList);
		return "redirect:list.vo";
	}
	@RequestMapping("detail.vo")
	public String selectVolunteer( int vno, Model mv) {
		System.out.println("디테일 체크 : " + vno );
		
		Volunteer vo = volunteerService.selectVolunteer(vno);
		
		List<VolAttachment> at = volunteerService.selectVolunteerAttachment(vno);
		
		mv.addAttribute("vo", vo);
		mv.addAttribute("at", at);
		
		System.out.println("디테일 모델 체크 : " + mv );
		return "volunteer/volunteerDetail";
	}
	
	/* 
	 * =============== private ====================
	 */
	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "//upload_files//";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "/upload_files/";
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
