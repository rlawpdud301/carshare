-- carshare
DROP SCHEMA IF EXISTS carshare;

-- carshare
CREATE SCHEMA carshare;

-- ȸ��
CREATE TABLE carshare.member (
	id       VARCHAR(50)  NOT NULL COMMENT 'īī�����̵�', -- ���̵�
	u_intro  TEXT(200)    NULL     COMMENT '����ڰ������ڱ�Ұ�', -- ����ڰ������ڱ�Ұ�
	d_intro  TEXT(200)    NULL     COMMENT '�����ڰ������ڱ�Ұ�', -- �����ڰ������ڱ�Ұ�
	phone    VARCHAR(15)  NULL     COMMENT '��ȭ��ȣ', -- ��ȭ��ȣ
	nikname  VARCHAR(50)  NULL     COMMENT '�г���', -- �г���
	photo    VARCHAR(100) NULL     COMMENT '����', -- ����
	jop      VARCHAR(50)  NULL     COMMENT '����', -- ����
	driver   BOOLEAN      NOT NULL COMMENT '�⺻�޽�', -- ����̹�
	grade_no VARCHAR(50)  NULL     COMMENT '��޹�ȣ', -- ��޹�ȣ
	my_fee   INT(11)      NULL     COMMENT '���' -- ���
)
COMMENT 'ȸ��';

-- ȸ��
ALTER TABLE carshare.member
	ADD CONSTRAINT PK_member -- ȸ�� �⺻Ű
		PRIMARY KEY (
			id -- ���̵�
		);

-- �̿���
CREATE TABLE carshare.userating (
	use_no   VARCHAR(50)  NOT NULL COMMENT '����ȣ', -- ����ȣ
	rating   INT(1)       NOT NULL COMMENT '��5����', -- ����
	content  TEXT         NULL     COMMENT '����', -- ����
	img1     VARCHAR(100) NULL     COMMENT '�����̸�', -- �̹���1
	img2     VARCHAR(100) NULL     COMMENT '�̹���2', -- �̹���2
	img3     VARCHAR(100) NULL     COMMENT '�̹���3', -- �̹���3
	regdate  TIMESTAMP    NULL     COMMENT '�ۼ���', -- �ۼ���
	modedate TIMESTAMP    NULL     COMMENT '������' -- ������
)
COMMENT '�̿���';

-- �̿���
ALTER TABLE carshare.userating
	ADD CONSTRAINT PK_userating -- �̿��� �⺻Ű
		PRIMARY KEY (
			use_no -- ����ȣ
		);

-- �̿볻��
CREATE TABLE carshare.use_info (
	use_no     VARCHAR(50)  NOT NULL COMMENT '����ȣ', -- ����ȣ
	u_id       VARCHAR(50)  NULL     COMMENT '����� ���̵�', -- ����� ���̵�
	d_id       VARCHAR(50)  NULL     COMMENT '����̹� ���̵�', -- ����̹� ���̵�
	start_time TIMESTAMP    NULL     COMMENT '��߽ð�', -- ��߽ð�
	end_time   TIMESTAMP    NULL     COMMENT '�����ð�', -- �����ð�
	start_spot VARCHAR(255) NULL     COMMENT 'APIGPS�ּ�����', -- �����
	end_spot   VARCHAR(255) NULL     COMMENT '������', -- ������
	fee        INT(11)      NULL     COMMENT '���' -- ���
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
	Route_no   VARCHAR(50)  NOT NULL COMMENT '�ְ�� ����̹����� ����', -- ����� ��ι�ȣ
	id         VARCHAR(50)  NULL     COMMENT '���̵�', -- ���̵�
	start_spot VARCHAR(255) NULL     COMMENT '�����', -- �����
	end_spot   VARCHAR(255) NULL     COMMENT '������', -- ������
	avg_fee    INT(11)      NULL     COMMENT '������տ��', -- ������տ��
	process    VARCHAR(50)  NULL     COMMENT '��� ��� �����Ϸ� ' -- ó������
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
	use_no         VARCHAR(50)  NOT NULL COMMENT '����̹����� ����', -- ����ȣ(��û��ȣ)
	u_id           VARCHAR(50)  NULL     COMMENT '�̿��ھ��̵�', -- �̿��ھ��̵�
	d_id           VARCHAR(50)  NULL     COMMENT '����̹����̵�', -- ����̹����̵�
	start_contract TIMESTAMP    NULL     COMMENT '��� ������', -- ��� ������
	end_contract   TIMESTAMP    NULL     COMMENT '��� ������', -- ��� ������
	cycle          CHAR(10)     NULL     COMMENT '�̿����', -- �ֱ�
	contract_date  TIMESTAMP    NULL     COMMENT '�����', -- �����
	contract_fee   INT(11)      NULL     COMMENT '����?', -- ����?
	contract_cont  TEXT(200)    NULL     COMMENT '�����ѱ�', -- �����ѱ�
	start_spot     VARCHAR(255) NULL     COMMENT '�����', -- �����
	end_spot       VARCHAR(255) NULL     COMMENT '������', -- ������
	process        VARCHAR(50)  NULL     COMMENT '��� ���� �ź�', -- ó������
	fee            INT(11)      NULL     COMMENT '���' -- ���
)
COMMENT '���';

-- ���
ALTER TABLE carshare.contract
	ADD CONSTRAINT PK_contract -- ��� �⺻Ű
		PRIMARY KEY (
			use_no -- ����ȣ(��û��ȣ)
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
	id                    VARCHAR(50)  NOT NULL COMMENT '���̵�', -- ���̵�
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
			id -- ���̵�
		);

-- ��������
CREATE TABLE carshare.license_info (
	id               VARCHAR(50)  NOT NULL COMMENT '���̵�', -- ���̵�
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
			id -- ���̵�
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
	id        VARCHAR(50) NULL COMMENT '���̵�', -- ���̵�
	coupon_no VARCHAR(50) NULL COMMENT '������ȣ' -- ������ȣ
)
COMMENT '���� ����';

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

-- �̿볻��
ALTER TABLE carshare.use_info
	ADD CONSTRAINT FK_member_TO_use_info -- ȸ�� -> �̿볻��
		FOREIGN KEY (
			u_id -- ����� ���̵�
		)
		REFERENCES carshare.member ( -- ȸ��
			id -- ���̵�
		);

-- ���
ALTER TABLE carshare.route
	ADD CONSTRAINT FK_member_TO_route -- ȸ�� -> ���
		FOREIGN KEY (
			id -- ���̵�
		)
		REFERENCES carshare.member ( -- ȸ��
			id -- ���̵�
		);

-- ���
ALTER TABLE carshare.contract
	ADD CONSTRAINT FK_member_TO_contract -- ȸ�� -> ���
		FOREIGN KEY (
			u_id -- �̿��ھ��̵�
		)
		REFERENCES carshare.member ( -- ȸ��
			id -- ���̵�
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
			id -- ���̵�
		)
		REFERENCES carshare.member ( -- ȸ��
			id -- ���̵�
		);

-- ��������
ALTER TABLE carshare.license_info
	ADD CONSTRAINT FK_member_TO_license_info -- ȸ�� -> ��������
		FOREIGN KEY (
			id -- ���̵�
		)
		REFERENCES carshare.member ( -- ȸ��
			id -- ���̵�
		);

-- ���� ����
ALTER TABLE carshare.Own_coupons
	ADD CONSTRAINT FK_member_TO_Own_coupons -- ȸ�� -> ���� ����
		FOREIGN KEY (
			id -- ���̵�
		)
		REFERENCES carshare.member ( -- ȸ��
			id -- ���̵�
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
