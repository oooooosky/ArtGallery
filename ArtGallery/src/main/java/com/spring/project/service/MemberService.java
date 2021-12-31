package com.spring.project.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.project.dto.KakaoDTO;
import com.spring.project.dto.MemberDTO;
import com.spring.project.dto.NaverDTO;
import com.spring.project.repository.MemberRepository;

@Service
public class MemberService implements MemberInterface {

	@Autowired
	private MemberRepository mr;
	
	@Autowired
	private HttpSession session;
	
	// 회원 정보 저장
	@Override
	public String join(MemberDTO member) throws IllegalStateException, IOException {
		MultipartFile m_file = member.getM_file();
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		String savePath = "/Users/sky/EclipseJava/source/Spring/ArtGallery/src/main/webapp/resources/upload/"+m_filename;
		if(!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));
		}
		member.setM_filename(m_filename);
		System.out.println("S : "+member);
		int result = mr.join(member);
		if(result>0) {
			return "index";
		} else {
			return "member/join";
		}
	}
	
	// 아이디 중복 체크
	@Override
	public String idDuplicate(String m_id) {
		String result = mr.idDuplicate(m_id);
		if(result == null) {
			return "ok";
		} else {
			return "no";
		}
	}
	
	// 로그인
	@Override
	public String login(MemberDTO check) {
		MemberDTO result = mr.login(check);
		if(result != null) {
			if(result.getM_id().equals("admin123")) {
				session.invalidate();
				session.setAttribute("loginId", check.getM_id());
				session.setAttribute("loginNumber", result.getM_number());
				session.setAttribute("loginName", result.getM_name());
				return "member/adminMain";
			}
			session.invalidate();
			session.setAttribute("loginId", check.getM_id());
			session.setAttribute("loginNumber", result.getM_number());
			session.setAttribute("loginName", result.getM_name());
			return "member/memberMain";
		} else {
			return "member/login";
		}
	}

	// 마이페이지용 정보요청
	@Override
	public MemberDTO findNum(long m_number) {
		return mr.findNum(m_number);
	}
	
	// 회원정보 수정
	@Override
	public String update(MemberDTO member) throws IllegalStateException, IOException {
		int result = 0;
		if(!member.getM_file().isEmpty()) {
			MultipartFile m_file = member.getM_file();
			String m_filename = m_file.getOriginalFilename();
			m_filename = System.currentTimeMillis() + "-" + m_filename;
			String savePath = "/Users/sky/EclipseJava/source/Spring/ArtGallery/src/main/webapp/resources/upload/"+m_filename;
			if(!m_file.isEmpty()) {
				m_file.transferTo(new File(savePath));
			}
			member.setM_filename(m_filename);
			result = mr.updateFile(member);			
		} else {
			result = mr.update(member);
		}
		if(result>0) {
			if(member.getM_id().equals("admin123")) {
				session.invalidate();
				session.setAttribute("loginId", member.getM_id());
				session.setAttribute("loginNumber", member.getM_number());
				session.setAttribute("loginName", member.getM_name());
				return "member/adminMain";
			}
			session.invalidate();
			session.setAttribute("loginId", member.getM_id());
			session.setAttribute("loginNumber", member.getM_number());
			session.setAttribute("loginName", member.getM_name());
			return "member/memberMain";
		} else {
			return "redirect:/cancle?m_number="+member.getM_number();
		}
	}

	// member(admin)Main으로 돌아가기
	@Override
	public String cancle(long m_number) {
		MemberDTO member = mr.findNum(m_number);
		if(member!=null) {
			if(member.getM_id().equals("admin123")) {
				session.invalidate();
				session.setAttribute("loginId", member.getM_id());
				session.setAttribute("loginNumber", member.getM_number());
				session.setAttribute("loginName", member.getM_name());
				return "member/adminMain";
			}
			session.invalidate();
			session.setAttribute("loginId", member.getM_id());
			session.setAttribute("loginNumber", member.getM_number());
			session.setAttribute("loginName", member.getM_name());
			return "member/memberMain";			
		} else {
			return "member/memberMain";
		}
	}
	
	// memberList 요청
	@Override
	public List<MemberDTO> findAll() {
		return mr.findAll();
	}
	
	// 회원 상세조회
	@Override
	public MemberDTO detail(long m_number) {
		return mr.detail(m_number);
	}
	
	// 회원 삭제
	@Override
	public String delete(long m_number) {
		int result = mr.delete(m_number);
		if(result>0) {
			return "redirect:/member/memberList";			
		} else {
			return "member/memberList";
		}
	}

	// 카카오 로그인
	@Override
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=070aeade687be812b74c91bedf42e6ec");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8080/member/kakaoLogin");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	
	// 카카오 로그인 정보 저장
	@Override
	public KakaoDTO getUserInfo (String access_Token) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            userInfo.put("nickname", nickname);
            userInfo.put("email", email);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        KakaoDTO result = mr.findkakao(userInfo);
        System.out.println("S:" + result);
        if(result==null) {
        	mr.kakaoinsert(userInfo);
        	return mr.findkakao(userInfo);
        } else {
        	return result;
        }
        
    }

	// 네이버 로그인 정보 저장 및 로그인처리
	@Override
	public String naverSave(NaverDTO naver) {
		NaverDTO check = mr.findNaver(naver);
		String result = "no";
		if(check==null) {
			mr.naverinsert(naver);
			check = mr.findNaver(naver);
			session.invalidate();
			session.setAttribute("naverNid", check.getN_id());
			session.setAttribute("naverNumber", check.getN_number());
			session.setAttribute("naverName", check.getN_name());
			session.setAttribute("naverEmail", check.getN_email());
			result = "ok";
			return result;
		} else {
			check = mr.findNaver(naver);
			session.invalidate();
			session.setAttribute("naverNid", check.getN_id());
			session.setAttribute("naverNumber", check.getN_number());
			session.setAttribute("naverName", check.getN_name());
			session.setAttribute("naverEmail", check.getN_email());
			result = "ok";
			return result;
		}
		
	}

	// 카카오 번호찾기
	@Override
	public KakaoDTO kakaoNumber(KakaoDTO userInfo) {
		return mr.kakaoNumber(userInfo);
	}
	
}
