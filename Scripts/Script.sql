-- carshare
DROP SCHEMA IF EXISTS carshare;

-- carshare
CREATE SCHEMA carshare;

-- ȸ��
CREATE TABLE carshare.member (
	member_no INT(11)      NOT NULL COMMENT '�ٲ������', -- ȸ����ȣ
	kakao_id  VARCHAR(50)  NULL     COMMENT 'īī������̵�', -- īī������̵�
	naver_id  VARCHAR(50)  NULL     COMMENT '���̹����̵�', -- ���̹����̵�
	name      VARCHAR(50)  NULL     COMMENT '�̸�', -- �̸�
	u_intro   TEXT(200)    NULL     COMMENT '����ڰ������ڱ�Ұ�', -- ����ڰ������ڱ�Ұ�
	d_intro   TEXT(200)    NULL     COMMENT '�����ڰ������ڱ�Ұ�', -- �����ڰ������ڱ�Ұ�
	phone     VARCHAR(15)  NULL     COMMENT '��ȭ��ȣ', -- ��ȭ��ȣ
	nickname  VARCHAR(50)  NULL     COMMENT '�г���', -- �г���
	photo     VARCHAR(100) NULL     COMMENT '����', -- ����
	jop       VARCHAR(50)  NULL     COMMENT '����', -- ����
	driver    BOOLEAN      NOT NULL DEFAULT false COMMENT '�⺻�޽�', -- ����̹�
	jumin     VARCHAR(15)  NULL     COMMENT '�ֹε�Ϲ�ȣ', -- �ֹε�Ϲ�ȣ
	grade_no  VARCHAR(50)  NULL     COMMENT '��޹�ȣ', -- ��޹�ȣ
	my_fee    INT(11)      NULL     COMMENT '���', -- ���
	email     VARCHAR(50)  NULL     COMMENT '�̸���' -- �̸���
)
COMMENT 'ȸ��';

-- ȸ��
ALTER TABLE carshare.member
	ADD CONSTRAINT PK_member -- ȸ�� �⺻Ű
		PRIMARY KEY (
			member_no -- ȸ����ȣ
		);

ALTER TABLE carshare.member
	MODIFY COLUMN member_no INT(11) NOT NULL AUTO_INCREMENT COMMENT '�ٲ������';

-- �̿���
CREATE TABLE carshare.userating (
	userating_no VARCHAR(50)  NOT NULL COMMENT '���ȣ', -- ���ȣ
	use_no       VARCHAR(50)  NOT NULL COMMENT '����ȣ', -- ����ȣ
	contract_no  VARCHAR(50)  NULL     COMMENT '����ȣ(��û��ȣ)', -- ����ȣ(��û��ȣ)
	rating       INT(1)       NOT NULL COMMENT '��5����', -- ����
	content      TEXT         NULL     COMMENT '����', -- ����
	img1         VARCHAR(100) NULL     COMMENT '�����̸�', -- �̹���1
	img2         VARCHAR(100) NULL     COMMENT '�̹���2', -- �̹���2
	img3         VARCHAR(100) NULL     COMMENT '�̹���3', -- �̹���3
	regdate      TIMESTAMP    NULL     COMMENT '�ۼ���', -- �ۼ���
	modedate     TIMESTAMP    NULL     COMMENT '������' -- ������
)
COMMENT '�̿���';

-- �̿���
ALTER TABLE carshare.userating
	ADD CONSTRAINT PK_userating -- �̿��� �⺻Ű
		PRIMARY KEY (
			userating_no -- ���ȣ
		);

-- �̿볻��
CREATE TABLE carshare.use_info (
	use_no      VARCHAR(50) NOT NULL COMMENT '����ȣ', -- ����ȣ
	u_member_no INT(11)     NULL     COMMENT '����� ���̵�', -- ����� ���̵�
	d_member_no INT(11)     NULL     COMMENT '����̹� ���̵�', -- ����̹� ���̵�
	start_time  TIMESTAMP   NULL     COMMENT '��߽ð�', -- ��߽ð�
	end_time    TIMESTAMP   NULL     COMMENT '�����ð�', -- �����ð�
	fee         INT(11)     NULL     COMMENT '���', -- ���
	start_spot  INT(11)     NULL     COMMENT 'APIGPS�ּ�����', -- �����
	end_spot    INT(11)     NULL     COMMENT '������' -- ������
)
COMMENT '�̿볻��';

-- �̿볻��
ALTER TABLE carshare.use_info
	ADD CONSTRAINT PK_use_info -- �̿볻�� �⺻Ű
		PRIMARY KEY (
			use_no -- ����ȣ
		);

-- ���
CREATE TABLE carshare.route (
	Route_no       VARCHAR(50)  NOT NULL COMMENT '�ְ�� ����̹����� ���� ���ã��ǥ��', -- ����� ��ι�ȣ
	member_no      INT(11)      NULL     COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	process        VARCHAR(50)  NULL     COMMENT '��� ��� �����Ϸ� ', -- ó������
	avgFee         INT(11)      NULL     COMMENT '������', -- ������
	start_address  VARCHAR(255) NULL     COMMENT '������ּ�', -- ������ּ�
	start_latitude DOUBLE       NULL     COMMENT '���������', -- ���������
	start_hardness DOUBLE       NULL     COMMENT '������浵', -- ������浵
	end_address    VARCHAR(255) NULL     COMMENT '�������ּ�', -- �������ּ�
	end_latitude   DOUBLE       NULL     COMMENT '����������', -- ����������
	end_hardness   DOUBLE       NULL     COMMENT '�������浵' -- �������浵
)
COMMENT '���';

-- ���
ALTER TABLE carshare.route
	ADD CONSTRAINT PK_route -- ��� �⺻Ű
		PRIMARY KEY (
			Route_no -- ����� ��ι�ȣ
		);

-- ���
CREATE TABLE carshare.contract (
	contract_no    VARCHAR(50) NOT NULL COMMENT '����̹����� ����', -- ����ȣ(��û��ȣ)
	u_member_no    INT(11)     NULL     COMMENT '�̿��ھ��̵�', -- �̿��ھ��̵�
	d_member_no    INT(11)     NULL     COMMENT '����̹����̵�', -- ����̹����̵�
	start_contract TIMESTAMP   NULL     COMMENT '��� ������', -- ��� ������
	end_contract   TIMESTAMP   NULL     COMMENT '��� ������', -- ��� ������
	cycle          CHAR(10)    NULL     COMMENT '�̿����', -- �ֱ�
	contract_date  TIMESTAMP   NULL     COMMENT '�����', -- �����
	contract_fee   INT(11)     NULL     COMMENT '����?', -- ����?
	contract_cont  TEXT(200)   NULL     COMMENT '�����ѱ�', -- �����ѱ�
	process        VARCHAR(50) NULL     COMMENT '��� ���� �ź�', -- ó������
	fee            INT(11)     NULL     COMMENT '���', -- ���
	start_spot     INT(11)     NULL     COMMENT '�����', -- �����
	end_spot       INT(11)     NULL     COMMENT '������' -- ������
)
COMMENT '���';

-- ���
ALTER TABLE carshare.contract
	ADD CONSTRAINT PK_contract -- ��� �⺻Ű
		PRIMARY KEY (
			contract_no -- ����ȣ(��û��ȣ)
		);

-- ���(������ ����)
CREATE TABLE carshare.fee (
	fee      INT(11)     NOT NULL COMMENT '���ʹ� ,�⸧������ڵ����?', -- ���
	grade_no VARCHAR(50) NULL     COMMENT '��޹�ȣ', -- ��޹�ȣ
	max_fee  INT(11)     NULL     COMMENT '��޺� �ۼ�Ʈ�ٸ������밡��' -- �ִ���
)
COMMENT '���(������ ����)';

-- ���(������ ����)
ALTER TABLE carshare.fee
	ADD CONSTRAINT PK_fee -- ���(������ ����) �⺻Ű
		PRIMARY KEY (
			fee -- ���
		);

-- ���
CREATE TABLE carshare.grade (
	grade_no   VARCHAR(50) NOT NULL COMMENT '������������޺�ȭ', -- ��޹�ȣ
	grade_name VARCHAR(50) NULL     COMMENT '��޸�' -- ��޸�
)
COMMENT '���';

-- ���
ALTER TABLE carshare.grade
	ADD CONSTRAINT PK_grade -- ��� �⺻Ű
		PRIMARY KEY (
			grade_no -- ��޹�ȣ
		);

-- ��������
CREATE TABLE carshare.car_info (
	member_no             INT(11)      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	car_name              VARCHAR(20)  NOT NULL COMMENT '����', -- ����
	car_number            VARCHAR(50)  NOT NULL COMMENT '������ȣ', -- ������ȣ
	insurance_date        DATE         NOT NULL COMMENT '���踸����', -- ���踸����
	insurance_boonean     BOOLEAN      NOT NULL COMMENT '����㺸���ι��2�����Կ���', -- ����㺸
	relationship_carowner VARCHAR(100) NOT NULL COMMENT '�������� ����', -- �������� ����
	car_owner             VARCHAR(50)  NOT NULL COMMENT '�����������̸�', -- �����������̸�
	insurance_card        VARCHAR(100) NOT NULL COMMENT '������', -- ������
	car_card              VARCHAR(100) NOT NULL COMMENT '�ڵ��������' -- �ڵ��������
)
COMMENT '��������';

-- ��������
ALTER TABLE carshare.car_info
	ADD CONSTRAINT PK_car_info -- �������� �⺻Ű
		PRIMARY KEY (
			member_no -- ȸ����ȣ
		);

-- ��������
CREATE TABLE carshare.license_info (
	member_no        INT(11)      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	license_photo    VARCHAR(100) NOT NULL COMMENT '�������', -- �������
	license_no       VARCHAR(50)  NOT NULL COMMENT '�����ȣ', -- �����ȣ
	license_kind     VARCHAR(50)  NOT NULL COMMENT '��������', -- ��������
	birthday         DATE         NOT NULL COMMENT '�������', -- �������
	deadline         DATE         NOT NULL COMMENT '���㰻�� ������', -- ���㰻�� ������
	certification_no VARCHAR(50)  NOT NULL COMMENT '����������ȣ' -- ����������ȣ
)
COMMENT '��������';

-- ��������
ALTER TABLE carshare.license_info
	ADD CONSTRAINT PK_license_info -- �������� �⺻Ű
		PRIMARY KEY (
			member_no -- ȸ����ȣ
		);

-- ����
CREATE TABLE carshare.coupons (
	coupon_no   VARCHAR(50) NOT NULL COMMENT '������ȣ', -- ������ȣ
	coupon_name VARCHAR(50) NULL     COMMENT '�����̸�', -- �����̸�
	coupon_ex   TEXT(200)   NULL     COMMENT '��������' -- ��������
)
COMMENT '����';

-- ����
ALTER TABLE carshare.coupons
	ADD CONSTRAINT PK_coupons -- ���� �⺻Ű
		PRIMARY KEY (
			coupon_no -- ������ȣ
		);

-- ���� ����
CREATE TABLE carshare.Own_coupons (
	member_no INT(11)     NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	coupon_no VARCHAR(50) NULL COMMENT '������ȣ' -- ������ȣ
)
COMMENT '���� ����';

-- �̿볻����ġ����
CREATE TABLE carshare.use_info_location (
	location_no INT(11)      NOT NULL COMMENT '��ġ��ȣ', -- ��ġ��ȣ
	address     VARCHAR(255) NULL     COMMENT '�ּ�', -- �ּ�
	latitude    DOUBLE       NULL     COMMENT '����', -- ����
	hardness    DOUBLE       NULL     COMMENT '�浵' -- �浵
)
COMMENT '�̿볻����ġ����';

-- �̿볻����ġ����
ALTER TABLE carshare.use_info_location
	ADD CONSTRAINT PK_use_info_location -- �̿볻����ġ���� �⺻Ű
		PRIMARY KEY (
			location_no -- ��ġ��ȣ
		);

ALTER TABLE carshare.use_info_location
	MODIFY COLUMN location_no INT(11) NOT NULL AUTO_INCREMENT COMMENT '��ġ��ȣ';

-- �����ġ����
CREATE TABLE carshare.contract_location (
	location_no INT(11)      NOT NULL COMMENT '��ġ��ȣ', -- ��ġ��ȣ
	address     VARCHAR(255) NULL     COMMENT '�ּ�', -- �ּ�
	latitude    DOUBLE       NULL     COMMENT '����', -- ����
	hardness    DOUBLE       NULL     COMMENT '�浵' -- �浵
)
COMMENT '�����ġ����';

-- �����ġ����
ALTER TABLE carshare.contract_location
	ADD CONSTRAINT PK_contract_location -- �����ġ���� �⺻Ű
		PRIMARY KEY (
			location_no -- ��ġ��ȣ
		);

-- ���̿���
CREATE TABLE carshare.route_user (
	Route_no  VARCHAR(50) NOT NULL COMMENT '����� ��ι�ȣ', -- ����� ��ι�ȣ
	member_no INT(11)     NULL     COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	time      TIMESTAMP   NULL     COMMENT '��û�ð�' -- ��û�ð�
)
COMMENT '���̿���';

-- ���̿���
ALTER TABLE carshare.route_user
	ADD CONSTRAINT PK_route_user -- ���̿��� �⺻Ű
		PRIMARY KEY (
			Route_no -- ����� ��ι�ȣ
		);

-- ȸ��
ALTER TABLE carshare.member
	ADD CONSTRAINT FK_grade_TO_member -- ��� -> ȸ��
		FOREIGN KEY (
			grade_no -- ��޹�ȣ
		)
		REFERENCES carshare.grade ( -- ���
			grade_no -- ��޹�ȣ
		);

-- �̿���
ALTER TABLE carshare.userating
	ADD CONSTRAINT FK_use_info_TO_userating -- �̿볻�� -> �̿���
		FOREIGN KEY (
			use_no -- ����ȣ
		)
		REFERENCES carshare.use_info ( -- �̿볻��
			use_no -- ����ȣ
		);

-- �̿���
ALTER TABLE carshare.userating
	ADD CONSTRAINT FK_contract_TO_userating -- ��� -> �̿���
		FOREIGN KEY (
			contract_no -- ����ȣ(��û��ȣ)
		)
		REFERENCES carshare.contract ( -- ���
			contract_no -- ����ȣ(��û��ȣ)
		);

-- �̿볻��
ALTER TABLE carshare.use_info
	ADD CONSTRAINT FK_member_TO_use_info -- ȸ�� -> �̿볻��
		FOREIGN KEY (
			u_member_no -- ����� ���̵�
		)
		REFERENCES carshare.member ( -- ȸ��
			member_no -- ȸ����ȣ
		);

-- �̿볻��
ALTER TABLE carshare.use_info
	ADD CONSTRAINT FK_use_info_location_TO_use_info2 -- �̿볻����ġ���� -> �̿볻��2
		FOREIGN KEY (
			start_spot -- �����
		)
		REFERENCES carshare.use_info_location ( -- �̿볻����ġ����
			location_no -- ��ġ��ȣ
		);

-- �̿볻��
ALTER TABLE carshare.use_info
	ADD CONSTRAINT FK_use_info_location_TO_use_info -- �̿볻����ġ���� -> �̿볻��
		FOREIGN KEY (
			end_spot -- ������
		)
		REFERENCES carshare.use_info_location ( -- �̿볻����ġ����
			location_no -- ��ġ��ȣ
		);

-- �̿볻��
ALTER TABLE carshare.use_info
	ADD CONSTRAINT FK_member_TO_use_info2 -- ȸ�� -> �̿볻��2
		FOREIGN KEY (
			d_member_no -- ����̹� ���̵�
		)
		REFERENCES carshare.member ( -- ȸ��
			member_no -- ȸ����ȣ
		);

-- ���
ALTER TABLE carshare.route
	ADD CONSTRAINT FK_member_TO_route -- ȸ�� -> ���
		FOREIGN KEY (
			member_no -- ȸ����ȣ
		)
		REFERENCES carshare.member ( -- ȸ��
			member_no -- ȸ����ȣ
		);

-- ���
ALTER TABLE carshare.contract
	ADD CONSTRAINT FK_member_TO_contract -- ȸ�� -> ���
		FOREIGN KEY (
			u_member_no -- �̿��ھ��̵�
		)
		REFERENCES carshare.member ( -- ȸ��
			member_no -- ȸ����ȣ
		);

-- ���
ALTER TABLE carshare.contract
	ADD CONSTRAINT FK_member_TO_contract2 -- ȸ�� -> ���2
		FOREIGN KEY (
			d_member_no -- ����̹����̵�
		)
		REFERENCES carshare.member ( -- ȸ��
			member_no -- ȸ����ȣ
		);

-- ���
ALTER TABLE carshare.contract
	ADD CONSTRAINT FK_contract_location_TO_contract -- �����ġ���� -> ���
		FOREIGN KEY (
			start_spot -- �����
		)
		REFERENCES carshare.contract_location ( -- �����ġ����
			location_no -- ��ġ��ȣ
		);

-- ���
ALTER TABLE carshare.contract
	ADD CONSTRAINT FK_contract_location_TO_contract2 -- �����ġ���� -> ���2
		FOREIGN KEY (
			end_spot -- ������
		)
		REFERENCES carshare.contract_location ( -- �����ġ����
			location_no -- ��ġ��ȣ
		);

-- ���(������ ����)
ALTER TABLE carshare.fee
	ADD CONSTRAINT FK_grade_TO_fee -- ��� -> ���(������ ����)
		FOREIGN KEY (
			grade_no -- ��޹�ȣ
		)
		REFERENCES carshare.grade ( -- ���
			grade_no -- ��޹�ȣ
		);

-- ��������
ALTER TABLE carshare.car_info
	ADD CONSTRAINT FK_member_TO_car_info -- ȸ�� -> ��������
		FOREIGN KEY (
			member_no -- ȸ����ȣ
		)
		REFERENCES carshare.member ( -- ȸ��
			member_no -- ȸ����ȣ
		);

-- ��������
ALTER TABLE carshare.license_info
	ADD CONSTRAINT FK_member_TO_license_info -- ȸ�� -> ��������
		FOREIGN KEY (
			member_no -- ȸ����ȣ
		)
		REFERENCES carshare.member ( -- ȸ��
			member_no -- ȸ����ȣ
		);

-- ���� ����
ALTER TABLE carshare.Own_coupons
	ADD CONSTRAINT FK_member_TO_Own_coupons -- ȸ�� -> ���� ����
		FOREIGN KEY (
			member_no -- ȸ����ȣ
		)
		REFERENCES carshare.member ( -- ȸ��
			member_no -- ȸ����ȣ
		);

-- ���� ����
ALTER TABLE carshare.Own_coupons
	ADD CONSTRAINT FK_coupons_TO_Own_coupons -- ���� -> ���� ����
		FOREIGN KEY (
			coupon_no -- ������ȣ
		)
		REFERENCES carshare.coupons ( -- ����
			coupon_no -- ������ȣ
		);

-- ���̿���
ALTER TABLE carshare.route_user
	ADD CONSTRAINT FK_route_TO_route_user -- ��� -> ���̿���
		FOREIGN KEY (
			Route_no -- ����� ��ι�ȣ
		)
		REFERENCES carshare.route ( -- ���
			Route_no -- ����� ��ι�ȣ
		);

-- ���̿���
ALTER TABLE carshare.route_user
	ADD CONSTRAINT FK_member_TO_route_user -- ȸ�� -> ���̿���
		FOREIGN KEY (
			member_no -- ȸ����ȣ
		)
		REFERENCES carshare.member ( -- ȸ��
			member_no -- ȸ����ȣ
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
