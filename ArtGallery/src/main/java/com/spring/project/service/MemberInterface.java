package com.spring.project.service;

import java.io.IOException;
import java.util.List;

import com.spring.project.dto.KakaoDTO;
import com.spring.project.dto.MemberDTO;
import com.spring.project.dto.NaverDTO;

public interface MemberInterface {

	public String join(MemberDTO member) throws IllegalStateException, IOException;

	public String idDuplicate(String m_id);

	public String login(MemberDTO check);

	public MemberDTO findNum(long m_number);

	public String update(MemberDTO member) throws IllegalStateException, IOException;

	public String cancle(long m_number);

	public List<MemberDTO> findAll();

	public MemberDTO detail(long m_number);

	public String delete(long m_number);

	public String getAccessToken(String authorize_code);

	public KakaoDTO getUserInfo(String access_Token);

	public String naverSave(NaverDTO naver);

	public KakaoDTO kakaoNumber(KakaoDTO userInfo);

}
