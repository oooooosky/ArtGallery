package com.spring.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.dto.ExhibitionDTO;
import com.spring.project.dto.HeartDTO;
import com.spring.project.dto.PageDTO;
import com.spring.project.service.ExhibitionService;

@Controller
@RequestMapping(value="/exhibition/*")
public class ExhibitionController {

	@Autowired
	private ExhibitionService es;
	
	// EC001. 게시판 목록 요청
	@RequestMapping(value="findAll", method=RequestMethod.GET)
	public String findAll(Model model) {
		List<ExhibitionDTO> eList = es.findAll();
		model.addAttribute("eList", eList);
		return "exhibition/findAll";
	}
	
	// EC002. 게시판 페이징 처리
	@RequestMapping(value="paging", method=RequestMethod.GET)
	public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
		List<ExhibitionDTO> eList = es.pagingList(page);
		PageDTO paging = es.paging(page);
		model.addAttribute("eList", eList);
		model.addAttribute("paging", paging);
		return "exhibition/findAll";
	}
	
	// EC003. 게시글 작성 화면 요청
	@RequestMapping(value = "writing", method = RequestMethod.GET)
	public String writingForm() {
		return "exhibition/writing";
	}
	
	// EC004. 게시글 저장
	@RequestMapping(value="savefile",method=RequestMethod.POST)
	public String saveFile(@ModelAttribute ExhibitionDTO exhibition) throws IllegalStateException, IOException{
		es.saveFile(exhibition);
		return "redirect:/exhibition/paging";
	}
	
	// EC005. 게시글 상세 조회(일반 회원)
	@RequestMapping(value="detailM",method=RequestMethod.GET)
	public String detailM(@RequestParam("e_number") long e_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page, @RequestParam("m_number") long m_number) {
		ExhibitionDTO exhibition = es.detail(e_number);
		HeartDTO heart = new HeartDTO();
		heart = es.findHeartM(e_number, m_number);
		model.addAttribute("exhibition",exhibition);
		model.addAttribute("page", page);
		model.addAttribute("heart",heart);
		return "exhibition/detailM";
	}
	
	// EC005. 게시글 상세 조회(카카오 회원)
	@RequestMapping(value="detailK",method=RequestMethod.GET)
	public String detailK(@RequestParam("e_number") long e_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page, @RequestParam("k_number") long k_number) {
		ExhibitionDTO exhibition = es.detail(e_number);
		HeartDTO heart = new HeartDTO();
		heart = es.findHeartK(e_number, k_number);
		model.addAttribute("exhibition",exhibition);
		model.addAttribute("page", page);
		model.addAttribute("heart",heart);
		return "exhibition/detailK";
	}
	
	// EC005. 게시글 상세 조회(네이버 회원)
	@RequestMapping(value="detailN",method=RequestMethod.GET)
	public String detailN(@RequestParam("e_number") long e_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page, @RequestParam("n_number") long n_number) {
		ExhibitionDTO exhibition = es.detail(e_number);
		HeartDTO heart = new HeartDTO();
		heart = es.findHeartN(e_number, n_number);
		model.addAttribute("exhibition",exhibition);
		model.addAttribute("page", page);
		model.addAttribute("heart",heart);
		return "exhibition/detailN";
	}
	
	// EC006. 수정 페이지 요청
	@RequestMapping(value="updateForm",method=RequestMethod.GET)
	public String updateForm(@RequestParam("e_number") long e_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		ExhibitionDTO exhibition = es.findById(e_number);
		model.addAttribute("exhibition",exhibition);
		model.addAttribute("page", page);
		return "exhibition/update";
	}
	
	// EC007. 수정
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(@ModelAttribute ExhibitionDTO exhibition, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) throws IllegalStateException, IOException {
		String result = es.update(exhibition, model, page);
		return result;
	}
	
	// EC008. 삭제
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public String delete(@RequestParam("e_number") long e_number) {
		String result = es.delete(e_number);
		return result;
	}
	
	// 회원 좋아요
	@RequestMapping(value="heartM",method=RequestMethod.POST)
	public @ResponseBody int heartM(@ModelAttribute HeartDTO heart) {
		int result = es.insertHeartM(heart);
		return result;
	}
	
	// 카카오 좋아요
	@RequestMapping(value="heartK",method=RequestMethod.POST)
	public @ResponseBody int heartK(@ModelAttribute HeartDTO heart) {
		int result = es.insertHeartK(heart);
		return result;
	}
	
	// 네이버 좋아요
	@RequestMapping(value="heartN",method=RequestMethod.POST)
	public @ResponseBody int heartN(@ModelAttribute HeartDTO heart) {
		int result = es.insertHeartN(heart);
		return result;
	}
	
}
