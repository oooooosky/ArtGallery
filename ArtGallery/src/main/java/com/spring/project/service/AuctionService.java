package com.spring.project.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.project.dto.AuctionDTO;
import com.spring.project.dto.PageDTO;
import com.spring.project.dto.ReviewDTO;
import com.spring.project.repository.AuctionRepository;

@Service
public class AuctionService implements AuctionInterface{

	@Autowired
	private AuctionRepository ar;
	
	// 경매 페이지 요청
	@Override
	public AuctionDTO auctionForm() {
		return ar.auctionForm();
	}
	
	// 경매 정보 저장
	@Override
	public void saveFile(AuctionDTO auction) throws IllegalStateException, IOException {
		MultipartFile a_file = auction.getA_file();
		String a_filename = a_file.getOriginalFilename();
		a_filename = System.currentTimeMillis() + "-" + a_filename;
		String savePath = "/Users/sky/EclipseJava/source/Spring/ArtGallery/src/main/webapp/resources/upload/"+a_filename;
		if(!a_file.isEmpty()) {
			a_file.transferTo(new File(savePath));
		}
		auction.setA_filename(a_filename);
		ar.saveFile(auction);
		ar.savePrice(auction);
	}

	// 경매 페이지 가격 요청
	@Override
	public AuctionDTO bidForm() {
		return ar.bidForm();
	}

	// 경매 등록 페이지 요청 (단 1개만 진행 가능하게)
	@Override
	public String find() {
		int result = ar.find();
		if(result==0) {
			return "auction/registration";
		} else {
			return "redirect:/auction/auction";			
		}
	}

	// 입찰가 저장
	@Override
	public void saveBid(AuctionDTO auction) {
		ar.saveBid(auction);
	}

	// 결제 성공 정보 저장
	@Override
	public void success(AuctionDTO auction) {
		ar.success(auction);
	}

	// 게시글 목록 요청
	@Override
		public List<AuctionDTO> findAll() {
			return ar.findAll();
		}

	// 페이징 처리
	private static final int PAGE_LIMIT = 10; // 한페이지에 보여질 글 개수 
	private static final int BLOCK_LIMIT = 3; // 한화면에 보여질 페이지 개수
		
	// 페이징 처리 요청
	@Override
	public List<AuctionDTO> pagingList(int page) {
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
		List<AuctionDTO> pagingList = ar.pagingList(pagingParam);
		return pagingList;
	}
	
	// 페이징 처리 요청
	@Override
	public PageDTO paging(int page) {
		int boardCount = ar.boardCount();
		// ceil : 소수점이 있으면 다음 정수로 올림해줌.
		int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
		// 2페이지를 요청했으면 1페이지, 4페이지를 요청했으면 4페이지, 8페이지를 요청했으면 7페이지의 값을 갖도록 계산
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage > maxPage)
			endPage = maxPage; 
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		return paging;
	}
	
	// 경매기록 상세조회
	@Override
	public AuctionDTO detail(long a_number) {
		AuctionDTO auction = ar.detail(a_number);
		return auction;
	}

	// 리뷰 작성
	@Override
	public void reviewWriting(ReviewDTO review) {
		ReviewDTO result = ar.findReview(review);
		if(result==null) {
			ar.reviewWriting(review);			
		} else {
			ar.autoUpdate(review);
		}
	}

	// 리뷰 목록
	@Override
	public List<ReviewDTO> reviewFindAll() {
		return ar.reviewFindAll();
	}
	
	// 리뷰 페이징
	@Override
	public List<ReviewDTO> reviewPagingList(int page) {
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
		List<ReviewDTO> pagingList = ar.reviewPagingList(pagingParam);
		return pagingList;
	}

	// 리뷰 상세조회
	@Override
	public ReviewDTO reviewDetail(long r_number) {
		ReviewDTO review = ar.reviewDetail(r_number);
		return review;
	}
	
}
