package com.spring.project.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ExhibitionDTO {

	private long e_number;
	private String e_title;
	private String e_writer;
	private String e_contents;
	private int e_hits;
	private Timestamp e_date;
	private String e_email;
	private long e_count;
	
	private MultipartFile e_file;
	private String e_filename;
	
}
