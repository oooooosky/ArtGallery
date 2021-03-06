# 프로젝트 기획안
- 작성일 : 2021.12.10
- 작성자 : 오지석

# 프로젝트 명
- Art Gallery Project

# 기획의도
## 목적
- 회원가입을 한 사람들에게 여러 미술품들을 갤러리에 온듯한 느낌으로 보여주고, 미술품이 아니더라도 사진들을 올리고 그에 대한 설명을 적으면 전시회같은 느낌으로 이를 보여주는 프로그램을 만들려고 합니다. 또한 요즘 NFT 경매와 같이 디지털 파일을 사고파는 경매 시스템을 도입해 해당 작품에 대한 권리를 사고파는 시스템을 만들어 보고 싶습니다. 즉 경매를 하는 게시판 하나와 회원들끼리의 소통 게시판을 따로 만들어 예술에 대해 더욱 깊이있는 사이트를 만들어보고 싶습니다.
## 이유
- 회원게시판을 만들면서 회원가입 및 로그인, 로그인 후 회원들이 사용하는 기능등을 구현하면서 전반적인 회원 게시판이 어떻게 돌아가는지 알게 되었고, 이를 이용해 회원들을 위한 온라인 전시회 느낌의 게시판을 만들면 재밌을거 같아서 이를 기획하게 되었습니다. 추가로 카카오 지도 API와 카카오 결제API를 이용한다면 API를 활용하는 기술을 더 높일 수 있을거같아서 이러한 프로젝트를 기획하게 되었습니다.
## 사용할 기능 설명
- 회원가입, 로그인, 로그아웃, 회원정보 수정, 게시글 작성 & 수정 & 삭제, 관리자용 페이지, 관리자용 회원목록 조회 & 삭제, 카카오 지도 API를 이용한 위치표시, 카카오 결제API를 이용한 결제 및 경매 시스템 등
# 벤치마킹
- Google Art & Culture
    - 각 나라의 대한 대표 문화재 및 미술품 소개, 문화재에 관한 스트리트 뷰 제공 등
# 주요기능
- 회원가입
- 로그인
- 로그아웃
- 회원 정보 수정
- 게시글 작성
- 게시글 수정
- 게시글 삭제
- 관리자용 페이지
- 관리자용 회원 목록 조회
- 관리자용 회원 삭제
- 게시글 하단에 카카오 지도 API로 해당 장소 표시 (회원 소통 게시판에 한해)

- 카카오 결제 API를 이용한 결제 및 경매 시스템
# 기타
- API를 활용하는것이 아직 미숙하여 지도 기능은 빠질 수 있음.
- 결제 API는 시간이 부족하더라도 완성할 계획.
# 프로젝트 종료
- 프로젝트를 진행하며 구현한 목록
1. 회원가입
2. 로그인
3. 로그아웃
4. 회원정보 수정
5. 게시글 작성
6. 게시글 수정
7. 게시글 삭제
8. 관리자용 페이지
9. 관리자용 회원목록 조회
10. 관리자용 회원 삭제

11. 카카오 결제 API를 이용한 결제 및 경매 시스템
# 프로젝트를 진행하며 변경된 사항
1. 지도API 제거
    -  지도API를 이용해 정보를 저장 및 출력하려고 했으나 KAKAO사의 규정으로 인해 구현 실패
2. 회원가입시 아이디 중복체크 및 정규식 사용
3. 게시글 좋아요 기능 추가
4. 게시글 좋아요 갯수 세기 추가
5. 회원 페이지 추가
6. 카카오 결제 API 사용 시 i'mport를 이용
7. 그동안 진행된 경매 작품 볼 수 있는 페이지 추가
8. 작품을 낙찰한 사람만 작성할 수 있는 페이지 추가
9. 카카오 API를 이용한 카카오 로그인 & 로그아웃 기능 구현

10. 네이버 API를 이용한 네이버 로그인 & 로그아웃 기능 구현

<hr>

 DB 정보
```
use ArtGallery;

drop table member_table;
create table member_table (
	m_number bigint auto_increment,
    m_id varchar(20) not null unique,
    m_pw varchar(16) not null,
    m_name varchar(20) not null,
    m_phone varchar(20) not null,
    m_filename varchar(100),
    constraint primary key(m_number)
);

drop table exhibition_table;
create table exhibition_table (
	e_number bigint auto_increment,
    e_title varchar(50) not null,
    e_writer varchar(20) not null,
    e_contents varchar(2000) not null,
    e_hits int default 0,
    e_date datetime,
    e_filename varchar(100),
    e_email varchar(100),
    e_count bigint,
    constraint primary key(e_number)
);

drop table art_table;
create table art_table (
	a_number bigint auto_increment,
    a_title varchar(50) not null,
    a_writer varchar(20) not null,
    a_contents varchar(2000) not null,
    a_stock int default 1,
    a_date date,
    m_id varchar(20),
    a_id varchar(20),
    a_email varchar(50),
    a_filename varchar(100),
    constraint primary key(a_number)
);

drop table bid_table;
create table bid_table (
    a_number bigint auto_increment,
    b_price bigint default 0,
    b_bid bigint,
    constraint primary key(a_number),
    constraint foreign key(a_number) references art_table(a_number)
);

drop table kakao_table;
create table kakao_table (
	k_number bigint auto_increment,
    k_name varchar(20) not null,
    k_email varchar(50) not null,
    constraint primary key(k_number)
);

drop table naver_table;
create table naver_table (
	n_number bigint auto_increment,
    n_age varchar(10) not null,
    n_birthday varchar(10) not null,
    n_email varchar(50) not null,
    n_gender varchar(5) not null,
    n_id varchar(100) not null,
    n_name varchar(20) not null,
    n_nickName varchar(20) not null,
    constraint primary key(n_number)
);

drop table heart_table;
create table heart_table (
	h_number bigint auto_increment,
    e_number bigint,
    m_number bigint,
    k_number bigint,
    n_number bigint,
    heart int default 0,
    constraint primary key(h_number)
);

drop table review_table;
create table review_table(
	r_number bigint auto_increment,
    m_id varchar(20),
    a_email varchar(50),
    a_title varchar(50),
    r_title varchar(50),
    r_contents varchar(2000),
    constraint primary key(r_number)
);
```
