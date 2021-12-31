package com.spring.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.dto.KakaoDTO;
import com.spring.project.dto.MemberDTO;
import com.spring.project.dto.NaverDTO;
import com.spring.project.service.MemberService;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {

	@Autowired
	private MemberService ms;
	
	@Autowired
	private HttpSession session;
	
	// MC001. 회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinForm() {		
		return "member/join";
	}
	
	// MC004. 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {		
		return "member/login";
	}
	
	// MC002. 회원가입 정보 저장
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
		String result = ms.join(member);
		return result;
	}
	
	// MC003. 아이디 중복 체크
	@RequestMapping(value="idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
		String result = ms.idDuplicate(m_id);
		return result;
	}
	
	// MC005. 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO check) {
		String result = ms.login(check);
		return result;
	}
	
	// MC009. 로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	// MC007. 마이페이지 이동
	@RequestMapping(value="myPage", method=RequestMethod.GET)
	public String myPageForm(@RequestParam("m_number") long m_number, Model model) {
		MemberDTO member = ms.findNum(m_number);
		model.addAttribute("member",member);
		return "member/myPage";
	}
	
	// MC008. 회원정보 수정
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException  {
		String result = ms.update(member);
		return result;
	}
	
	// MC006. memberMain (관리자는 adminMain) 으로 돌아가기
	@RequestMapping(value="cancle", method=RequestMethod.GET)
	public String cancle(@RequestParam("m_number") long m_number){
		String result = ms.cancle(m_number);
		return result;
	}
	
	// MC010. MemberList 페이지
	@RequestMapping(value="memberList", method=RequestMethod.GET)
	public String memberList(Model model) {
		List<MemberDTO> mList = ms.findAll();
		model.addAttribute("mList",mList);
		return "member/memberList";
	}

	// MC011. 회원 상세조회
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(@RequestParam("m_number") long m_number, Model model) {
		MemberDTO member = ms.detail(m_number);
		model.addAttribute("member",member);
		return "member/detail";
	}
	
	// MC012. 회원 삭제
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("m_number") long m_number) {
		String result = ms.delete(m_number);
		return result;
	}
	
	// 카카오 로그인 토큰 받기
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Exception{
        System.out.println("#########" + code);
        String access_Token = ms.getAccessToken(code);
        KakaoDTO userInfo = ms.getUserInfo(access_Token);
        KakaoDTO number = ms.kakaoNumber(userInfo);
        session.invalidate();
        session.setAttribute("kakaoN", userInfo.getK_name());
        session.setAttribute("kakaoE", userInfo.getK_email());
        session.setAttribute("kakaoNumber", number.getK_number());
        return "member/memberMain";
    }
	
	// 로그인 api 용 Main
	@RequestMapping(value="Main", method=RequestMethod.GET)
	public String Main(){
		return "member/memberMain";
	}
	
	// 네이버 로그인 callBack
	@RequestMapping(value="callBack", method=RequestMethod.GET)
	public String callBack(){
		return "member/callBack";
	}
	
	// 네이버 로그인 정보 저장
	@RequestMapping(value="naverSave", method=RequestMethod.POST)
	public @ResponseBody String naverSave(@RequestParam("n_age") String n_age, @RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, @RequestParam("n_nickName") String n_nickName) {
		System.out.println("#############################################");
		System.out.println(n_age);
		System.out.println(n_birthday);
		System.out.println(n_email);
		System.out.println(n_gender);
		System.out.println(n_id);
		System.out.println(n_name);
		System.out.println(n_nickName);
		System.out.println("#############################################");
		
		NaverDTO naver = new NaverDTO();
		naver.setN_age(n_age);
		naver.setN_birthday(n_birthday);
		naver.setN_email(n_email);
		naver.setN_gender(n_gender);
		naver.setN_id(n_id);
		naver.setN_name(n_name);
		naver.setN_nickName(n_nickName);
		String result = ms.naverSave(naver);
		
		return result;
	}

	
	// 네이버 로그아웃페이지
	@RequestMapping(value="naverLogout", method=RequestMethod.GET)
	public String naverLogout(){
		return "member/naverLogout";
	}
	
}
