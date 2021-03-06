package com.pongsung.donet.funding.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.funding.model.service.FundingService;
import com.pongsung.donet.funding.model.vo.Funding;
import com.pongsung.donet.funding.model.vo.FundingCategory;
import com.pongsung.donet.funding.model.vo.FundingFilterOrder;
import com.pongsung.donet.funding.model.vo.FundingGoods;
import com.pongsung.donet.funding.model.vo.FundingGoodsList;
import com.pongsung.donet.funding.model.vo.FundingImage;
import com.pongsung.donet.funding.model.vo.FundingReply;
import com.pongsung.donet.funding.model.vo.FundingSupporter;
import com.pongsung.donet.member.model.service.MemberService;
import com.pongsung.donet.member.model.vo.Member;


@SessionAttributes("loginUser")
@Controller
public class FundingController {
	private static final Logger logger = LoggerFactory.getLogger(FundingController.class);

	@Autowired
	private FundingService fundingService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//jsp?????? ???????????? string date???????????? ????????????????????? ??????
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
	
	// ?????? ?????????
	@RequestMapping("funding")
	public String seletcFundingList(
		@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
			,Model model) {
		
		FundingFilterOrder filterOrder= new FundingFilterOrder(0,null,"FP_WRITE_DATE DESC",null);
		
		logger.info("selectFundingList :: filterOrder ::"+ filterOrder);
		
		
		int listCount = fundingService.selectFundingListCount(filterOrder);

		List<FundingCategory> categoryList = fundingService.selectFundingCategoryList();
		
		logger.info("selectFundingList ::fundingListCount::" + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		
		List<Funding> fundingList = fundingService.selectFundingList(pi,filterOrder);
		logger.info("selectFundingList ::fundingList::" + fundingList);
		
		model.addAttribute("category", categoryList);
		model.addAttribute("list", fundingList);
		model.addAttribute("pi", pi);

		return "funding/fundingListView";
	}

	//?????? ????????? ????????????
	@ResponseBody
	@RequestMapping(value="funding/list",produces="application/json;charset=utf-8")
	public String selectFundingList(PageInfo pi, FundingFilterOrder fundingFilterOrder) {
		logger.info("selectFundingList :: filterOrder::" + fundingFilterOrder);
		
		int listCount = fundingService.selectFundingListCount(fundingFilterOrder);
		logger.info("selecFundingList :: FundingListCount::" + listCount);
		
		PageInfo p = Pagination.getPageInfo(listCount, pi.getCurrentPage(), 5, 15);
		
		logger.info("selectFundingList :: PI::::::::"+p);
		logger.info("selectFundingList :: filterOrder::::::::"+fundingFilterOrder);
		
		Map<String,Object> map= new HashMap<>();
		List<Funding> fundingList = fundingService.selectFundingList(pi,fundingFilterOrder);
		logger.info("selectFundingList :: FundingList:::::::"+ fundingList);
		map.put("fundingList", fundingList);
		map.put("pi",p);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(map);
	}
	
	// ?????????????????? ?????? ????????? ??????
	@RequestMapping("funding/insertForm")
	public String enrollForm(Model model) {
		List<FundingCategory> categoryList = fundingService.selectFundingCategoryList();

		model.addAttribute("category", categoryList);
		return "funding/fundingEnrollForm";
	}
	
	// ?????????????????? ????????? ??????
	@RequestMapping("funding/insert")
	public String insertFunding(Funding funding, HttpServletRequest request, MultipartHttpServletRequest multipartRequest
			,@ModelAttribute FundingGoodsList fundingGoods, Model model)
			throws Exception {
		funding.setHostId(((Member)model.getAttribute("loginUser")).getUserId()); //funding ?????? ??????????????? userId ????????????
		List<FundingGoods> fgList=fundingGoods.getFundingGoods();
		System.out.println("funding:::"+funding);
		System.out.println("fundingGoods::"+fgList);
		
		Map<String, MultipartFile> mMap= multipartRequest.getFileMap(); // key : tag name, value: multipartFile list
		List<FundingImage> imgList = new ArrayList<>(); //?????? img ???????????? ?????????
		
		Map<String, List<MultipartFile>> paramMap = multipartRequest.getMultiFileMap();
		for (Entry<String, List<MultipartFile>> entry : paramMap.entrySet()) {
			logger.info("paramMap??? ???: "+ paramMap );
			List<MultipartFile> fileList=entry.getValue(); //multipartFile List
			
			logger.info("?????? ?????? name: "+entry.getKey()+fileList.size());

			//????????? ??????, ???????????? ??????
			for(int i=0; i<fileList.size();i++) {
				String fileName=fileList.get(i).getOriginalFilename();
				logger.info("files ?????????  :::"+ fileName );
				if(fileName!="") { 
					String originName = fileList.get(i).getOriginalFilename();
					String changeName = saveFile(fileList.get(i),request);
					System.out.println("change::"+changeName);
					if( (entry.getKey()).equals("thumbFile")) { //?????? tag??? ?????????????????? funding??? setting
						funding.setThumbnailOriginName(originName);
						funding.setThumbnailChangeName(changeName);
					}
					else { //????????? ????????????
						FundingImage img=new FundingImage();
						img.setImgChangeName(changeName);
						img.setImgOriginName(originName); 
						img.setImgNo(Integer.valueOf( (entry.getKey()).substring((entry.getKey()).length()-1)));
						logger.info("?????? ?????? imgNo: "+ (entry.getKey()).substring((entry.getKey()).length()-1) );
						imgList.add(img);
					}
				}
			}
			
		}
		logger.info("funding :: imgList :: "+ imgList);
		
		fundingService.insertFunding(funding,imgList,fgList);
		
		return "redirect:/funding";
	}

	// ????????? content?????? ?????? ????????? ??????
	@RequestMapping(value="/funding/contentFile", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String uploadFundingSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources  + "/upload_files/funding/";
		
	
		String originalFileName = multipartFile.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String saveFileName = UUID.randomUUID()+extension;
		System.out.println("resources : "+resources+"   "+"resources/upload_files/funding/" + saveFileName);
			
		File targetFile = new File(savePath+saveFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "resources/upload_files/funding/" + saveFileName);
			jsonObject.addProperty("responseCode", "succcess");
		} catch(IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}	

		String result = jsonObject.toString();
		return result;
	}
	
	
	// ?????? ?????????
	@RequestMapping(value="funding/{fpNo}")
	public String selectFundingDetail(@PathVariable("fpNo") int fpNo, Model model) throws Exception {
		fundingService.updateFundingHitsCount(fpNo);
		Funding funding= fundingService.selectFunding(fpNo);
		System.out.println(fpNo);
		List<FundingImage> fundingImageList = fundingService.selectFundingImageList(fpNo);
		List<FundingGoods> fundingGoodsList = fundingService.selectFundingGoodsList(fpNo);
		System.out.println("fundingImgList :::"+fundingImageList);
		model.addAttribute("funding",funding );
		model.addAttribute("fundingImageList", fundingImageList);
		model.addAttribute("fundingGoodsList", fundingGoodsList);
		return "funding/fundingDetailView";
	}
	
	//?????? ?????? ?????????
	@ResponseBody
	@RequestMapping(value="funding/{fpNo}/reply",produces="application/json;charset=utf-8")
	public String selectReplyList(@PathVariable("fpNo")int fpNo) {
		List<FundingReply> fundingReplyList = fundingService.selectFundingReplyList(fpNo);
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(fundingReplyList);
	}
	
	//?????? ?????? ??????
	@ResponseBody
	@RequestMapping(value="funding/{fpNo}/reply/insert")
	public String insertReply(@PathVariable("fpNo")int fpNo, FundingReply fundingReply) throws Exception {
		fundingReply.setReplyContent( (fundingReply.getReplyContent()).replace("\n", "<br>")); 
		int result = fundingService.insertFundingReply(fundingReply);
		
		return String.valueOf(result);
	}
	
	
	// ?????????????????? update ????????? ??????
	@RequestMapping("funding/{fpNo}/updateForm")
	public String enrollForm(@PathVariable("fpNo")int fpNo,Model model) {
		List<FundingCategory> categoryList = fundingService.selectFundingCategoryList();
		Funding funding= fundingService.selectFunding(fpNo);
		List<FundingGoods>fundingGoodsList = fundingService.selectFundingGoodsList(fpNo);
		List<FundingImage> fundingImageList= fundingService.selectFundingImageList(fpNo);
		model.addAttribute("category", categoryList);
		model.addAttribute("funding", funding);
		model.addAttribute("fundingGoodsList", fundingGoodsList);
		model.addAttribute("fundingImageList", fundingImageList);
		return "funding/fundingUpdateForm";
	}
	
	//?????? ????????????
	@RequestMapping(value="funding/{fpNo}/update")
	public String updateFunding(@PathVariable("fpNo")int fpNo,Funding funding, Model model,
			HttpServletRequest request, MultipartHttpServletRequest multipartRequest) throws Exception {
		logger.info("updateFunding::: "+funding);

		Map<String, MultipartFile> mMap= multipartRequest.getFileMap(); // key : tag name, value: multipartFile list
		List<FundingImage> imgList = new ArrayList<>(); //?????? img ???????????? ?????????
		
		Map<String, List<MultipartFile>> paramMap = multipartRequest.getMultiFileMap();
		for (Entry<String, List<MultipartFile>> entry : paramMap.entrySet()) {
			
			List<MultipartFile> fileList=entry.getValue(); //multipartFile List
			
			logger.info("?????? ?????? name: "+entry.getKey()+fileList.size());
			int cnt=1;
			//????????? ??????, ???????????? ??????
			for(int i=0; i<fileList.size();i++) {
				String fileName=fileList.get(i).getOriginalFilename();
				if(fileName!="") { 
					String originName = fileList.get(i).getOriginalFilename();
					String changeName = saveFile(fileList.get(i),request);
					logger.info("updateFunding:::::: "+ originName+"   "+changeName);
					System.out.println("change::"+changeName);
					if( (entry.getKey()).equals("thumbFile") && !changeName.equals("") ) { //?????? tag??? ?????????????????? funding??? setting
						funding.setThumbnailOriginName(originName);
						funding.setThumbnailChangeName(changeName);
					}
					else { //????????? ????????????
						FundingImage img=new FundingImage();
						img.setFpNo(fpNo);
						img.setImgChangeName(changeName);
						img.setImgOriginName(originName); 
						img.setImgNo(Integer.valueOf( (entry.getKey()).substring((entry.getKey()).length()-1)));
						logger.info("?????? ?????? imgNo: "+ (entry.getKey()).substring((entry.getKey()).length()-1) );
						imgList.add(img);
					}
				}
			}
		}
		
		fundingService.updateFunding(funding);
		if(!imgList.isEmpty()) {
			fundingService.updateNewFundingImageList(imgList);
		}
		return "redirect:/funding/"+fpNo;
	}
	
	//?????? ??????
	@RequestMapping(value="funding/{fpNo}/delete")
	public String deleteFunding(@PathVariable("fpNo")int fpNo) throws Exception {
		fundingService.deleteFunding(fpNo);
		return "redirect:/funding";
	}
	
	//?????? ?????????
	@RequestMapping(value="funding/{fpNo}/support")
	public String supportFundingForm(@PathVariable("fpNo") int fpNo, Model model) {
		Funding funding =fundingService.selectFunding(fpNo);
		List<FundingGoods> fundingGoodsList = fundingService.selectFundingGoodsList(fpNo);
		System.out.println("fundingList=="+fundingGoodsList);
		model.addAttribute("funding", funding);
		model.addAttribute("fundingGoodsList", fundingGoodsList);
		return "funding/fundingSupportForm";
	}
	
	//?????? ????????????
	@RequestMapping(value="funding/{fpNo}/support/insert")
	public String insertFundingSupporter(@PathVariable("fpNo") int fpNo,FundingSupporter fundingSupporter, Model model)throws Exception {
		fundingSupporter.setFpSupporter(((Member)model.getAttribute("loginUser")).getUserId());
		fundingSupporter.setFpNo(fpNo);
		fundingService.insertFundingSupporter(fundingSupporter);
		Member loginUser = memberService.selectThisUser((Member)model.getAttribute("loginUser"));
		model.addAttribute("loginUser", loginUser);
		return "redirect:/funding/"+fpNo+"/complete";
	}
	// ?????????????????? ???????????????
	@RequestMapping("funding/{fpNo}/complete")
	public String completeFunding(@PathVariable("fpNo") int fpNo,Model model) {
		Funding funding =fundingService.selectFunding(fpNo);
		model.addAttribute("funding", funding);
		return "funding/fundingCompleteView";
	}
	
	//?????? ?????? ??????
	@ResponseBody
	@RequestMapping(value="funding/{fpNo}/reply/{replyNo}/update")
	public String updateReply(@PathVariable("fpNo")int fpNo, @PathVariable("replyNo")int replyNo,FundingReply fundingReply)throws Exception {
		fundingReply.setReplyNo(replyNo);
		logger.info("fundingReply update::"+fundingReply);
		int result = fundingService.updateFundingReply(fundingReply);
		return String.valueOf(result);
	}
	
	//?????? ?????? ??????
	@ResponseBody
	@RequestMapping(value="funding/{fpNo}/reply/{replyNo}/delete")
	public String deleteReply(@PathVariable("fpNo")int fpNo, @PathVariable("replyNo")int replyNo)throws Exception {
		int result = fundingService.deleteFundingReply(replyNo);
		return String.valueOf(result);
	}


	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		logger.info("=================== saveFile ?????? ==========================");
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"/upload_files/funding/";

		System.out.println("savePath"+savePath);
		String originName = file.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName =System.currentTimeMillis() + "_" + (int)( Math.random() * 10000000) + ext;
		System.out.println("changeName"+changeName);
		try {
			file.transferTo(new File(savePath+changeName));
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
		String savePath=resources+"/upload_files/funding/";
		System.out.println("savePath"+savePath);
		
		File deleteFile= new File(savePath+fileName);
		deleteFile.delete();
		
	}
}
