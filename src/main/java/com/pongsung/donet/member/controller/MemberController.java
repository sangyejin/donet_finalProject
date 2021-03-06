package com.pongsung.donet.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.donation.model.vo.Sponsor;
import com.pongsung.donet.donation.model.vo.Support;
import com.pongsung.donet.funding.model.vo.FundingImage;
import com.pongsung.donet.funding.model.vo.FundingSupporter;
import com.pongsung.donet.member.model.service.MemberService;
import com.pongsung.donet.member.model.service.MemberServiceImpl;
import com.pongsung.donet.member.model.vo.Bank;
import com.pongsung.donet.member.model.vo.Member;
import com.pongsung.donet.member.model.vo.Payment;
import com.pongsung.donet.member.model.vo.Review;
import com.pongsung.donet.member.model.vo.ReviewComment;
import com.pongsung.donet.member.model.vo.ReviewImage;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired // ??????????????? ????????? ?????????????????? ????????? ?????????(?????????) ?????? @Service??? ???????????? ?????? ?????? ????????? ???????????? ???????????????.
	private MemberService memberService;
	
	@Autowired // target class test(CGLIB ????????? test)
	private MemberServiceImpl memberServiceImpl;
	
	// ????????? ?????????
		@RequestMapping("loginForm.me")
		public String loginForm() {
			//logger.debug("====== START ========");
			//logger.info("====== START info ========");
			return "member/memberLogin";
		}
	
	
	// ??????????????? ?????????
		@RequestMapping("login.me")
		public String loingMember(Member m, Model model) throws Exception{
			
				
				Member loginUser = memberService.loginMember(bCryptPasswordEncoder, m);
				System.out.println("MemberController?????? loginUser ??? : " + loginUser);
				model.addAttribute("loginUser", loginUser);
				return "redirect:/"; //redirect:index.jsp
			
		}
		
		// ????????????
		@RequestMapping("logout.me")
		public String logoutMember(SessionStatus status) {
			
			status.setComplete(); // ?????? ???????????????  @SessionAttributes??? ?????? ????????? ??????????????? ???????????????.
						
			return "redirect:/";
		} 
		

		// ?????? ?????? ???????????? ??????
		@RequestMapping("enrollForm.me")
		public String enrollForm() {
			//logger.debug("====== START ========");
			//logger.info("====== START info ========");
			return "member/memberEnrollForm";
		}
		
		
		// ?????? ????????? ???????????? ??????
		@RequestMapping("calendar.me")
		public String calendar() {
			return "attendance/Calendar";
		}
		
		
		@RequestMapping("insert.me")
		public String insertMember(@ModelAttribute Member m ,@RequestParam("post") String post,
															 @RequestParam("address1") String address1,
															 @RequestParam("address2") String address2 , HttpSession session) {
			
			
			m.setAddress(post+"/"+address1+"/"+address2);
			System.out.println(m);
			
			System.out.println("???????????? : " + m.getUserPwd());
			
			// ????????? ??????
			
			String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
			
			System.out.println("????????? ??? : "+ encPwd);
			
			m.setUserPwd(encPwd);
			
			memberService.insertMember(m);
			session.setAttribute("msg", "???????????? ??????");
			
			return "redirect:/";
		}	
		
		@RequestMapping("delete.me")
		public String deleteMember(String userId, HttpSession session) {
			
			memberService.deleteMember(userId);
			session.setAttribute("msg", "?????? ????????? ?????????????????????.");
			return "redirect:logout.me";
		}
		
		// ???????????? ????????????
		@RequestMapping("update.me")
		public String updateMember(@ModelAttribute Member m, @RequestParam("post") String post,
															 @RequestParam("address1") String address1,
															 @RequestParam("address2") String address2, Model model) {
			System.out.println("post??? ??? : " + post);
			System.out.println("address1??? ??? : " + address1);
			System.out.println("address2??? ??? : " + address2);
			System.out.println("Member m??? ??? : " + m);
			System.out.println("Model??? ??? : " + model);

			
			m.setAddress(post+"/"+address1+"/"+address2);
			
			Member userInfo = memberService.updateMember(m);
			//Member userInfo = memberServiceImpl2.updateMember(m);
			
			model.addAttribute("loginUser", userInfo);
			
			System.out.println("addAttribute Model??? ??? : " + model);
			
			return "redirect:/";
			
			}
		
		// ???????????? ????????????
		@RequestMapping("updatePwd.me")
		public String updatePwdMember (@ModelAttribute Member m, @RequestParam("userId") String userId,
																 @RequestParam("newPwd") String newPwd, Model model, SessionStatus status) {
			
			String encPwd = bCryptPasswordEncoder.encode(newPwd);
			System.out.println("encPwd??? ??? : " + encPwd);
			
			m.setUserId(userId);
			m.setUserPwd(encPwd);
			
			System.out.println("m.getUserPwd() ??? ??? : " + m.getUserPwd() + ", m.getUserId()??? ??? : " + m.getUserId());
			
			Member userInfo = memberService.updatePwdMember(m);
			System.out.println("userInfo??? ??? : " + userInfo);
						
			
			if(userInfo != null) {
				model.addAttribute("msg", "??????????????? ?????????????????????.");
				model.addAttribute("loginUser", userInfo);
				status.setComplete(); 
				return "member/memberLogin";
			}else {
				model.addAttribute("msg", "???????????? ????????? ??????????????????.");
				 return "common/errorPage";
			}	
		}
		
//		public String findUserIdMember(@ModelAttribute Member m ,@RequestParam("email") String email,
//				 @RequestParam("phone") String phone, Model model) {
//		
		
		@RequestMapping("findUserId.me")
		public String findUserIdMember(@ModelAttribute Member m, Model model) {
			
			
			System.out.println("????????? ?????? ?????? : " + model);
			
			Member userInfo = memberService.findUserIdMember(m);
			System.out.println("????????? ?????? userInfo??? ??? : " + userInfo);
			
			
			if(userInfo != null) {
				model.addAttribute("msg", "????????? : " + userInfo.getUserId());
				System.out.println("userInfo : " + userInfo.getUserId());
				model.addAttribute("userInfo", userInfo);
				return "member/memberLogin";
			}else {
				model.addAttribute("msg", "????????? ?????? ??????????????????.");
				return "common/errorPage";
			}
			
		}
		
		
		@RequestMapping("findUserPwd.me")
		public String findUserPwdMember(@ModelAttribute Member m, Model model) {
			
			
			System.out.println("???????????? ?????? ?????? : " + model);
			
			Member userInfo = memberService.findUserPwdMember(bCryptPasswordEncoder, m);
			System.out.println("???????????? ?????? userInfo??? ??? : " + userInfo);
			
			
			if(userInfo != null) {
				model.addAttribute("msg", "????????? ??????????????? ??????????????????. ");
				System.out.println("userInfo : " + userInfo.getUserPwd());
				model.addAttribute("userInfo", userInfo);
				return "member/findPwdChange";
			}else {
				model.addAttribute("msg", "??????????????? ?????? ??????????????????.");
				return "common/errorPage";
			}
			
		}
		
			

		//point charging
		@RequestMapping("point.me")
		public String chargeMyPoint(Model model) {
			ArrayList<Bank> bkList = memberService.selectBkList();
			
			//?????????????????? ????????? ????????????
			model.addAttribute("bkList", bkList);
			
			return "member/point/payment";
		}
		
		@RequestMapping("insertCard.me")
		public String insertCard(@RequestParam(name = "cardNumber1") String cardNumber1,
								@RequestParam(name = "cardNumber2") String cardNumber2,
								@RequestParam(name = "cardNumber3") String cardNumber3,
								@RequestParam(name = "cardNumber4") String cardNumber4,
								@RequestParam(name = "expireM") String expireM,
								@RequestParam(name = "expireY") String expireY,
								@RequestParam(name = "cvcNum") int cvcNum,
								@RequestParam(name = "cardBankName") int cardBankName,
								@RequestParam(name = "surname") String surname,
								@RequestParam(name = "fstname") String fstname,
								@RequestParam(name = "amount") String amount,
								HttpServletRequest request, Model model
								) {
			
			System.out.println("???????????? ????????? : ????????????"); //???????????? ??????
			System.out.println(", expireM : " + expireM + " , expireY : " + expireY + ", cvcNum : " + cvcNum + ", cardBankName : " + cardBankName + ", surname : " + surname + " ,fstname :  " + fstname);
			System.out.println("cardNumber1: " + cardNumber1 + " cardNumber2 : " + cardNumber2 + ", cardNumber3 : " + cardNumber3 + ", cardNumber4 : " + cardNumber4);

			Payment payment = new Payment();
			
			//????????? ?????? ????????????
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			String expireDate = expireM+expireY; //????????????
			String fullName = surname+fstname; //??????
			String cardNumber = cardNumber1 + cardNumber2 + cardNumber3 + cardNumber4;
			
			String amounts[] = amount.split(",");
			
			String temp = "";
			System.out.println("temp ??????");
			
			for(String str : amounts) {
				temp = temp + str ;
				System.out.println("temp  : " + temp);

			}
			
			payment.setUserId(loginUser.getUserId());
			payment.setCardNo(cardNumber);
			payment.setPayExpiry(Integer.parseInt(expireDate));
			payment.setPayCvc(cvcNum);
			payment.setBNo(cardBankName);
			payment.setPayName(fullName);
			payment.setPointAmount(Integer.parseInt(temp));
			
			memberService.insertCard(payment);
			
			//???????????? ?????? ???????????? ????????????
			
			Member thisUser = memberService.selectThisUser(loginUser);
			
			
			System.out.println("loginUser.getPoint() : " + loginUser.getPoint());
			System.out.println("thisUser.getPoint() : " + thisUser.getPoint());

			model.addAttribute("loginUser", thisUser);
			
			session.setAttribute("msg", "????????? ????????? ?????????????????????. ????????? ????????????????????? ?????? ???????????????.");
			
			return "redirect:/myPage.me";

		}
		

		@RequestMapping("updatePoint.me")
		public String updatePoint(@RequestParam(name = "amount") String amount, HttpServletRequest request, Model model) {
			
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			String amounts[] = amount.split(",");
			
			String temp = "";
			System.out.println("temp ??????");
			
			for(String str : amounts) {
				temp = temp + str ;
				System.out.println("temp  : " + temp);

			}
			
			
			//????????? ???
			loginUser.setPoint(Integer.parseInt(temp));
			
			//????????? ????????????
			memberService.updatePoint(loginUser);
			
			//???????????? ??? ????????? ????????????
			Member thisUser = memberService.selectThisUser(loginUser);
			
			
			System.out.println("loginUser.getPoint() : " + loginUser.getPoint());
			System.out.println("thisUser.getPoint() : " + thisUser.getPoint());

			model.addAttribute("loginUser", thisUser);
			
			session.setAttribute("msg", "????????? ????????? ?????????????????????. ????????? ????????????????????? ?????? ???????????????.");
			
			return "redirect:/myPage.me";
			
		}

		//?????? ??????
		@RequestMapping("userList.me")
		public String selectUserList(@RequestParam(value="currentPage", required = false , defaultValue ="1") int currentPage, Model model) {
			
			int listCount = memberService.selectUserListCount();
			System.out.println("userListCount : " + listCount );
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			ArrayList<Member> list = memberService.selectUserList(pi);
			System.out.println("list??? ??? : " + list);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "member/memberUserList";
		}
		
		//??????????????? ?????? ??? ????????? ??????
		@RequestMapping("myPage.me")
		public String selectSponsorList(String userId, Model model) {
			
			System.out.println("?????????????????? ????????? ????????? : " + userId);
			
			int listCount = memberService.selectSponsorListCount();
			System.out.println("userListCount : " + listCount );
			
			int fdSupListCount = memberService.selectFundingSupporterListCount();
			System.out.println("fdSupListCount : " + fdSupListCount );
			
			
			// ?????? ?????? ??????		
			ArrayList<Sponsor> sponsorList = memberService.selectSponsorList(userId);
			// ?????? ?????? ??????
			ArrayList<FundingSupporter> fundingSupporterList = memberService.selectFundingSuppoterList(userId);
			
			
			System.out.println("sponsorList??? ??? : " + sponsorList);
			System.out.println("fundingSupporterList??? ??? : " + fundingSupporterList);
			model.addAttribute("fundingSupporterList", fundingSupporterList);
			model.addAttribute("sponsorList", sponsorList);
			model.addAttribute("userId", userId);
					
			return "member/myPage";
		}
		
//===========================================================================

		@RequestMapping("supportReviewWrite.me")
			public String supportReviewWrite(Support support, Model model) {
					
			List<Sponsor> list = memberService.selectSupportList(support);
			System.out.println("list??? ??? : " + list);
			
			model.addAttribute("list", list);
			
			System.out.println("model??? ??? : " + model );
			
			return "member/supportReviewWrite";
		}
		
		// ?????? ?????? ??????????????? ?????? supportReviewDetail.me
		@RequestMapping("supportReviewDetail.me")
			public ModelAndView supportReviewDetail(int reNo,  ModelAndView mv) {
				System.out.println("????????? ?????? ??????" + reNo);
				
				Review rv = memberService.selectReview(reNo);
				List<ReviewImage> at = memberService.selectReviewImage(reNo);
				
				
				mv.addObject("rv", rv).setViewName("member/supportReviewDetail");
				mv.addObject("at", at).setViewName("member/supportReviewDetail");
				
				System.out.println("rv??? ??? " + rv);
				System.out.println("at??? ??? " + at);
				System.out.println("mv??? ??? " + mv);
				
			return mv;
		}
		
		// ?????? ??????????????? ???????????? ????????? ??? ??? ?????? ?????????????????? ????????? ?????????
		
		@RequestMapping("supportReviewList.me")
		public String donationReviewList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
			
			int listCount = memberService.seletDonationReviewListCount();
			System.out.println("listCount??? ??? : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
			System.out.println("pi"+pi);
			
			List<Support> list = memberService.selectDonationReviewList(pi);
			System.out.println("support ??? ??? : "+list);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			System.out.println("model ??? ??? : "+model);
			
			return "member/supportReviewList";
			
		}

		

	
		
		@RequestMapping("insertReview.me")
		public String insertReview(Review review, HttpServletRequest request, MultipartHttpServletRequest multipartRequest,
				 Model model)throws Exception {

			System.out.println("????????? ????????? ??????????????????.");
			System.out.println("reivew??? ??? : " + review );
			
			
			Map<String, MultipartFile> mMap = multipartRequest.getFileMap();
			List<ReviewImage> imgList = new ArrayList<>();
					
			Map<String, List<MultipartFile>> paramMap = multipartRequest.getMultiFileMap();
			for (Entry<String, List<MultipartFile>> entry : paramMap.entrySet()) {

				
				List<MultipartFile> fileList = entry.getValue();
				

				for(int i = 0; i < fileList.size(); i++) {
					String fileName=fileList.get(i).getOriginalFilename();
					logger.info("fileName??? ???: "+ fileName );
					if(fileName != "") {
						String originName = fileList.get(i).getOriginalFilename();
						String changeName = saveFile(fileList.get(i), request);
						System.out.println("changeName ??? ??? : " + changeName);
						if((entry.getKey()).equals("thumbFile")) { //????????? ???????????? ???
							review.setThumbnailOrigin(originName);
							review.setThumbnailChange(changeName);
						}
							else if(!(entry.getKey()).equals("files")){
							ReviewImage img = new ReviewImage();
							img.setImgChangeName(changeName);
							img.setImgOriginName(originName);
							System.out.println("img??? ??? : " + img);
							img.setImgNo(Integer.valueOf( (entry.getKey()).substring((entry.getKey()).length()-1)));
							logger.info("?????? ?????? imgNo: "+ (entry.getKey()).substring((entry.getKey()).length()-1) );
							System.out.println("???????????? img ??? ??? " + img);
							imgList.add(img);	
						}											
				}
				
			}
		}
			logger.info("review :: imgList :: "+ imgList);
			memberService.insertReview(review, imgList);
			
			return "redirect:supportReviewList.me";
			
		}
		
				
		// ?????? ?????? ?????? ??????
		@ResponseBody
		@RequestMapping(value = "rvList.me", headers="Accept=*/*" , produces = "application/json; charset=utf-8")
		public String selectReviewReplyList(int reNo) {
			System.out.println("????????? ??? ????????? ??????");
			ArrayList<ReviewComment> reviewCommentList = memberService.selectReviewReplyList(reNo);
			System.out.println("reviewCommentList??? ??? : " + reviewCommentList);
			
			return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(reviewCommentList);
		}

		
		@ResponseBody
		@RequestMapping("insertReComent.me")
		public String insertReviewReply(ReviewComment rc) {
			int result = memberService.insertReviewReply(rc);
			
			return String.valueOf(result);
			
		}
		
		@ResponseBody
		@RequestMapping(value="reReplydelete.me/{reNo}")
		public String deleteReviewReply(@PathVariable("reNo") int reNo) {
			int result = memberService.deleteReviewReply(reNo);
			System.out.println("reNo??? ??? :" + reNo);
			System.out.println("result??? ??? : " + result);
			
			return String.valueOf(result);
			
		}
		
		@ResponseBody
		@RequestMapping(value="reReviewupdate.me/{reNo}/{reBno}")
		public String updateReviewReply(@PathVariable("reBno")int suNo, @PathVariable("reNo")int reNo, ReviewComment rc) {
			rc.setReNo(reNo);
			int result = memberService.updateReviewReply(rc);
			return String.valueOf(result);
		}
		
		@ResponseBody
		@RequestMapping(value="Reviewdelete.me/{reNo}")
		public String deleteReview(@PathVariable("reNo") int reNo) {
			int result = memberService.deleteReview(reNo);
			System.out.println("?????? reNo??? ??? :" + reNo);
			System.out.println("result??? ??? : " + result);
			
			return String.valueOf(result);
			
		}
		
		
		@RequestMapping("updateReview.me")
		public String updateReview(int reNo, Review review, Model model, HttpServletRequest request, 
				MultipartHttpServletRequest multipartRequest)  throws Exception {
			
			logger.info("updateReview::: " + review);
			//review.setReContent((review.getReContent()).replace("\n", "<br>"));
			System.out.println("????????? ????????? ??????????????????.");
			
			Map<String, MultipartFile> mMap= multipartRequest.getFileMap(); // key : tag name, value: multipartFile list
			List<ReviewImage> imgList = new ArrayList<>(); // ?????? ?????? ?????? img ???????????? ?????????
			
			Map<String, List<MultipartFile>> paramMap = multipartRequest.getMultiFileMap();
			for (Entry<String, List<MultipartFile>> entry : paramMap.entrySet()) {
			
				List<MultipartFile> fileList=entry.getValue(); //multipartFile List
				logger.info("?????? ?????? name: "+entry.getKey()+fileList.size());
				
				for(int i = 0; i < fileList.size(); i++) {
					String fileName=fileList.get(i).getOriginalFilename();
					logger.info("fileName??? ???: "+ fileName );
					if(fileName != "") {
						String originName = fileList.get(i).getOriginalFilename();
						String changeName = saveFile(fileList.get(i), request);
						logger.info("updateReivew:::::: "+ originName+"   "+changeName);
						if((entry.getKey()).equals("thumbFile")) { //????????? ???????????? ???
							review.setThumbnailOrigin(originName);
							review.setThumbnailChange(changeName);
						}
							else if(!(entry.getKey()).equals("files")){
							ReviewImage img = new ReviewImage();
							img.setReNo(reNo);
							img.setImgChangeName(changeName);
							img.setImgOriginName(originName);
							System.out.println("img??? ??? : " + img);
							img.setImgNo(Integer.valueOf( (entry.getKey()).substring((entry.getKey()).length()-1)));
							logger.info("?????? ?????? imgNo: "+ (entry.getKey()).substring((entry.getKey()).length()-1) );
							System.out.println("???????????? img ??? ??? " + img);
							imgList.add(img);	
						}											
					}
				
				}
			}
			
						
			memberService.updateReview(review);
			System.out.println("update ????????????. ?????? ????????? ?????? : " + review);
			
			if(!imgList.isEmpty()) {
				memberService.updateNewReivewImageList(imgList);
			}
		
			return "redirect:supportReviewList.me";
			
		}

		
		// ?????? ?????? ???????????? ????????? ??????
		@RequestMapping("supportReviewUpdateForm.me")
		public ModelAndView supportReviewUpdate(int reNo, ModelAndView mv) {
			// ???????????? ???????????? ???????????? ??????
			System.out.println("????????? ?????? ??????" + reNo);
			
			Review rv = memberService.selectReview(reNo);
			List<ReviewImage> at = memberService.selectReviewImage(reNo);
			
			mv.addObject("rv", rv).setViewName("member/supportReviewUpdateForm");
			mv.addObject("at", at).setViewName("member/supportReviewUpdateForm");;
			
			System.out.println("?????? ?????? rv??? ??? " + rv);
			System.out.println("?????? ?????? at??? ??? " + at);
			System.out.println("?????? ?????? mv??? ??? " + mv);
			
			return mv;
		}
		
		// ????????? content?????? ?????? ????????? ??????
		@RequestMapping(value="/member/contentFile", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String uploadFundingSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
			JsonObject jsonObject = new JsonObject();
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources  + "/upload_files/donationReview/";
			
		
			String originalFileName = multipartFile.getOriginalFilename();
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			String saveFileName = UUID.randomUUID()+extension;
			System.out.println("resources : "+resources+"   "+"resources/upload_files/donationReview/" + saveFileName);
				
			File targetFile = new File(savePath+saveFileName);
			
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);
				jsonObject.addProperty("url", "resources/upload_files/donationReview/" + saveFileName);
				jsonObject.addProperty("responseCode", "succcess");
			} catch(IOException e) {
				FileUtils.deleteQuietly(targetFile);
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}	

			String result = jsonObject.toString();
			return result;
		}
		
		private String saveFile(MultipartFile file, HttpServletRequest request) {
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources  + "/upload_files/donationReview/";
			
			System.out.println("savePath"+savePath);
			
			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."));
			String changeName =System.currentTimeMillis() + "_" + (int)( Math.random() * 10000000) + ext;

			System.out.println("saveFile ????????? changeName : "+changeName);
				try {
					file.transferTo(new File(savePath+changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new CommException("?????? ????????? ??????");
				}
			return changeName;
		}
		
		private void deleteFile(String fileName, HttpServletRequest request) {
			// TODO Auto-generated method stub
			String resources=request.getSession().getServletContext().getRealPath("resources");
			String savePath=resources+"/upload_files/donationReview/";
			System.out.println("savePath"+savePath);
			
			File deleteFile= new File(savePath+fileName);
			deleteFile.delete();
			
		}
}			
