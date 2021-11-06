package com.pongsung.donet.donation.controller;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.donation.model.service.DonationService;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.SupporComment;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.donation.model.vo.SupportCategory;
import com.pongsung.donet.donation.model.vo.SupportFilter;
import com.pongsung.donet.donation.model.vo.SupportImage;
import com.pongsung.donet.donation.model.vo.SupportUsePlan;
import com.pongsung.donet.donation.model.vo.SupportUsePlanList;
import com.pongsung.donet.funding.model.vo.FundingSupporter;
import com.pongsung.donet.member.model.vo.Member;

@SessionAttributes("loginUser") 
@Controller
public class DonationController {

	@Autowired
	private DonationService donationService;
	
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
	
	@RequestMapping("list.do")
	public String donationList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = donationService.selectDonationListCount();
		System.out.println("listCount"+listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		System.out.println("pi"+pi);
		
		List<Support> list = donationService.selectDonationList(pi);
		System.out.println("support"+list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		System.out.println("model "+model);
		
		return "donation/donationMain";
	}
	
	@RequestMapping("detail.do")
	public ModelAndView donationDetail(int suNo, ModelAndView mv){
		Support s = donationService.selectDonation(suNo);
		Sponsor p = donationService.selectSponsor(suNo);
		List<SupportUsePlan> u = donationService.selectSupportUsePlan(suNo);
		List<Sponsor> pList = donationService.selectSponsorList(suNo);
		List<SupportImage> ImgList = donationService.selectImageList(suNo);
		
		mv.addObject("s", s).setViewName("donation/donationDetail");
		mv.addObject("p", p).setViewName("donation/donationDetail");
		mv.addObject("u", u).setViewName("donation/donationDetail");
		mv.addObject("pList", pList).setViewName("donation/donationDetail");
		mv.addObject("ImgList", ImgList).setViewName("donation/donationDetail");

		System.out.println("ImgList "+ImgList);
		return mv;
	}

	@RequestMapping("reist.do")
	public String registDonation() {
		
		return "donation/registration";
	}
	
	@RequestMapping("select.ca")
	public String selectCategory(Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "suCategoryName", required = false) String suCategoryName) {

		SupportCategory suCategory = new SupportCategory();
		suCategory.setSuCategoryName(suCategoryName);
		
		int listCount = donationService.selectDonationCaListCount(suCategory);
		System.out.println("listCount"+listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		System.out.println("pi"+pi);
		
		List<Support> list = donationService.selectDonationCaList(pi, suCategory);
		System.out.println("support"+list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		System.out.println("model "+model);
		
		return "donation/donationMain";
	}
	
	@RequestMapping("select.or")
	public String selectOrder(Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "order", required = false) int order) {
		
		SupportFilter supportFilter = new SupportFilter();
		supportFilter.setOrder(order);
		
		int listCount = donationService.selectDonationListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		
		List<Support> list = donationService.selectDonationOrList(pi, supportFilter);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		System.out.println("order "+order);
		System.out.println("supportFilter "+supportFilter);
		
		return "donation/donationMain";
	}
	
	@ResponseBody
	@RequestMapping(value = "list.re", produces = "application/json; charset=utf-8")
	public String selectReplyList(int suNo) {

		ArrayList<SupporComment> commentList = donationService.selectReplyList(suNo);
		System.out.println("commentList "+commentList);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(commentList);
	}
	
	@ResponseBody
	@RequestMapping("insert.re")
	public String insertReply(SupporComment sc) {
		int result = donationService.insertReply(sc);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="delete.re/{replyNo}")
	public String deleteReply(@PathVariable("replyNo")int replyNo) {
		int result = donationService.deleteReply(replyNo);
		System.out.println(replyNo);
		System.out.println(result);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="update.re/{suNo}/{replyNo}")
	public String updateReply(@PathVariable("suNo")int suNo, @PathVariable("replyNo")int replyNo, SupporComment sc) {
		sc.setReplyNo(replyNo);
		int result = donationService.updateReply(sc);
		return String.valueOf(result);
	}

	@RequestMapping("insert.bo")
	public String insertBoard(Support support, HttpServletRequest request, MultipartHttpServletRequest multipartRequest
			,@ModelAttribute SupportUsePlanList supportUsePlan, Model model)
			throws Exception {
		List<SupportUsePlan> list= supportUsePlan.getSupportUsePlan();
		System.out.println("support "+support);
		System.out.println("SupportUsePlan "+ list);
		
		Map<String, MultipartFile> mMap= multipartRequest.getFileMap(); 
		List<SupportImage> imgList = new ArrayList<>(); 
		
		Map<String, List<MultipartFile>> paramMap = multipartRequest.getMultiFileMap();
		for (Entry<String, List<MultipartFile>> entry : paramMap.entrySet()) {
			
			List<MultipartFile> fileList=entry.getValue(); 
			
			
			
			
			for(int i=0; i<fileList.size();i++) {
				String fileName=fileList.get(i).getOriginalFilename();
				if(fileName!="") { 
					String originName = fileList.get(i).getOriginalFilename();
					String changeName = saveFile(fileList.get(i),request);
					System.out.println("change "+changeName);
					if( (entry.getKey()).equals("thumbFile")) { 
						support.setThumbnailOrigin(originName);
						support.setThumbnailChange(changeName);
					}
					else { 
						SupportImage img=new SupportImage();
						img.setImgChangeName(changeName);
						img.setImgOriginName(originName); 
						img.setImgNo(Integer.valueOf( (entry.getKey()).substring((entry.getKey()).length()-1)));
						imgList.add(img);
					}
				}
			}
			
		}
		
		
		donationService.insertBoard(support,imgList,list);
		
		return "redirect:/list.do";
	}
		private String saveFile(MultipartFile file, HttpServletRequest request) {
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources+"/upload_files/donation/";

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
				throw new CommException("파일 업로드 실패");
			}
			return changeName;
		}
		
		@RequestMapping(value="supporting")
		public ModelAndView SupportPurchase(int suNo, ModelAndView mv){
			Support p = donationService.selectDonation(suNo);
			
			mv.addObject("p", p).setViewName("donation/supporting");

			System.out.println("p "+p);
			System.out.println("suNo "+suNo);
			return mv;
		}
		
		@RequestMapping("select.pop")
		public String showPop(){
		
			return "donation/pop";
		}
		
		@ResponseBody
		@RequestMapping("supportCharity")
		public String insertSupportCharity(Sponsor s) {
			int result = donationService.insertSupportCharity(s);
			System.out.println("s "+s);
			
			return String.valueOf(result);
		}


}
