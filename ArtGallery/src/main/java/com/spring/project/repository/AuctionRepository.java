package com.spring.project.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.dto.AuctionDTO;
import com.spring.project.dto.ReviewDTO;

@Repository
public class AuctionRepository {

	@Autowired
	private SqlSessionTemplate sql;
	
	// 경매 페이지 요청
	public AuctionDTO auctionForm() {
		return sql.selectOne("Auction.auctionForm");
	}

	// 게시글 저장
	public void saveFile(AuctionDTO auction) {
		sql.insert("Auction.saveFile",auction);
	}
	
	// 경매가 저장
	public void savePrice(AuctionDTO auction) {
		sql.insert("Auction.savePrice", auction);
	}

	// 현재 입찰가 요청
	public AuctionDTO bidForm() {
		return sql.selectOne("Auction.bidForm");
	}

	// 경매 정보 저장 조건 확인
	public int find() {
		return sql.selectOne("Auction.find");
	}

	// 입찰가 저장
	public void saveBid(AuctionDTO auction) {
		if(auction.getA_email()==null) {
			sql.update("Auction.saveAid", auction);			
		} else {
			sql.update("Auction.saveEmail", auction);
		}
		sql.update("Auction.saveBid", auction);
	}

	// 결제 후 정보 저장
	public void success(AuctionDTO auction) {
		sql.update("Auction.success", auction);
	}
	
	// 게시글 목록 요청
	public List<AuctionDTO> findAll() {
		return sql.selectList("Auction.findAll");
	}

	// 게시글 갯수 요청
	public int boardCount() {
		return sql.selectOne("Auction.count");
	}
		
	// 페이징 처리 요청
	public List<AuctionDTO> pagingList(Map<String, Integer> pagingParam) {
		return sql.selectList("Auction.pagingList", pagingParam);
	}
	
	// 게시글 상세조회
	public AuctionDTO detail(long a_number) {
		AuctionDTO auction = sql.selectOne("Auction.detail",a_number);
		return auction;
	}

	public void reviewWriting(ReviewDTO review) {
		sql.insert("Auction.reviewWriting", review);
	}

	public List<ReviewDTO> reviewFindAll() {
		return sql.selectList("Auction.reviewFindAll");
	}
	
	public List<ReviewDTO> reviewPagingList(Map<String, Integer> pagingParam) {
		return sql.selectList("Auction.reviewPagingList", pagingParam);
	}

	public ReviewDTO reviewDetail(long r_number) {
		return sql.selectOne("Auction.reviewDetail",r_number);
	}

	public ReviewDTO findReview(ReviewDTO review) {
		return sql.selectOne("Auction.findReview",review);
	}

	public void autoUpdate(ReviewDTO review) {
		sql.update("Auction.autoUpdate",review);
	}
	
}
