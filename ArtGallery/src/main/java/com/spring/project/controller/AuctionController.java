package com.spring.project.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project.dto.AuctionDTO;
import com.spring.project.dto.PageDTO;
import com.spring.project.dto.ReviewDTO;
import com.spring.project.service.AuctionService;

@Controller
@RequestMapping(value="/auction/*")
public class AuctionController {
	
	@Autowired
	private AuctionService as;
	
	// AC001. 경매 페이지 요청
	@RequestMapping(value="auction", method=RequestMethod.GET)
	public String auctionForm(Model model) {
		AuctionDTO auction = as.auctionForm();
		AuctionDTO bid = as.bidForm();
		model.addAttribute("auction", auction);
		model.addAttribute("bid",bid);
		return "auction/auction";
	}
	
	// AC002. 경매 등록창 요청
	@RequestMapping(value="registration", method=RequestMethod.GET)
	public String registrationForm() {
		String result = as.find();
		return result;
	}
	
	// AC003. 경매 정보 저장
	@RequestMapping(value="registration", method=RequestMethod.POST)
	public String saveFile(@ModelAttribute AuctionDTO auction) throws IllegalStateException, IOException{
		as.saveFile(auction);
		return "redirect:/auction/auction";
	}
	
	// AC004. 입찰가 저장
	@RequestMapping(value="bid", method=RequestMethod.POST)
	public String saveBid(@ModelAttribute AuctionDTO auction) {
		as.saveBid(auction);
		return "redirect:/auction/auction";
	}
	
	// AC005. 경매 결제창 요청
	@RequestMapping(value="kakaoPay", method=RequestMethod.GET)
	public String kakaoPay(Model model) {
		AuctionDTO auction = as.auctionForm();
		AuctionDTO bid = as.bidForm();
		model.addAttribute("auction", auction);
		model.addAttribute("bid",bid);
		return "auction/kakaoPay";
	}
	
	// AC006. 결제 성공
	@RequestMapping(value="success", method=RequestMethod.POST)
	public String success(@ModelAttribute AuctionDTO auction) {
		as.success(auction);
		return "redirect:/auction/auction";
	}
	
	// AC007. 역대 경매 기록 요청
	@RequestMapping(value="findAll", method=RequestMethod.GET)
	public String findAll(Model model) {
		List<AuctionDTO> aList = as.findAll();
		model.addAttribute("aList", aList);
		return "auction/findAll";
	}
	
	// AC008. 페이징 처리
	@RequestMapping(value="paging", method=RequestMethod.GET)
	public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
		List<AuctionDTO> aList = as.pagingList(page);
		PageDTO paging = as.paging(page);
		model.addAttribute("aList", aList);
		model.addAttribute("paging", paging);
		return "auction/findAll";
	}
	
	// AC009. 게시글 상세 조회
	@RequestMapping(value="detail",method=RequestMethod.GET)
	public String detail(@RequestParam("a_number") long a_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		AuctionDTO auction = as.detail(a_number);
		model.addAttribute("auction",auction);
		model.addAttribute("page", page);
		return "auction/detail";
	}
	
	// 리뷰 작성 페이지 요청
	@RequestMapping(value="reviewWriting", method=RequestMethod.GET)
	public String reviewWritingForm(@RequestParam("a_number") long a_number, Model model) {
		AuctionDTO auction = as.detail(a_number);
		model.addAttribute("auction",auction);
		return "auction/reviewWriting";
	}
	
	// 리뷰 작성 저장
	@RequestMapping(value="reviewWriting", method=RequestMethod.POST)
	public String reviewWriting(@ModelAttribute ReviewDTO review) {
		as.reviewWriting(review);
		return "redirect:/auction/reviewPaging";
	}
	
	// 리뷰 목록
	@RequestMapping(value="review", method=RequestMethod.GET)
	public String review(Model model) {
		List<ReviewDTO> rList = as.reviewFindAll();
		model.addAttribute("rList", rList);
		return "auction/review";
	}
	
	// 리뷰 페이징
	@RequestMapping(value="reviewPaging", method=RequestMethod.GET)
	public String reviewPaging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
		List<ReviewDTO> rList = as.reviewPagingList(page);
		PageDTO paging = as.paging(page);
		model.addAttribute("rList", rList);
		model.addAttribute("paging", paging);
		return "auction/review";
	}
	
	// 리뷰 상세조회
	@RequestMapping(value="reviewDetail",method=RequestMethod.GET)
	public String reviewDetail(@RequestParam("r_number") long r_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		ReviewDTO review = as.reviewDetail(r_number);
		model.addAttribute("review",review);
		model.addAttribute("page", page);
		return "auction/reviewDetail";
	}
	
}
