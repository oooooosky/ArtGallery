package com.spring.project.service;

import java.io.IOException;
import java.util.List;

import com.spring.project.dto.AuctionDTO;
import com.spring.project.dto.PageDTO;
import com.spring.project.dto.ReviewDTO;

public interface AuctionInterface {

	public AuctionDTO auctionForm();

	public void saveFile(AuctionDTO auction) throws IllegalStateException, IOException;

	public AuctionDTO bidForm();

	public String find();

	public void saveBid(AuctionDTO auction);

	public void success(AuctionDTO auction);

	public List<AuctionDTO> findAll();

	public List<AuctionDTO> pagingList(int page);

	public PageDTO paging(int page);

	public AuctionDTO detail(long a_number);

	public void reviewWriting(ReviewDTO review);

	public List<ReviewDTO> reviewFindAll();

	public List<ReviewDTO> reviewPagingList(int page);

	public ReviewDTO reviewDetail(long r_number);

}
