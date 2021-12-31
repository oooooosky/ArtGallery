package com.spring.project.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AuctionDTO {

	// art_table
	private long a_number;
	private String a_title;
	private String a_writer;
	private String a_contents;
	private int a_stock;
	private String m_id;
	private String a_id;
	private String a_email;
	private Date a_date;
	
	// bid_table
	private long b_price;
	private long b_bid;
	
	private MultipartFile a_file;
	private String a_filename;
	
}
