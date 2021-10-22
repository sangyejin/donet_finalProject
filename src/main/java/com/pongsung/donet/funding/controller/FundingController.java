package com.pongsung.donet.funding.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.funding.model.service.FundingService;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.funding.model.vo.FundingCategory;
import com.pongsung.donet.funding.model.vo.FundingGoods;
import com.pongsung.donet.funding.model.vo.FundingGoodsList;
import com.pongsung.donet.funding.model.vo.FundingImage;
import com.pongsung.donet.member.model.vo.Member;


@SessionAttributes("loginUser") 
@Controller
public class FundingController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(FundingController.class);

	@Autowired
	private FundingService fundingService;

	
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	
	
	// 펀딩 리스트
	@RequestMapping("funding")
	public String seletcFundingList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		int listCount = fundingService.selectFundingListCount();

		List<FundingCategory> categoryList = fundingService.selectFundingCategoryList();

		logger.info("fundingListCount::" + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
//		
		List<Funding> fundingList = fundingService.selectFundingList(pi);
		logger.info("fundingList::" + fundingList);
//		
		model.addAttribute("category", categoryList);
		model.addAttribute("list", fundingList);
		model.addAttribute("pi", pi);

		return "funding/fundingListView";
	}

	// 펀딩프로젝트 등록 폼으로 이동
	@RequestMapping("funding/insertForm")
	public String enrollForm(Model model) {
		List<FundingCategory> categoryList = fundingService.selectFundingCategoryList();

		model.addAttribute("category", categoryList);
		return "funding/fundingEnrollForm";
	}

	// 펀딩프로젝트 게시글 등록
	@RequestMapping("funding/insert")
	public String insertFunding(Funding funding, HttpServletRequest request, MultipartHttpServletRequest multipartRequest
			,@ModelAttribute FundingGoodsList fundingGoods, Model model)
			throws Exception {
		//multipartRequest.setCharacterEncoding("utf-8");
		funding.setHostId(((Member)model.getAttribute("loginUser")).getUserId()); //funding 누가 작성하는지 userId 넣어주기
		List<FundingGoods> fgList=fundingGoods.getFundingGoods();
		System.out.println("fundingGoods::"+fgList);
		
		Map<String, MultipartFile> mMap= multipartRequest.getFileMap(); // key : tag name, value: multipartFile list
		List<FundingImage> imgList = new ArrayList<>(); //추가 img 저장하는 리스트
		
		Map<String, List<MultipartFile>> paramMap = multipartRequest.getMultiFileMap();
		for (Entry<String, List<MultipartFile>> entry : paramMap.entrySet()) {
			
			List<MultipartFile> fileList=entry.getValue(); //multipartFile List
			
			logger.info("현재 태그 name: "+entry.getKey()+fileList.size());
			
			//파일을 저장, 파일이름 변경
			
			for(int i=0; i<fileList.size();i++) {
				String fileName=fileList.get(i).getOriginalFilename();
				if(fileName!="") { 
					String originName = fileList.get(i).getOriginalFilename();
					String changeName = saveFile(fileList.get(i),request);
					if( (entry.getKey()).equals("thumbFile")) { //현재 tag가 대표사진이면 funding에 setting
						funding.setThumbnailOriginName(originName);
						funding.setThumbnailChangeName(changeName);
					}
					else { //아니면 추가사진
						FundingImage img=new FundingImage();
						img.setImgChangeName(changeName);
						img.setImgOriginName(originName); 
						img.setImgNo(Integer.valueOf( (entry.getKey()).substring((entry.getKey()).length()-1)));
						imgList.add(img);
						System.out.println(i+"::::::::::::"+img);
					}
				}
			}
			
		}
		
		
		fundingService.insertFunding(funding,imgList,fgList);
		
		return "redirect:/funding";

//		return "funding/fundingDetailView";
	}

	// 후원완료창 확인용
	@RequestMapping("funding/complete")
	public String insertFunding() {
		return "funding/fundingCompleteView";
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		logger.info("=================== saveFile 진입 ==========================");
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"/funding/upload_files/";

		String originName = file.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = savePath + System.currentTimeMillis() + "_" + (int)( Math.random() * 10000000) + ext;
		try {
			file.transferTo(new File(changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file upload error");
		}
		return changeName;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String resources=request.getSession().getServletContext().getRealPath("resources");
		String savePath=resources+"/funding/upload_files/";
		System.out.println("savePath"+savePath);
		
		File deleteFile= new File(savePath+fileName);
		deleteFile.delete();
		
	}
	
}
