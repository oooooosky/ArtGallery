package com.spring.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {
	
	private long m_number;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_phone;
	
	private MultipartFile m_file;
	private String m_filename;
	
}
