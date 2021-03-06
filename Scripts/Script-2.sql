-- carshare
DROP SCHEMA IF EXISTS carshare;

-- carshare
CREATE SCHEMA carshare;

-- 회원
CREATE TABLE carshare.member (
	member_no         INT(11)      NOT NULL COMMENT '바꿔줘야함', -- 회원번호
	kakao_id          VARCHAR(50)  NULL     COMMENT '카카오톡아이디', -- 카카오톡아이디
	naver_id          VARCHAR(50)  NULL     COMMENT '네이버아이디', -- 네이버아이디
	name              VARCHAR(50)  NULL     COMMENT '이름', -- 이름
	u_intro           TEXT(200)    NULL     COMMENT '사용자간단한자기소개', -- 사용자간단한자기소개
	d_intro           TEXT(200)    NULL     COMMENT '운전자간단한자기소개', -- 운전자간단한자기소개
	phone             VARCHAR(15)  NULL     COMMENT '전화번호', -- 전화번호
	nickname          VARCHAR(50)  NULL     COMMENT '닉네임', -- 닉네임
	photo             VARCHAR(100) NULL     COMMENT '사진', -- 사진
	jop               VARCHAR(50)  NULL     COMMENT '직업', -- 직업
	driver            BOOLEAN      NOT NULL DEFAULT false COMMENT '기본펄스', -- 드라이버
	jumin             VARCHAR(15)  NULL     COMMENT '주민등록번호', -- 주민등록번호
	grade_no          VARCHAR(50)  NULL     COMMENT '등급번호', -- 등급번호
	my_fee            INT(11)      NULL     COMMENT '요금', -- 요금
	email             VARCHAR(50)  NULL     COMMENT '이메일', -- 이메일
	dirver_enrollment DATE         NULL     COMMENT '드라이버 등록일', -- 드라이버 등록일
	dirver_apply      DATE         NULL     COMMENT '드라이버 신청일', -- 드라이버 신청일
	COL               VARCHAR(100) NULL     COMMENT 'v2 에서드라이버 컬럼제거후추가' -- 처리상태
)
COMMENT '회원';

-- 회원
ALTER TABLE carshare.member
	ADD CONSTRAINT PK_member -- 회원 기본키
		PRIMARY KEY (
			member_no -- 회원번호
		);

ALTER TABLE carshare.member
	MODIFY COLUMN member_no INT(11) NOT NULL AUTO_INCREMENT COMMENT '바꿔줘야함';

-- 이용평
CREATE TABLE carshare.userating (
	userating_no VARCHAR(50)  NOT NULL COMMENT '평번호', -- 평번호
	use_no       VARCHAR(50)  NOT NULL COMMENT '사용번호', -- 사용번호
	contract_no  VARCHAR(50)  NULL     COMMENT '계약번호(신청번호)', -- 계약번호(신청번호)
	rating       INT(1)       NOT NULL COMMENT '별5만점', -- 평점
	content      TEXT         NULL     COMMENT '내용', -- 내용
	img1         VARCHAR(100) NULL     COMMENT '파일이름', -- 이미지1
	img2         VARCHAR(100) NULL     COMMENT '이미지2', -- 이미지2
	img3         VARCHAR(100) NULL     COMMENT '이미지3', -- 이미지3
	regdate      TIMESTAMP    NULL     COMMENT '작성일', -- 작성일
	modedate     TIMESTAMP    NULL     COMMENT '수정일' -- 수정일
)
COMMENT '이용평';

-- 이용평
ALTER TABLE carshare.userating
	ADD CONSTRAINT PK_userating -- 이용평 기본키
		PRIMARY KEY (
			userating_no -- 평번호
		);

-- 이용내역
CREATE TABLE carshare.use_info (
	use_no      VARCHAR(50) NOT NULL COMMENT '사용번호', -- 사용번호
	u_member_no INT(11)     NULL     COMMENT '사용자 아이디', -- 사용자 아이디
	d_member_no INT(11)     NULL     COMMENT '드라이버 아이디', -- 드라이버 아이디
	start_time  TIMESTAMP   NULL     COMMENT '출발시간', -- 출발시간
	end_time    TIMESTAMP   NULL     COMMENT '도착시간', -- 도착시간
	fee         INT(11)     NULL     COMMENT '요금', -- 요금
	start_spot  INT(11)     NULL     COMMENT 'APIGPS주소정보', -- 출발지
	end_spot    INT(11)     NULL     COMMENT '도착지' -- 도착지
)
COMMENT '이용내역';

-- 이용내역
ALTER TABLE carshare.use_info
	ADD CONSTRAINT PK_use_info -- 이용내역 기본키
		PRIMARY KEY (
			use_no -- 사용번호
		);

-- 경로
CREATE TABLE carshare.route (
	Route_no       VARCHAR(50)  NOT NULL COMMENT '주경로 드라이버유저 구분 즐겨찾기표시', -- 사용자 경로번호
	member_no      INT(11)      NULL     COMMENT '회원번호', -- 회원번호
	process        VARCHAR(50)  NULL     COMMENT '등록 대기 배차완료 ', -- 처리상태
	avgFee         INT(11)      NULL     COMMENT '예상요금', -- 예상요금
	start_address  VARCHAR(255) NULL     COMMENT '출발지주소', -- 출발지주소
	start_latitude DOUBLE       NULL     COMMENT '출발지위도', -- 출발지위도
	start_hardness DOUBLE       NULL     COMMENT '출발지경도', -- 출발지경도
	end_address    VARCHAR(255) NULL     COMMENT '도착지주소', -- 도착지주소
	end_latitude   DOUBLE       NULL     COMMENT '도착지위도', -- 도착지위도
	end_hardness   DOUBLE       NULL     COMMENT '도착지경도' -- 도착지경도
)
COMMENT '경로';

-- 경로
ALTER TABLE carshare.route
	ADD CONSTRAINT PK_route -- 경로 기본키
		PRIMARY KEY (
			Route_no -- 사용자 경로번호
		);

-- 계약
CREATE TABLE carshare.contract (
	contract_no    VARCHAR(50) NOT NULL COMMENT '드라이버유저 구분', -- 계약번호(신청번호)
	u_member_no    INT(11)     NULL     COMMENT '이용자아이디', -- 이용자아이디
	d_member_no    INT(11)     NULL     COMMENT '드라이버아이디', -- 드라이버아이디
	start_contract TIMESTAMP   NULL     COMMENT '계약 시작일', -- 계약 시작일
	end_contract   TIMESTAMP   NULL     COMMENT '계약 종료일', -- 계약 종료일
	cycle          CHAR(10)    NULL     COMMENT '이용요일', -- 주기
	contract_date  TIMESTAMP   NULL     COMMENT '계약일', -- 계약일
	contract_fee   INT(11)     NULL     COMMENT '계약금?', -- 계약금?
	contract_cont  TEXT(200)   NULL     COMMENT '간략한글', -- 간략한글
	process        VARCHAR(50) NULL     COMMENT '대기 승인 거부', -- 처리여부
	fee            INT(11)     NULL     COMMENT '요금', -- 요금
	start_spot     INT(11)     NULL     COMMENT '출발지', -- 출발지
	end_spot       INT(11)     NULL     COMMENT '도착지' -- 도착지
)
COMMENT '계약';

-- 계약
ALTER TABLE carshare.contract
	ADD CONSTRAINT PK_contract -- 계약 기본키
		PRIMARY KEY (
			contract_no -- 계약번호(신청번호)
		);

-- 요금(관리자 관리)
CREATE TABLE carshare.fee (
	fee      INT(11)     NOT NULL COMMENT '미터당 ,기름값비례자동계산?', -- 요금
	grade_no VARCHAR(50) NULL     COMMENT '등급번호', -- 등급번호
	max_fee  INT(11)     NULL     COMMENT '등급별 퍼센트다르게적용가능' -- 최대요금
)
COMMENT '요금(관리자 관리)';

-- 요금(관리자 관리)
ALTER TABLE carshare.fee
	ADD CONSTRAINT PK_fee -- 요금(관리자 관리) 기본키
		PRIMARY KEY (
			fee -- 요금
		);

-- 등급
CREATE TABLE carshare.grade (
	grade_no   VARCHAR(50) NOT NULL COMMENT '횟수 평점에따른등급변화', -- 등급번호
	grade_name VARCHAR(50) NULL     COMMENT '등급명' -- 등급명
)
COMMENT '등급';

-- 등급
ALTER TABLE carshare.grade
	ADD CONSTRAINT PK_grade -- 등급 기본키
		PRIMARY KEY (
			grade_no -- 등급번호
		);

-- 차량정보
CREATE TABLE carshare.car_info (
	member_no             INT(11)      NOT NULL COMMENT '회원번호', -- 회원번호
	car_name              VARCHAR(20)  NULL     COMMENT '보험증참조 관리자삽입', -- 차종
	car_number            VARCHAR(50)  NULL     COMMENT '보험증참조 관리자삽입', -- 차량번호
	insurance_date        DATE         NULL     COMMENT '보험증참조 관리자삽입', -- 보험만료일
	insurance_boonean     BOOLEAN      NULL     COMMENT '보험증참조 관리자삽입', -- 보험담보
	relationship_carowner VARCHAR(100) NULL     COMMENT '차량소유 관계', -- 차량소유 관계
	car_owner             VARCHAR(50)  NULL     COMMENT '자동차등록증참조 관리자삽입', -- 차량소유주이름
	insurance_card        VARCHAR(250) NULL     COMMENT '보험증', -- 보험증
	car_card              VARCHAR(250) NULL     COMMENT '자동차등록증', -- 자동차등록증
	COL                   VARCHAR(250) NULL     COMMENT 'v2 에서 회원 번호 대신해 프라이버리키로지정 (차량 2대이상가능)' -- 등록 번호 
)
COMMENT '차량정보';

-- 차량정보
ALTER TABLE carshare.car_info
	ADD CONSTRAINT PK_car_info -- 차량정보 기본키
		PRIMARY KEY (
			member_no -- 회원번호
		);

-- 면허정보 
CREATE TABLE carshare.license_info (
	member_no        INT(11)      NOT NULL COMMENT '회원번호', -- 회원번호
	license_photo    VARCHAR(250) NULL     COMMENT '면허사진', -- 면허사진
	license_no       VARCHAR(50)  NULL     COMMENT '면허번호', -- 면허번호
	license_kind     VARCHAR(50)  NULL     COMMENT '면허종류', -- 면허종류
	birthday         DATE         NULL     COMMENT '생년월일', -- 생년월일
	deadline         DATE         NULL     COMMENT '면허갱신 마감일', -- 면허갱신 마감일
	certification_no VARCHAR(50)  NULL     COMMENT '면허인증번호' -- 면허인증번호
)
COMMENT '면허정보 ';

-- 면허정보 
ALTER TABLE carshare.license_info
	ADD CONSTRAINT PK_license_info -- 면허정보  기본키
		PRIMARY KEY (
			member_no -- 회원번호
		);

-- 쿠폰
CREATE TABLE carshare.coupons (
	coupon_no   VARCHAR(50) NOT NULL COMMENT '쿠폰번호', -- 쿠폰번호
	coupon_name VARCHAR(50) NULL     COMMENT '쿠폰이름', -- 쿠폰이름
	coupon_ex   TEXT(200)   NULL     COMMENT '쿠폰설명' -- 쿠폰설명
)
COMMENT '쿠폰';

-- 쿠폰
ALTER TABLE carshare.coupons
	ADD CONSTRAINT PK_coupons -- 쿠폰 기본키
		PRIMARY KEY (
			coupon_no -- 쿠폰번호
		);

-- 보유 쿠폰
CREATE TABLE carshare.Own_coupons (
	member_no INT(11)     NULL COMMENT '회원번호', -- 회원번호
	coupon_no VARCHAR(50) NULL COMMENT '쿠폰번호' -- 쿠폰번호
)
COMMENT '보유 쿠폰';

-- 이용내역위치정보
CREATE TABLE carshare.use_info_location (
	location_no INT(11)      NOT NULL COMMENT '위치번호', -- 위치번호
	address     VARCHAR(255) NULL     COMMENT '주소', -- 주소
	latitude    DOUBLE       NULL     COMMENT '위도', -- 위도
	hardness    DOUBLE       NULL     COMMENT '경도' -- 경도
)
COMMENT '이용내역위치정보';

-- 이용내역위치정보
ALTER TABLE carshare.use_info_location
	ADD CONSTRAINT PK_use_info_location -- 이용내역위치정보 기본키
		PRIMARY KEY (
			location_no -- 위치번호
		);

ALTER TABLE carshare.use_info_location
	MODIFY COLUMN location_no INT(11) NOT NULL AUTO_INCREMENT COMMENT '위치번호';

-- 계약위치정보
CREATE TABLE carshare.contract_location (
	location_no INT(11)      NOT NULL COMMENT '위치번호', -- 위치번호
	address     VARCHAR(255) NULL     COMMENT '주소', -- 주소
	latitude    DOUBLE       NULL     COMMENT '위도', -- 위도
	hardness    DOUBLE       NULL     COMMENT '경도' -- 경도
)
COMMENT '계약위치정보';

-- 계약위치정보
ALTER TABLE carshare.contract_location
	ADD CONSTRAINT PK_contract_location -- 계약위치정보 기본키
		PRIMARY KEY (
			location_no -- 위치번호
		);

-- 피이용자
CREATE TABLE carshare.route_user (
	Route_no  VARCHAR(50) NOT NULL COMMENT '사용자 경로번호', -- 사용자 경로번호
	member_no INT(11)     NULL     COMMENT '회원번호', -- 회원번호
	time      TIMESTAMP   NULL     COMMENT '신청시간' -- 신청시간
)
COMMENT '피이용자';

-- 피이용자
ALTER TABLE carshare.route_user
	ADD CONSTRAINT PK_route_user -- 피이용자 기본키
		PRIMARY KEY (
			Route_no -- 사용자 경로번호
		);

-- 회원
ALTER TABLE carshare.member
	ADD CONSTRAINT FK_grade_TO_member -- 등급 -> 회원
		FOREIGN KEY (
			grade_no -- 등급번호
		)
		REFERENCES carshare.grade ( -- 등급
			grade_no -- 등급번호
		);

-- 이용평
ALTER TABLE carshare.userating
	ADD CONSTRAINT FK_use_info_TO_userating -- 이용내역 -> 이용평
		FOREIGN KEY (
			use_no -- 사용번호
		)
		REFERENCES carshare.use_info ( -- 이용내역
			use_no -- 사용번호
		);

-- 이용평
ALTER TABLE carshare.userating
	ADD CONSTRAINT FK_contract_TO_userating -- 계약 -> 이용평
		FOREIGN KEY (
			contract_no -- 계약번호(신청번호)
		)
		REFERENCES carshare.contract ( -- 계약
			contract_no -- 계약번호(신청번호)
		);

-- 이용내역
ALTER TABLE carshare.use_info
	ADD CONSTRAINT FK_member_TO_use_info -- 회원 -> 이용내역
		FOREIGN KEY (
			u_member_no -- 사용자 아이디
		)
		REFERENCES carshare.member ( -- 회원
			member_no -- 회원번호
		);

-- 이용내역
ALTER TABLE carshare.use_info
	ADD CONSTRAINT FK_use_info_location_TO_use_info2 -- 이용내역위치정보 -> 이용내역2
		FOREIGN KEY (
			start_spot -- 출발지
		)
		REFERENCES carshare.use_info_location ( -- 이용내역위치정보
			location_no -- 위치번호
		);

-- 이용내역
ALTER TABLE carshare.use_info
	ADD CONSTRAINT FK_use_info_location_TO_use_info -- 이용내역위치정보 -> 이용내역
		FOREIGN KEY (
			end_spot -- 도착지
		)
		REFERENCES carshare.use_info_location ( -- 이용내역위치정보
			location_no -- 위치번호
		);

-- 이용내역
ALTER TABLE carshare.use_info
	ADD CONSTRAINT FK_member_TO_use_info2 -- 회원 -> 이용내역2
		FOREIGN KEY (
			d_member_no -- 드라이버 아이디
		)
		REFERENCES carshare.member ( -- 회원
			member_no -- 회원번호
		);

-- 경로
ALTER TABLE carshare.route
	ADD CONSTRAINT FK_member_TO_route -- 회원 -> 경로
		FOREIGN KEY (
			member_no -- 회원번호
		)
		REFERENCES carshare.member ( -- 회원
			member_no -- 회원번호
		);

-- 계약
ALTER TABLE carshare.contract
	ADD CONSTRAINT FK_member_TO_contract -- 회원 -> 계약
		FOREIGN KEY (
			u_member_no -- 이용자아이디
		)
		REFERENCES carshare.member ( -- 회원
			member_no -- 회원번호
		);

-- 계약
ALTER TABLE carshare.contract
	ADD CONSTRAINT FK_member_TO_contract2 -- 회원 -> 계약2
		FOREIGN KEY (
			d_member_no -- 드라이버아이디
		)
		REFERENCES carshare.member ( -- 회원
			member_no -- 회원번호
		);

-- 계약
ALTER TABLE carshare.contract
	ADD CONSTRAINT FK_contract_location_TO_contract -- 계약위치정보 -> 계약
		FOREIGN KEY (
			start_spot -- 출발지
		)
		REFERENCES carshare.contract_location ( -- 계약위치정보
			location_no -- 위치번호
		);

-- 계약
ALTER TABLE carshare.contract
	ADD CONSTRAINT FK_contract_location_TO_contract2 -- 계약위치정보 -> 계약2
		FOREIGN KEY (
			end_spot -- 도착지
		)
		REFERENCES carshare.contract_location ( -- 계약위치정보
			location_no -- 위치번호
		);

-- 요금(관리자 관리)
ALTER TABLE carshare.fee
	ADD CONSTRAINT FK_grade_TO_fee -- 등급 -> 요금(관리자 관리)
		FOREIGN KEY (
			grade_no -- 등급번호
		)
		REFERENCES carshare.grade ( -- 등급
			grade_no -- 등급번호
		);

-- 차량정보
ALTER TABLE carshare.car_info
	ADD CONSTRAINT FK_member_TO_car_info -- 회원 -> 차량정보
		FOREIGN KEY (
			member_no -- 회원번호
		)
		REFERENCES carshare.member ( -- 회원
			member_no -- 회원번호
		);

-- 면허정보 
ALTER TABLE carshare.license_info
	ADD CONSTRAINT FK_member_TO_license_info -- 회원 -> 면허정보 
		FOREIGN KEY (
			member_no -- 회원번호
		)
		REFERENCES carshare.member ( -- 회원
			member_no -- 회원번호
		);

-- 보유 쿠폰
ALTER TABLE carshare.Own_coupons
	ADD CONSTRAINT FK_member_TO_Own_coupons -- 회원 -> 보유 쿠폰
		FOREIGN KEY (
			member_no -- 회원번호
		)
		REFERENCES carshare.member ( -- 회원
			member_no -- 회원번호
		);

-- 보유 쿠폰
ALTER TABLE carshare.Own_coupons
	ADD CONSTRAINT FK_coupons_TO_Own_coupons -- 쿠폰 -> 보유 쿠폰
		FOREIGN KEY (
			coupon_no -- 쿠폰번호
		)
		REFERENCES carshare.coupons ( -- 쿠폰
			coupon_no -- 쿠폰번호
		);

-- 피이용자
ALTER TABLE carshare.route_user
	ADD CONSTRAINT FK_route_TO_route_user -- 경로 -> 피이용자
		FOREIGN KEY (
			Route_no -- 사용자 경로번호
		)
		REFERENCES carshare.route ( -- 경로
			Route_no -- 사용자 경로번호
		);

-- 피이용자
ALTER TABLE carshare.route_user
	ADD CONSTRAINT FK_member_TO_route_user -- 회원 -> 피이용자
		FOREIGN KEY (
			member_no -- 회원번호
		)
		REFERENCES carshare.member ( -- 회원
			member_no -- 회원번호
		);