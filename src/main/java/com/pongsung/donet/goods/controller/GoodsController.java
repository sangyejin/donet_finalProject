package com.pongsung.donet.goods.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.goods.model.service.GoodsService;
import com.pongsung.donet.goods.model.vo.Beneficiary;
import com.pongsung.donet.goods.model.vo.BeneficiaryList;
import com.pongsung.donet.goods.model.vo.FilterOrder;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.goods.model.vo.GoodsCategory;
import com.pongsung.donet.goods.model.vo.GoodsPurchase;
import com.pongsung.donet.goods.model.vo.RequiredGoods;
import com.pongsung.donet.goods.model.vo.RequiredGoodsList;
import com.pongsung.donet.member.model.service.MemberService;
import com.pongsung.donet.member.model.vo.Member;

@SessionAttributes("loginUser") 
@Controller
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// ???????????? ????????? ?????????
	@RequestMapping("goods")
	public String mainGoods(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "categoryNo", required = false, defaultValue = "0") int categoryNo,
			@RequestParam(value = "order", required = false, defaultValue = "CREATE_DATE DESC") String order,
			Model model) {
		logger.info("categoryNo::::"+categoryNo);
		
		FilterOrder filterOrder=new FilterOrder(categoryNo,order,"");
		
		int listCount = goodsService.selectGoodsListCount(filterOrder);
		logger.info("selectGoodsList :: goodsListCount::" + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		logger.info("selectGoodsList :: PI::::::::"+pi);
	

		List<GoodsCategory> categoryList = goodsService.selectGoodsCategoryList();
		logger.info("categoryList:::"+categoryList);

		//List<Goods> goodsList = goodsService.selectGoodsList(pi,filterOrder);
		//logger.info("goodsList::" + goodsList);

		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("order", order);
		model.addAttribute("pi", pi);
		
		//model.addAttribute("goodsList", goodsList);
		return "goods/goodsListView";
	}
	
	//???????????? ????????? ????????????
	@ResponseBody
	@RequestMapping(value="goods/list",produces="application/json;charset=utf-8")
	public String selectGoodsList(PageInfo pi, FilterOrder filterOrder) {
		logger.info("selectGoodsList :: filterOrder::" + filterOrder);
		
		int listCount = goodsService.selectGoodsListCount(filterOrder);
		logger.info("selectGoodsList :: goodsListCount::" + listCount);
		
		PageInfo p = Pagination.getPageInfo(listCount, pi.getCurrentPage(), 5, 15);
		
		logger.info("selectGoodsList :: PI::::::::"+p);
		logger.info("selectGoodsList :: filterOrder::::::::"+filterOrder);
		
		Map<String,Object> map= new HashMap<>();
		List<Goods> goodsList=goodsService.selectGoodsList(pi,filterOrder);
		logger.info("selectGoodsList :: goodsList:::::::"+goodsList);
		map.put("goodsList",goodsList);
		map.put("pi",p);
		
		return new GsonBuilder().create().toJson(map);
	}
	

	// ???????????? ?????????
	@RequestMapping(value="goods/{goodsNo}")
	public String selectGoodsDetail(@PathVariable("goodsNo") int goodsNo, Model model)throws Exception {
		goodsService.updateGoodsHitsCount(goodsNo);
		Goods goods= goodsService.selectGoods(goodsNo);
		System.out.println(goodsNo);
		model.addAttribute("goods",goods);

		return "goods/goodsDetailView";
	}
	
	// ???????????? ??????
	@RequestMapping(value="goods/{goodsNo}/delete")
	public String deleteGoods(@PathVariable("goodsNo") int goodsNo, Model model) throws Exception{
		goodsService.deleteGoods(goodsNo);
		return "redirect:/goods";
	}
	
	//???????????? ?????? ???
	@RequestMapping("goods/insertForm")
	public String insertGoodsForm(Model model) {
		List<GoodsCategory> categoryList=goodsService.selectGoodsCategoryList();
		List<Beneficiary> beneficiaryList= goodsService.selectBeneficiaryList();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("beneficiaryList", beneficiaryList);
		return "goods/goodsEnrollForm";
	}
	
	// ????????? content?????? ?????? ????????? ??????
	@RequestMapping(value="/goods/contentFile", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String uploadGoodsSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources  + "/upload_files/goods/";
		
	
		String originalFileName = multipartFile.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String saveFileName = UUID.randomUUID()+extension;
		System.out.println("resources : "+resources+"   "+"resources/upload_files/goods/" + saveFileName);
			
		File targetFile = new File(savePath+saveFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "resources/upload_files/goods/" + saveFileName);
			jsonObject.addProperty("responseCode", "succcess");
		} catch(IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}	

		String result = jsonObject.toString();
		return result;
	}

	// ???????????? ????????? ??????
	@RequestMapping("goods/insert")
	public String insertGoods(Goods goods, HttpServletRequest request, @ModelAttribute RequiredGoodsList requiredGoods,
			@RequestParam(name="thumbFile",required=false) MultipartFile file, Model model) throws Exception {
		List<RequiredGoods> requiredGoodsList= requiredGoods.getRequiredGoods();
		logger.info("requiredGoodsList:::"+requiredGoodsList);
		logger.info("Goods:::"+goods);

		if(!file.getOriginalFilename().equals("")) {
			String changeName=saveFile(file,request);
			
			if(changeName!=null) {
				goods.setThumbnailOriginName(file.getOriginalFilename());
				goods.setThumbnailChangeName(changeName);
			}
		}
		goodsService.insertGoods(goods,requiredGoodsList);
		

		return "redirect:/goods";
	}
	
	//???????????? ????????? ?????????
	@RequestMapping(value="goods/{goodsNo}/updateForm")
	public String updateGoodsForm(@PathVariable("goodsNo") int goodsNo, Model model) {
		Goods goods=goodsService.selectGoods(goodsNo);
		List<GoodsCategory> goodsCategoryList= goodsService.selectGoodsCategoryList();
		List<Beneficiary> oldBeneficiaryList= goodsService.selectBeneficiaryListByGoodsNo(goodsNo);
		List<Beneficiary> beneficiaryList= goodsService.selectBeneficiaryList();
		
		model.addAttribute("goods", goods);
		model.addAttribute("beneficiaryList",beneficiaryList);
		model.addAttribute("oldBeneficiaryList", oldBeneficiaryList);
		model.addAttribute("goodsCategoryList", goodsCategoryList);
		return "goods/goodsUpdateForm";
	}
	
	//???????????? ????????? ??????
	@RequestMapping(value="goods/{goodsNo}/update")
	public String updateGoods(@PathVariable("goodsNo") int goodsNo,Goods goods,@ModelAttribute RequiredGoodsList rgList
			 ,HttpServletRequest request,@RequestParam(name="thumbFile",required=false) MultipartFile file
			 , Model model) throws Exception{
		List<RequiredGoods> oldBeneficiaryList= goodsService.selectRequiredGoodsListByGoodsNo(goodsNo);
		List<RequiredGoods> newBeneficiaryList= rgList.getRequiredGoods();
		
		for(int i=0; i<newBeneficiaryList.size();i++) {
			newBeneficiaryList.get(i).setGoodsNo(goodsNo);
		}

		
		//????????? ?????? 
		List<RequiredGoods> temp= new ArrayList<>();
		temp.addAll(newBeneficiaryList); //????????? ??????
		temp.retainAll(oldBeneficiaryList); //???????????? ???????????? ?????????
		newBeneficiaryList.removeAll(temp); //????????????????????? ?????? ?????????
		oldBeneficiaryList.removeAll(temp); //??????????????? ?????? ?????????
		logger.info("updateGoods ::: ????????? ????????? : "+oldBeneficiaryList);
		logger.info("updateGoods ::: ????????? ????????? : "+newBeneficiaryList);
		if(!oldBeneficiaryList.isEmpty()) {
			goodsService.deleteOldequiredGoods(oldBeneficiaryList);
		}
		if(!newBeneficiaryList.isEmpty()) {
			goodsService.insertNewRequiredGoods(newBeneficiaryList);	
		}
		
		// ????????? ?????? ?????? 
		if(!file.getOriginalFilename().equals("")) {
			if(goods.getThumbnailChangeName()!=null) {
				deleteFile(goods.getThumbnailChangeName(),request);
			}
			String changeName=saveFile(file,request);
			
			goods.setThumbnailOriginName(file.getOriginalFilename());
			goods.setThumbnailChangeName(changeName);
		}

		goodsService.updateGoods(goods);
		
		return "redirect:/goods/"+goodsNo;
	}
	
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		logger.info("=================== saveFile ?????? ==========================");
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"/upload_files/goods/";

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
		String savePath=resources+"/upload_files/goods/";
		System.out.println("savePath"+savePath);
		
		File deleteFile= new File(savePath+fileName);
		deleteFile.delete();
		
	}
	
	
	//???????????? ?????????
	@RequestMapping(value="goods/{goodsNo}/support")
	public String supportGoodsForm(@PathVariable("goodsNo") int goodsNo, Model model) {
		Goods goods =goodsService.selectGoods(goodsNo);
		List<Beneficiary> beneficiaryList = goodsService.selectBeneficiaryListByGoodsNo(goodsNo);
		
		model.addAttribute("goods", goods);
		model.addAttribute("beneficiaryList", beneficiaryList);
		return "goods/goodsSupportForm";
	}
	
	//???????????? ??????
	@RequestMapping(value="goods/{goodsNo}/support/insert")
	public String insertGoodsPurchase(@PathVariable("goodsNo") int goodsNo,GoodsPurchase goodsPurchase, Model model) throws Exception{
		goodsPurchase.setUserId(((Member)model.getAttribute("loginUser")).getUserId());
		logger.info("insertGoodsPurchase :: goodsPurchase ::"+goodsPurchase);
		goodsService.insertGoodsPurchase(goodsPurchase);
		
		Member loginUser = memberService.selectThisUser((Member)model.getAttribute("loginUser"));
		model.addAttribute("loginUser", loginUser);
		return "redirect:/goods/"+goodsNo+"/complete";
	}
	
	// ???????????? ???????????????
	@RequestMapping("goods/{goodsNo}/complete")
	public String completeGoods(@PathVariable("goodsNo") int goodsNo,Model model) {
		Goods goods =goodsService.selectGoods(goodsNo);
		model.addAttribute("goods", goods);

		return "goods/goodsCompleteView";
	}
}
