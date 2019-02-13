-- carshare
DROP SCHEMA IF EXISTS carshare;

-- carshare
CREATE SCHEMA carshare;

-- 회원
CREATE TABLE carshare.member (
	id       VARCHAR(50)  NOT NULL COMMENT '카카오아이디', -- 아이디
	u_intro  TEXT(200)    NULL     COMMENT '사용자간단한자기소개', -- 사용자간단한자기소개
	d_intro  TEXT(200)    NULL     COMMENT '운전자간단한자기소개', -- 운전자간단한자기소개
	phone    VARCHAR(15)  NULL     COMMENT '전화번호', -- 전화번호
	nikname  VARCHAR(50)  NULL     COMMENT '닉네임', -- 닉네임
	photo    VARCHAR(100) NULL     COMMENT '사진', -- 사진
	jop      VARCHAR(50)  NULL     COMMENT '직업', -- 직업
	driver   BOOLEAN      NOT NULL COMMENT '기본펄스', -- 드라이버
	grade_no VARCHAR(50)  NULL     COMMENT '등급번호', -- 등급번호
	my_fee   INT(11)      NULL     COMMENT '요금' -- 요금
)
COMMENT '회원';

-- 회원
ALTER TABLE carshare.member
	ADD CONSTRAINT PK_member -- 회원 기본키
		PRIMARY KEY (
			id -- 아이디
		);

-- 이용평
CREATE TABLE carshare.userating (
	use_no   VARCHAR(50)  NOT NULL COMMENT '사용번호', -- 사용번호
	rating   INT(1)       NOT NULL COMMENT '별5만점', -- 평점
	content  TEXT         NULL     COMMENT '내용', -- 내용
	img1     VARCHAR(100) NULL     COMMENT '파일이름', -- 이미지1
	img2     VARCHAR(100) NULL     COMMENT '이미지2', -- 이미지2
	img3     VARCHAR(100) NULL     COMMENT '이미지3', -- 이미지3
	regdate  TIMESTAMP    NULL     COMMENT '작성일', -- 작성일
	modedate TIMESTAMP    NULL     COMMENT '수정일' -- 수정일
)
COMMENT '이용평';

-- 이용평
ALTER TABLE carshare.userating
	ADD CONSTRAINT PK_userating -- 이용평 기본키
		PRIMARY KEY (
			use_no -- 사용번호
		);

-- 이용내역
CREATE TABLE carshare.use_info (
	use_no     VARCHAR(50)  NOT NULL COMMENT '사용번호', -- 사용번호
	u_id       VARCHAR(50)  NULL     COMMENT '사용자 아이디', -- 사용자 아이디
	d_id       VARCHAR(50)  NULL     COMMENT '드라이버 아이디', -- 드라이버 아이디
	start_time TIMESTAMP    NULL     COMMENT '출발시간', -- 출발시간
	end_time   TIMESTAMP    NULL     COMMENT '도착시간', -- 도착시간
	start_spot VARCHAR(255) NULL     COMMENT 'APIGPS주소정보', -- 출발지
	end_spot   VARCHAR(255) NULL     COMMENT '도착지', -- 도착지
	fee        INT(11)      NULL     COMMENT '요금' -- 요금
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
	Route_no   VARCHAR(50)  NOT NULL COMMENT '주경로 드라이버유저 구분', -- 사용자 경로번호
	id         VARCHAR(50)  NULL     COMMENT '아이디', -- 아이디
	start_spot VARCHAR(255) NULL     COMMENT '출발지', -- 출발지
	end_spot   VARCHAR(255) NULL     COMMENT '도착지', -- 도착지
	avg_fee    INT(11)      NULL     COMMENT '예상평균요금', -- 예상평균요금
	process    VARCHAR(50)  NULL     COMMENT '등록 대기 배차완료 ' -- 처리상태
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
	use_no         VARCHAR(50)  NOT NULL COMMENT '드라이버유저 구분', -- 계약번호(신청번호)
	u_id           VARCHAR(50)  NULL     COMMENT '이용자아이디', -- 이용자아이디
	d_id           VARCHAR(50)  NULL     COMMENT '드라이버아이디', -- 드라이버아이디
	start_contract TIMESTAMP    NULL     COMMENT '계약 시작일', -- 계약 시작일
	end_contract   TIMESTAMP    NULL     COMMENT '계약 종료일', -- 계약 종료일
	cycle          CHAR(10)     NULL     COMMENT '이용요일', -- 주기
	contract_date  TIMESTAMP    NULL     COMMENT '계약일', -- 계약일
	contract_fee   INT(11)      NULL     COMMENT '계약금?', -- 계약금?
	contract_cont  TEXT(200)    NULL     COMMENT '간략한글', -- 간략한글
	start_spot     VARCHAR(255) NULL     COMMENT '출발지', -- 출발지
	end_spot       VARCHAR(255) NULL     COMMENT '도착지', -- 도착지
	process        VARCHAR(50)  NULL     COMMENT '대기 승인 거부', -- 처리여부
	fee            INT(11)      NULL     COMMENT '요금' -- 요금
)
COMMENT '계약';

-- 계약
ALTER TABLE carshare.contract
	ADD CONSTRAINT PK_contract -- 계약 기본키
		PRIMARY KEY (
			use_no -- 계약번호(신청번호)
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
	grade_no   VARCHAR(50) NOT NULL COMMENT '평점에따른등급변화', -- 등급번호
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
	id                    VARCHAR(50)  NOT NULL COMMENT '아이디', -- 아이디
	car_name              VARCHAR(20)  NOT NULL COMMENT '차종', -- 차종
	car_number            VARCHAR(50)  NOT NULL COMMENT '차량번호', -- 차량번호
	insurance_date        DATE         NOT NULL COMMENT '보험만료일', -- 보험만료일
	insurance_boonean     BOOLEAN      NOT NULL COMMENT '보험담보대인배상2에가입여부', -- 보험담보
	relationship_carowner VARCHAR(100) NOT NULL COMMENT '차량소유 관계', -- 차량소유 관계
	car_owner             VARCHAR(50)  NOT NULL COMMENT '차량소유주이름', -- 차량소유주이름
	insurance_card        VARCHAR(100) NOT NULL COMMENT '보험증', -- 보험증
	car_card              VARCHAR(100) NOT NULL COMMENT '자동차등록증' -- 자동차등록증
)
COMMENT '차량정보';

-- 차량정보
ALTER TABLE carshare.car_info
	ADD CONSTRAINT PK_car_info -- 차량정보 기본키
		PRIMARY KEY (
			id -- 아이디
		);

-- 면허정보
CREATE TABLE carshare.license_info (
	id               VARCHAR(50)  NOT NULL COMMENT '아이디', -- 아이디
	license_photo    VARCHAR(100) NOT NULL COMMENT '면허사진', -- 면허사진
	license_no       VARCHAR(50)  NOT NULL COMMENT '면허번호', -- 면허번호
	license_kind     VARCHAR(50)  NOT NULL COMMENT '면허종류', -- 면허종류
	birthday         DATE         NOT NULL COMMENT '생년월일', -- 생년월일
	deadline         DATE         NOT NULL COMMENT '면허갱신 마감일', -- 면허갱신 마감일
	certification_no VARCHAR(50)  NOT NULL COMMENT '면허인증번호' -- 면허인증번호
)
COMMENT '면허정보';

-- 면허정보
ALTER TABLE carshare.license_info
	ADD CONSTRAINT PK_license_info -- 면허정보 기본키
		PRIMARY KEY (
			id -- 아이디
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
	id        VARCHAR(50) NULL COMMENT '아이디', -- 아이디
	coupon_no VARCHAR(50) NULL COMMENT '쿠폰번호' -- 쿠폰번호
)
COMMENT '보유 쿠폰';

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

-- 이용내역
ALTER TABLE carshare.use_info
	ADD CONSTRAINT FK_member_TO_use_info -- 회원 -> 이용내역
		FOREIGN KEY (
			u_id -- 사용자 아이디
		)
		REFERENCES carshare.member ( -- 회원
			id -- 아이디
		);

-- 경로
ALTER TABLE carshare.route
	ADD CONSTRAINT FK_member_TO_route -- 회원 -> 경로
		FOREIGN KEY (
			id -- 아이디
		)
		REFERENCES carshare.member ( -- 회원
			id -- 아이디
		);

-- 계약
ALTER TABLE carshare.contract
	ADD CONSTRAINT FK_member_TO_contract -- 회원 -> 계약
		FOREIGN KEY (
			u_id -- 이용자아이디
		)
		REFERENCES carshare.member ( -- 회원
			id -- 아이디
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
			id -- 아이디
		)
		REFERENCES carshare.member ( -- 회원
			id -- 아이디
		);

-- 면허정보
ALTER TABLE carshare.license_info
	ADD CONSTRAINT FK_member_TO_license_info -- 회원 -> 면허정보
		FOREIGN KEY (
			id -- 아이디
		)
		REFERENCES carshare.member ( -- 회원
			id -- 아이디
		);

-- 보유 쿠폰
ALTER TABLE carshare.Own_coupons
	ADD CONSTRAINT FK_member_TO_Own_coupons -- 회원 -> 보유 쿠폰
		FOREIGN KEY (
			id -- 아이디
		)
		REFERENCES carshare.member ( -- 회원
			id -- 아이디
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
		
	
	
CREATE USER 'user_carshare'@'%';
ALTER USER 'user_carshare'@'%'
IDENTIFIED BY 'rootroot' ;
GRANT Alter ON carshare.* TO 'user_carshare'@'%';
GRANT Create ON carshare.* TO 'user_carshare'@'%';
GRANT Create view ON carshare.* TO 'user_carshare'@'%';
GRANT Delete ON carshare.* TO 'user_carshare'@'%';
GRANT Drop ON carshare.* TO 'user_carshare'@'%';
GRANT Grant option ON carshare.* TO 'user_carshare'@'%';
GRANT Index ON carshare.* TO 'user_carshare'@'%';
GRANT Insert ON carshare.* TO 'user_carshare'@'%';
GRANT References ON carshare.* TO 'user_carshare'@'%';
GRANT Select ON carshare.* TO 'user_carshare'@'%';
GRANT Show view ON carshare.* TO 'user_carshare'@'%';
GRANT Trigger ON carshare.* TO 'user_carshare'@'%';
GRANT Update ON carshare.* TO 'user_carshare'@'%';
GRANT Alter routine ON carshare.* TO 'user_carshare'@'%';
GRANT Create routine ON carshare.* TO 'user_carshare'@'%';
GRANT Create temporary tables ON carshare.* TO 'user_carshare'@'%';
GRANT Execute ON carshare.* TO 'user_carshare'@'%';
GRANT Lock tables ON carshare.* TO 'user_carshare'@'%';
FLUSH PRIVILEGES;

CREATE USER 'user_carshare'@'localhost';
ALTER USER 'user_carshare'@'localhost'
IDENTIFIED BY 'rootroot' ;
GRANT Alter ON carshare.* TO 'user_carshare'@'localhost';
GRANT Create ON carshare.* TO 'user_carshare'@'localhost';
GRANT Create view ON carshare.* TO 'user_carshare'@'localhost';
GRANT Delete ON carshare.* TO 'user_carshare'@'localhost';
GRANT Drop ON carshare.* TO 'user_carshare'@'localhost';
GRANT Grant option ON carshare.* TO 'user_carshare'@'localhost';
GRANT Index ON carshare.* TO 'user_carshare'@'localhost';
GRANT Insert ON carshare.* TO 'user_carshare'@'localhost';
GRANT References ON carshare.* TO 'user_carshare'@'localhost';
GRANT Select ON carshare.* TO 'user_carshare'@'localhost';
GRANT Show view ON carshare.* TO 'user_carshare'@'localhost';
GRANT Trigger ON carshare.* TO 'user_carshare'@'localhost';
GRANT Update ON carshare.* TO 'user_carshare'@'localhost';
GRANT Alter routine ON carshare.* TO 'user_carshare'@'localhost';
GRANT Create routine ON carshare.* TO 'user_carshare'@'localhost';
GRANT Create temporary tables ON carshare.* TO 'user_carshare'@'localhost';
GRANT Execute ON carshare.* TO 'user_carshare'@'localhost';
GRANT Lock tables ON carshare.* TO 'user_carshare'@'localhost';
FLUSH PRIVILEGES;
