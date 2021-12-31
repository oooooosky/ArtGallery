package com.spring.project.service;

import java.io.IOException;
import java.util.List;

import org.springframework.ui.Model;

import com.spring.project.dto.ExhibitionDTO;
import com.spring.project.dto.HeartDTO;
import com.spring.project.dto.PageDTO;

public interface ExhibitionInterface {

	public List<ExhibitionDTO> findAll();

	public List<ExhibitionDTO> pagingList(int page);

	public PageDTO paging(int page);

	public void saveFile(ExhibitionDTO exhibition) throws IllegalStateException, IOException;

	public ExhibitionDTO detail(long e_number);

	public ExhibitionDTO findById(long e_number);

	public String update(ExhibitionDTO exhibition, Model model, int page) throws IllegalStateException, IOException;

	public String delete(long e_number);

	public HeartDTO findHeartM(long e_number, long m_number);
	
	public HeartDTO findHeartN(long e_number, long n_number);

	public HeartDTO findHeartK(long e_number, long k_number);

	public int insertHeartM(HeartDTO heart);

	public int insertHeartK(HeartDTO heart);

	public int insertHeartN(HeartDTO heart);

}
