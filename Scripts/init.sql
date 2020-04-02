-- 도서관 프로젝트
DROP SCHEMA IF EXISTS yi_java3st_3team;

-- 도서관 프로젝트
CREATE SCHEMA yi_java3st_3team;

-- 도서
CREATE TABLE yi_java3st_3team.book (
	book_code     CHAR(10)     NOT NULL COMMENT '도서코드', -- 도서코드
	book_name     VARCHAR(50)  NOT NULL COMMENT '도서명', -- 도서명
	authr_name    VARCHAR(50)  NOT NULL COMMENT '저자이름', -- 저자이름
	trnslr_name   VARCHAR(50)  NULL     COMMENT '역자이름', -- 역자이름
	pls           INTEGER      NOT NULL COMMENT '출판사', -- 출판사
	pblicte_year  DATE         NOT NULL COMMENT '발행년도', -- 발행년도
	book_price    INTEGER      NOT NULL COMMENT '도서가격', -- 도서가격
	lend_psb_cdt  TINYINT      NOT NULL COMMENT '대여가능여부', -- 대여가능여부
	total_le_cnt  INTEGER      NULL     COMMENT '총대여횟수', -- 총대여횟수
	book_img      LONGBLOB     NULL     COMMENT '도서이미지', -- 도서이미지
	lc_no         INTEGER      NOT NULL COMMENT '대분류번호', -- 대분류번호
	ml_no         INTEGER      NOT NULL COMMENT '중분류번호', -- 중분류번호
	regist_date   DATETIME     NOT NULL COMMENT '등록일자', -- 등록일자
	dsuse_cdt     TINYINT      NULL     COMMENT '폐기여부', -- 폐기여부
	book_img_path VARCHAR(100) NULL     COMMENT '도서이미지경로' -- 도서이미지경로
)
COMMENT '도서';

-- 도서
ALTER TABLE yi_java3st_3team.book
	ADD CONSTRAINT PK_book -- 도서 기본키
		PRIMARY KEY (
			book_code -- 도서코드
		);

-- 회원등급
CREATE TABLE yi_java3st_3team.grade (
	grade_no    INTEGER     NOT NULL COMMENT '등급번호', -- 등급번호
	grad_name   VARCHAR(50) NOT NULL COMMENT '등급이름', -- 등급이름
	book_le_cnt INTEGER     NOT NULL COMMENT '도서대여권수' -- 도서대여권수
)
COMMENT '회원등급';

-- 회원등급
ALTER TABLE yi_java3st_3team.grade
	ADD CONSTRAINT PK_grade -- 회원등급 기본키
		PRIMARY KEY (
			grade_no -- 등급번호
		);

-- 대분류
CREATE TABLE yi_java3st_3team.large_classification (
	lclas_no   INTEGER     NOT NULL COMMENT '대분류번호', -- 대분류번호
	lclas_name VARCHAR(50) NOT NULL COMMENT '대분류이름' -- 대분류이름
)
COMMENT '대분류';

-- 대분류
ALTER TABLE yi_java3st_3team.large_classification
	ADD CONSTRAINT PK_large_classification -- 대분류 기본키2
		PRIMARY KEY (
			lclas_no -- 대분류번호
		);

-- 대여/반납
CREATE TABLE yi_java3st_3team.lending (
	lend_rturn_no  INTEGER     NOT NULL COMMENT '대여반납번호', -- 대여반납번호
	mber_id        VARCHAR(30) NOT NULL COMMENT '회원ID', -- 회원ID
	book_cd        CHAR(10)    NOT NULL COMMENT '도서코드', -- 도서코드
	lend_date      DATETIME    NOT NULL COMMENT '대여일', -- 대여일
	rturn_due_date DATETIME    NOT NULL COMMENT '반납예정일', -- 반납예정일
	rturn_psm_cdt  TINYINT     NOT NULL COMMENT '반납연기여부', -- 반납연기여부
	rturn_date     DATETIME    NULL     COMMENT '반납일', -- 반납일
	overdue_cdt    TINYINT     NOT NULL COMMENT '연체여부' -- 연체여부
)
COMMENT '대여/반납';

-- 대여/반납
ALTER TABLE yi_java3st_3team.lending
	ADD CONSTRAINT PK_lending -- 대여/반납 기본키
		PRIMARY KEY (
			lend_rturn_no -- 대여반납번호
		);

ALTER TABLE yi_java3st_3team.lending
	MODIFY COLUMN lend_rturn_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '대여반납번호';

ALTER TABLE yi_java3st_3team.lending
	AUTO_INCREMENT = 1;

-- 사서
CREATE TABLE yi_java3st_3team.librarian (
	lb_id        VARCHAR(30)  NOT NULL COMMENT '사서ID', -- 사서ID
	lb_pass      CHAR(41)     NOT NULL COMMENT '사서비밀번호', -- 사서비밀번호
	lb_name      VARCHAR(50)  NOT NULL COMMENT '사서이름', -- 사서이름
	lb_birthday  DATETIME     NULL     COMMENT '사서생년월일', -- 사서생년월일
	lb_zip       INTEGER      NULL     COMMENT '사서우편번호', -- 사서우편번호
	lb_bass_ad   VARCHAR(255) NULL     COMMENT '사서기본주소', -- 사서기본주소
	lb_detail_ad VARCHAR(255) NULL     COMMENT '사서상세주소', -- 사서상세주소
	lb_tel       VARCHAR(30)  NULL     COMMENT '사서전화번호', -- 사서전화번호
	lb_img       LONGBLOB     NULL     COMMENT '사서이미지', -- 사서이미지
	title        INTEGER      NOT NULL COMMENT '직책', -- 직책
	join_date    DATETIME     NOT NULL COMMENT '입사일', -- 입사일
	work_cdt     TINYINT      NOT NULL COMMENT '근무여부', -- 근무여부
	lb_img_path  VARCHAR(100) NULL     COMMENT '사서이미지경로' -- 사서이미지경로
)
COMMENT '사서';

-- 사서
ALTER TABLE yi_java3st_3team.librarian
	ADD CONSTRAINT PK_librarian -- 사서 기본키
		PRIMARY KEY (
			lb_id -- 사서ID
		);

-- 회원
CREATE TABLE yi_java3st_3team.member (
	mber_id        VARCHAR(30)  NOT NULL COMMENT '회원ID', -- 회원ID
	mber_pass      CHAR(41)     NOT NULL COMMENT '회원비밀번호', -- 회원비밀번호
	mber_name      VARCHAR(50)  NOT NULL COMMENT '회원이름', -- 회원이름
	mber_brthdy    DATETIME     NOT NULL COMMENT '회원생년월일', -- 회원생년월일
	mber_zip       INTEGER      NOT NULL COMMENT '회원우편번호', -- 회원우편번호
	mber_bass_ad   VARCHAR(255) NULL     COMMENT '회원기본주소', -- 회원기본주소
	mber_detail_ad VARCHAR(255) NULL     COMMENT '회원상세주소', -- 회원상세주소
	mber_tel       VARCHAR(30)  NOT NULL COMMENT '회원전화번호', -- 회원전화번호
	mber_img       LONGBLOB     NULL     COMMENT '회원이미지', -- 회원이미지
	total_le_cnt   INTEGER      NULL     COMMENT '총대여권수', -- 총대여권수
	lend_book_cnt  INTEGER      NULL     COMMENT '대여도서권수', -- 대여도서권수
	grade          INTEGER      NULL     COMMENT '등급', -- 등급
	lend_psb_cdt   TINYINT      NULL     COMMENT '대여가능여부', -- 대여가능여부
	join_dt        DATETIME     NOT NULL COMMENT '가입일', -- 가입일
	wdr_cdt        TINYINT      NULL     COMMENT '탈퇴여부', -- 탈퇴여부
	od_cnt         INTEGER      NULL     COMMENT '연체횟수', -- 연체횟수
	mber_img_path  VARCHAR(100) NULL     COMMENT '회원이미지경로' -- 회원이미지경로
)
COMMENT '회원';

-- 회원
ALTER TABLE yi_java3st_3team.member
	ADD CONSTRAINT PK_member -- 회원 기본키
		PRIMARY KEY (
			mber_id -- 회원ID
		);

-- 중분류
CREATE TABLE yi_java3st_3team.middle_classification (
	lclas_no   INTEGER     NOT NULL COMMENT '대분류번호', -- 대분류번호
	mlsfc_no   INTEGER     NOT NULL COMMENT '중분류번호', -- 중분류번호
	mlsfc_name VARCHAR(50) NOT NULL COMMENT '중분류이름' -- 중분류이름
)
COMMENT '중분류';

-- 중분류
ALTER TABLE yi_java3st_3team.middle_classification
	ADD CONSTRAINT PK_middle_classification -- 중분류 기본키2
		PRIMARY KEY (
			lclas_no, -- 대분류번호
			mlsfc_no  -- 중분류번호
		);

-- 출판사
CREATE TABLE yi_java3st_3team.publishing_company (
	pls_no   INTEGER     NOT NULL COMMENT '출판사번호', -- 출판사번호
	pls_name VARCHAR(50) NOT NULL COMMENT '출판사이름' -- 출판사이름
)
COMMENT '출판사';

-- 출판사
ALTER TABLE yi_java3st_3team.publishing_company
	ADD CONSTRAINT PK_publishing_company -- 출판사 기본키
		PRIMARY KEY (
			pls_no -- 출판사번호
		);

-- 추천도서
CREATE TABLE yi_java3st_3team.recommendation (
	recom_book_no INTEGER       NOT NULL COMMENT '추천도서번호', -- 추천도서번호
	book_code     CHAR(10)      NOT NULL COMMENT '도서코드', -- 도서코드
	book_cont     VARCHAR(1050) NOT NULL COMMENT '도서소개' -- 도서소개
)
COMMENT '추천도서';

-- 추천도서
ALTER TABLE yi_java3st_3team.recommendation
	ADD CONSTRAINT PK_recommendation -- 추천도서 기본키
		PRIMARY KEY (
			recom_book_no -- 추천도서번호
		);

ALTER TABLE yi_java3st_3team.recommendation
	MODIFY COLUMN recom_book_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '추천도서번호';

ALTER TABLE yi_java3st_3team.recommendation
	AUTO_INCREMENT = 1;

-- 신청도서
CREATE TABLE yi_java3st_3team.request_book (
	reqst_book_no     INTEGER     NOT NULL COMMENT '신청도서번호', -- 신청도서번호
	reqst_mb_id       VARCHAR(30) NOT NULL COMMENT '신청회원ID', -- 신청회원ID
	reqst_book_name   VARCHAR(50) NOT NULL COMMENT '신청도서명', -- 신청도서명
	reqst_book_author VARCHAR(50) NOT NULL COMMENT '신청도서저자', -- 신청도서저자
	reqst_book_trnslr VARCHAR(50) NULL     COMMENT '신청도서역자', -- 신청도서역자
	request_book_pls  VARCHAR(50) NOT NULL COMMENT '신청도서출판사', -- 신청도서출판사
	reqst_date        DATETIME    NOT NULL COMMENT '신청날짜', -- 신청날짜
	wh_cdt            TINYINT     NULL     COMMENT '입고여부' -- 입고여부
)
COMMENT '신청도서';

-- 신청도서
ALTER TABLE yi_java3st_3team.request_book
	ADD CONSTRAINT PK_request_book -- 신청도서 기본키
		PRIMARY KEY (
			reqst_book_no -- 신청도서번호
		);

ALTER TABLE yi_java3st_3team.request_book
	MODIFY COLUMN reqst_book_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '신청도서번호';

ALTER TABLE yi_java3st_3team.request_book
	AUTO_INCREMENT = 1;

-- 직책
CREATE TABLE yi_java3st_3team.title (
	title_no   INTEGER     NOT NULL COMMENT '직책번호', -- 직책번호
	title_name VARCHAR(50) NOT NULL COMMENT '직책명' -- 직책명
)
COMMENT '직책';

-- 직책
ALTER TABLE yi_java3st_3team.title
	ADD CONSTRAINT PK_title -- 직책 기본키
		PRIMARY KEY (
			title_no -- 직책번호
		);

-- 우편번호
CREATE TABLE yi_java3st_3team.zip_code (
	zip_code          INTEGER     NOT NULL COMMENT '우편번호', -- 우편번호
	ctprvn            VARCHAR(10) NOT NULL COMMENT '시도', -- 시도
	signgu            VARCHAR(10) NOT NULL COMMENT '시군구', -- 시군구
	road_name         VARCHAR(10) NOT NULL COMMENT '도로명', -- 도로명
	buld_no_origin_no INTEGER     NULL     COMMENT '건물번호본번', -- 건물번호본번
	buld_no_vice_no   INTEGER     NULL     COMMENT '건물번호부번' -- 건물번호부번
)
COMMENT '우편번호';

-- 대여/반납
ALTER TABLE yi_java3st_3team.lending
	ADD CONSTRAINT FK_book_TO_lending -- 도서 -> 대여/반납
		FOREIGN KEY (
			book_cd -- 도서코드
		)
		REFERENCES yi_java3st_3team.book ( -- 도서
			book_code -- 도서코드
		),
	ADD INDEX FK_book_TO_lending (
		book_cd ASC -- 도서코드
	);

-- 대여/반납
ALTER TABLE yi_java3st_3team.lending
	ADD CONSTRAINT FK_member_TO_lending -- 회원 -> 대여/반납
		FOREIGN KEY (
			mber_id -- 회원ID
		)
		REFERENCES yi_java3st_3team.member ( -- 회원
			mber_id -- 회원ID
		);

-- 회원
ALTER TABLE yi_java3st_3team.member
	ADD CONSTRAINT FK_grade_TO_member -- 회원등급 -> 회원
		FOREIGN KEY (
			grade -- 등급
		)
		REFERENCES yi_java3st_3team.grade ( -- 회원등급
			grade_no -- 등급번호
		);

-- 추천도서
ALTER TABLE yi_java3st_3team.recommendation
	ADD CONSTRAINT FK_book_TO_recommendation -- 도서 -> 추천도서
		FOREIGN KEY (
			book_code -- 도서코드
		)
		REFERENCES yi_java3st_3team.book ( -- 도서
			book_code -- 도서코드
		);

-- 신청도서
ALTER TABLE yi_java3st_3team.request_book
	ADD CONSTRAINT FK_member_TO_request_book -- 회원 -> 신청도서
		FOREIGN KEY (
			reqst_mb_id -- 신청회원ID
		)
		REFERENCES yi_java3st_3team.member ( -- 회원
			mber_id -- 회원ID
		);
		
	
-- user 추가
drop user if exists 'java3st'@'localhost';
grant all privileges on yi_java3st_3team.* to 'java3st'@'localhost' identified by 'rootroot';
flush privileges;