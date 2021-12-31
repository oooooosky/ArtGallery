package com.spring.project.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.dto.ExhibitionDTO;
import com.spring.project.dto.HeartDTO;

@Repository
public class ExhibitionRepository {

	@Autowired
	private SqlSessionTemplate sql;
	
	// 게시글 목록 요청
	public List<ExhibitionDTO> findAll() {
		return sql.selectList("Exhibition.findAll");
	}

	// 게시글 갯수 요청
	public int boardCount() {
		return sql.selectOne("Exhibition.count");
	}
	
	// 페이징 처리 요청
	public List<ExhibitionDTO> pagingList(Map<String, Integer> pagingParam) {
		return sql.selectList("Exhibition.pagingList", pagingParam);
	}
	
	// 게시글 저장
	public void saveFile(ExhibitionDTO exhibition) {
		sql.insert("Exhibition.saveFile",exhibition);
	}
	
	// 게시글 상세조회
	public ExhibitionDTO detail(long e_number) {
		sql.update("Exhibition.hits",e_number);
		sql.update("Exhibition.heartCount", e_number);
		ExhibitionDTO exhibition = sql.selectOne("Exhibition.detail",e_number);
		return exhibition;
	}
	
	// 수정 페이지 요청
	public ExhibitionDTO findByID(long e_number) {
		return sql.selectOne("Exhibition.detail",e_number);
	}
	
	// 수정 (사진변경 X)
	public int update(ExhibitionDTO exhibition) {
		System.out.println(exhibition);
		return sql.update("Exhibition.update",exhibition);
	}
	
	// 수정 (사진변경 O)
	public int updateFile(ExhibitionDTO exhibition) {
		System.out.println(exhibition);
		return sql.update("Exhibition.updateFile",exhibition);
	}

	// 삭제
	public int delete(long e_number) {
		return sql.delete("Exhibition.delete", e_number);
	}

	// 일반회원 좋아요 확인
	public HeartDTO findHeartM(Map<String, Long> number) {
		return sql.selectOne("Exhibition.findHeartM",number);
	}

	// 일반회원 좋아요 저장
	public int insertHeartM(HeartDTO heart) {
		return sql.insert("Exhibition.insertHeartM", heart);
	}

	// 일반회원 게시글 및 좋아요 확인
	public HeartDTO findHeartEM(HeartDTO heart) {
		return sql.selectOne("Exhibition.findHeartEM",heart);
	}

	// 일반회원 좋아요 삭제
	public void deleteHeartM(HeartDTO heart) {
		sql.delete("Exhibition.deleteHeartM",heart);
	}

	// 네이버 좋아오 찾기
	public HeartDTO findHeartN(Map<String, Long> number) {
		return sql.selectOne("Exhibition.findHeartN",number);
	}

	// 카카오 좋아요 찾기
	public HeartDTO findHeartK(Map<String, Long> number) {
		return sql.selectOne("Exhibition.findHeartK",number);
	}

	// 카카오 게시글 좋아요 찾기
	public HeartDTO findHeartEK(HeartDTO heart) {
		return sql.selectOne("Exhibition.findHeartEK",heart);
	}

	// 카카오 좋아요 저장
	public int insertHeartK(HeartDTO heart) {
		return sql.insert("Exhibition.insertHeartK", heart);
	}

	// 카카오 좋아요 삭제
	public void deleteHeartK(HeartDTO heart) {
		sql.delete("Exhibition.deleteHeartK",heart);
	}

	// 네이버 게시글 좋아요 찾기
	public HeartDTO findHeartEN(HeartDTO heart) {
		return sql.selectOne("Exhibition.findHeartEN",heart);
	}

	// 네이버 좋아요 저장
	public int insertHeartN(HeartDTO heart) {
		return sql.insert("Exhibition.insertHeartN", heart);
	}

	// 네이버 좋아요 삭제
	public void deleteHeartN(HeartDTO heart) {
		sql.delete("Exhibition.deleteHeartN",heart);
	}
	
}
