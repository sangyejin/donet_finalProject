package com.pongsung.donet.goods.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.pongsung.donet.common.PageInfo;
import com.pongsung.donet.common.Pagination;
import com.pongsung.donet.common.exception.CommException;
import com.pongsung.donet.funding.controller.FundingController;
import com.pongsung.donet.goods.model.service.GoodsService;
import com.pongsung.donet.goods.model.vo.Beneficiary;
import com.pongsung.donet.goods.model.vo.Goods;
import com.pongsung.donet.goods.model.vo.GoodsCategory;
import com.pongsung.donet.goods.model.vo.RequiredGoods;
import com.pongsung.donet.goods.model.vo.RequiredGoodsList;

@SessionAttributes("loginUser") 
@Controller
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(FundingController.class);
	
	@Autowired
	private GoodsService goodsService;
	
	// 구호물품 리스트
	@RequestMapping("goods")
	public String seletcFundingList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		int listCount = goodsService.selectGoodsListCount();
		logger.info("goodsListCount::" + listCount);
		
		List<GoodsCategory> categoryList = goodsService.selectGoodsCategoryList();
		logger.info("categoryList:::"+categoryList);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);

		List<Goods> goodsList = goodsService.selectGoodsList(pi);
		logger.info("goodsList::" + goodsList);

		model.addAttribute("categoryList", categoryList);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("pi", pi);

		return "goods/goodsListView";
	}
	


	// 구호물품 디테일
	@RequestMapping(value="goods/{goodsNo}")
	public String selectGoodsDetail(@PathVariable("goodsNo") int goodsNo, Model model) {
		goodsService.updateGoodsHitsCount(goodsNo);
		Goods goods= goodsService.selectGoods(goodsNo);
		System.out.println(goodsNo);
		//List<GoodsImage> goodsImageList = goodsService.selectGoodsImageList(goodsNo);
		//System.out.println("goodsImgList :::"+goodsImageList);
		model.addAttribute("goods",goods);

		return "goods/goodsDetailView";
	}
	
	// 구호물품 삭제
	@RequestMapping(value="goods/{goodsNo}/delete")
	public String deleteGoods(@PathVariable("goodsNo") int goodsNo, Model model) {
		goodsService.deleteGoods(goodsNo);
		return "redirect:/goods";
	}
	
	//구호물품 등록 폼
	@RequestMapping("goods/insertForm")
	public String insertGoodsForm(Model model) {
		List<GoodsCategory> categoryList=goodsService.selectGoodsCategoryList();
		List<Beneficiary> beneficiaryList= goodsService.selectBeneficiaryList();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("beneficiaryList", beneficiaryList);
		return "goods/goodsEnrollForm";
	}
	
	// 구호물품 게시글 등록
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
	
	//구호물품 게시글 수정폼
	@RequestMapping(value="goods/{goodsNo}/updateForm")
	public String updateGoodsForm(@PathVariable("goodsNo") int goodsNo, Model model) {
		Goods goods=goodsService.selectGoods(goodsNo);
		List<GoodsCategory> goodsCategoryList= goodsService.selectGoodsCategoryList();
		goods.setContent( goods.getContent().replace("<br>", "\n") );
		model.addAttribute("goods", goods);
		model.addAttribute("goodsCategoryList", goodsCategoryList);
		return "goods/goodsUpdateForm";
	}
	
	//구호물품 게시글 수정
	@RequestMapping(value="goods/{goodsNo}/update")
	public String updateGoods(@PathVariable("goodsNo") int goodsNo,Goods goods
			 ,HttpServletRequest request,@RequestParam(name="thumbFile",required=false) MultipartFile file
			 , Model model) {
		goods.setContent(goods.getContent().replace("\n", "<br>"));
		
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
		logger.info("=================== saveFile 진입 ==========================");
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
	
	
	
}
