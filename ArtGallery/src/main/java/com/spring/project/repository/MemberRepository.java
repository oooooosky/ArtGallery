package com.spring.project.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.dto.KakaoDTO;
import com.spring.project.dto.MemberDTO;
import com.spring.project.dto.NaverDTO;

@Repository
public class MemberRepository {

	@Autowired
	private SqlSessionTemplate sql;
	
	// 회원 정보 저장
	public int join(MemberDTO member) {
		return sql.insert("Member.join", member);
	}
	
	// 아이디 중복 체크
	public String idDuplicate(String m_id) {
		return sql.selectOne("Member.idDuplicate",m_id);
	}
	
	// 로그인
	public MemberDTO login(MemberDTO check) {
		return sql.selectOne("Member.login",check);
	}

	// 마이페이지용 정보 요청
	public MemberDTO findNum(long m_number) {
		return sql.selectOne("Member.findNum", m_number);
	}

	// 회원정보 수정 (파일)
	public int updateFile(MemberDTO member) {
		return sql.update("Member.updateFile", member);
	}

	// 회원정보 수정
	public int update(MemberDTO member) {
		return sql.update("Member.update", member);
	}
	
	// memberList 요청
	public List<MemberDTO> findAll() {
		return sql.selectList("Member.findAll");
	}
	
	// 회원 상세조회
	public MemberDTO detail(long m_number) {
		return sql.selectOne("Member.detail", m_number);
	}
	
	// 회원 삭제
	public int delete(long m_number) {
		return sql.delete("Member.delete", m_number);
	}
	
	// 카카오 로그인
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		sql.insert("Member.kakaoInsert",userInfo);
	}

	// 카카오 확인
	public KakaoDTO findkakao(HashMap<String, Object> userInfo) {
		System.out.println("RN:"+userInfo.get("nickname"));
		System.out.println("RE:"+userInfo.get("email"));
		return sql.selectOne("Member.findKakao", userInfo);
	}

	public NaverDTO findNaver(NaverDTO naver) {
		return sql.selectOne("Member.findNaver", naver);
	}

	public void naverinsert(NaverDTO naver) {
		sql.insert("Member.naverInsert", naver);
		
	}

	public KakaoDTO kakaoNumber(KakaoDTO userInfo) {
		return sql.selectOne("Member.kakaoNumber",userInfo);
	}
	
}
