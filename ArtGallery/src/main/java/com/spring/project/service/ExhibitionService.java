package com.spring.project.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.spring.project.dto.ExhibitionDTO;
import com.spring.project.dto.HeartDTO;
import com.spring.project.dto.PageDTO;
import com.spring.project.repository.ExhibitionRepository;

@Service
public class ExhibitionService implements ExhibitionInterface{

	@Autowired
	private ExhibitionRepository er;
	
	// 게시글 목록 요청
	@Override
	public List<ExhibitionDTO> findAll() {
		return er.findAll();
	}

	// 페이징 처리
	private static final int PAGE_LIMIT = 10; // 한페이지에 보여질 글 개수 
	private static final int BLOCK_LIMIT = 3; // 한화면에 보여질 페이지 개수
	
	// 페이징 처리 요청
	@Override
	public List<ExhibitionDTO> pagingList(int page) {
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
		List<ExhibitionDTO> pagingList = er.pagingList(pagingParam);
		return pagingList;
	}
	
	// 페이징 처리 요청
	@Override
	public PageDTO paging(int page) {
		int boardCount = er.boardCount();
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
	
	// 게시글 저장
	@Override
	public void saveFile(ExhibitionDTO exhibition) throws IllegalStateException, IOException {
		MultipartFile e_file = exhibition.getE_file();
		String e_filename = e_file.getOriginalFilename();
		e_filename = System.currentTimeMillis() + "-" + e_filename;
		String savePath = "/Users/sky/EclipseJava/source/Spring/ArtGallery/src/main/webapp/resources/upload/"+e_filename;
		if(!e_file.isEmpty()) {
			e_file.transferTo(new File(savePath));
		}
		exhibition.setE_filename(e_filename);
		
		er.saveFile(exhibition);
	}
	
	// 게시글 상세 조회
	@Override
	public ExhibitionDTO detail(long e_number) {
		ExhibitionDTO exhibition = er.detail(e_number);
		return exhibition;
	}
	
	// 수정 페이지 요청
	@Override
	public ExhibitionDTO findById(long e_number) {
		ExhibitionDTO exhibition = er.findByID(e_number);
		return exhibition;
	}
	
	// 수정
	@Override
	public String update(ExhibitionDTO exhibition, Model model, int page) throws IllegalStateException, IOException {
		System.out.println(exhibition);
		int result = 0;
		if(!exhibition.getE_file().isEmpty()) {
			MultipartFile e_file = exhibition.getE_file();
			String e_filename = e_file.getOriginalFilename();
			e_filename = System.currentTimeMillis() + "-" + e_filename;
			String savePath = "/Users/sky/EclipseJava/source/Spring/ArtGallery/src/main/webapp/resources/upload/"+e_filename;
			if(!e_file.isEmpty()) {
				e_file.transferTo(new File(savePath));
			}
			exhibition.setE_filename(e_filename);
			result = er.updateFile(exhibition);
		} else {
			result = er.update(exhibition);
		}
		if(result>0) {
			model.addAttribute("exhibition", exhibition);
			return "redirect:/exhibition/detail?e_number="+exhibition.getE_number()+"&page="+page;
		} else {
			return "redirect:/exhibition/paging";
		}
	}
	
	// 삭제
	@Override
	public String delete(long e_number) {
		int result = er.delete(e_number);
		if(result>0) {
			return "redirect:/exhibition/paging";
		} else {
			return "redirect:/exhibition/paging";
		}
	}

	//일반회원 좋아요 찾기
	@Override
	public HeartDTO findHeartM(long e_number, long m_number) {
		Map<String, Long> number = new HashMap<String, Long>();
		number.put("e_number", e_number);
		number.put("m_number", m_number);
		return er.findHeartM(number);
	}
	
	// 네이버 좋아요 찾기
	@Override
	public HeartDTO findHeartN(long e_number, long n_number) {
		Map<String, Long> number = new HashMap<String, Long>();
		number.put("e_number", e_number);
		number.put("n_number", n_number);
		return er.findHeartN(number);
	}
	
	// 카카오 좋아요 찾기
	@Override
	public HeartDTO findHeartK(long e_number, long k_number) {
		Map<String, Long> number = new HashMap<String, Long>();
		number.put("e_number", e_number);
		number.put("k_number", k_number);
		return er.findHeartK(number);
	}

	// 일반회원 좋아요 저장
	@Override
	public int insertHeartM(HeartDTO heart) {
		int result = 0;
		HeartDTO find = er.findHeartEM(heart);
		
		if(find==null) {
			result = er.insertHeartM(heart);
		} else {
			er.deleteHeartM(heart);
		}
		return result;
	}


	// 카카오 좋아요 저장
	@Override
	public int insertHeartK(HeartDTO heart) {
		int result = 0;
		HeartDTO find = er.findHeartEK(heart);
		
		if(find==null) {
			result = er.insertHeartK(heart);
		} else {
			er.deleteHeartK(heart);
		}
		return result;
	}

	// 네이버 좋아요 저장
	@Override
	public int insertHeartN(HeartDTO heart) {
		int result = 0;
		HeartDTO find = er.findHeartEN(heart);
		
		if(find==null) {
			result = er.insertHeartN(heart);
		} else {
			er.deleteHeartN(heart);
		}
		return result;
	}
	
}
