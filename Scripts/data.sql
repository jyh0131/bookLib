select user(), database ();
use yi_java3st_3team;

-- grade 회원등급
desc grade;
insert into grade values
(1,'일반',5),
(2,'우수',7);


-- member 회원
desc member;
load data local infile 'D:/workspace/workspace_teamJSP/bookLib/WebContent/document/data/member.csv'
into table yi_java3st_3team.member
character set 'utf8'
fields terminated by ','
ignore 1 lines;

select * from `member` m ;

-- request_book 신청도서
desc request_book; 
insert into request_book values
(1, 'jojo123@naver.com', 'Cosmos', '칼 세이건', null, 'Ballantine Books', '2020.02.15', 0),
(2, 'ferw2@naver.com', 'Sapiens', '유발 하라리', null, 'vintage Books', '2020.02.01', 0),
(3, 'ya2354fr@yahoo.com', '먼 바다', '공지영', null, '해냄', '2020.02.01', 0),
(4, 'sdksdl@daum.net', '오늘 밤은 사라지지 말아요', '백수린', null, '마음산책', '2020.02.02', 0),
(5, 'fivestar@nate.com', '파도가 무엇을 가져올지 누가 알겠어', '박향', null, '나무옆의자', '2020.02.03', 0),
(6, 'sam223@naver.com', '마당이 있는 집', '김진영', null, '엘릭시르', '2020.02.04', 0),
(7, 'ddr23dd@naver.com', '태평천하', '채만식', null, '문학과지성사', '2020.02.05', 0),
(8, 'fdfsdasd@naver.com', '단 하나의 문장', '구병모', null, '문학동네', '2020.02.08', 0),
(9, 'ggg243r4@gmail.com', '독의 꽃', '최수철', null, '작가정신', '2020.02.09', 0),
(10, 'xodnjs1218@naver.com', '우리들의 행복한 시간', '공지영', null, '해냄', '2020.02.09', 0);


-- book 도서
desc book;
load data local infile 'D:/workspace/workspace_teamJSP/bookLib/WebContent/document/data/book_data.csv'
into table yi_java3st_3team.book 
character set 'utf8'
fields terminated by ','
ignore 1 lines;


-- lending 대여/반납
-- truncate table lending; -- lending 데이터 전체 삭제
-- select * from lending;
set autocommit = false;
desc lending;
load data local infile 'D:/workspace/workspace_teamJSP/bookLib/WebContent/document/data/lending.csv'
into table yi_java3st_3team.lending 
character set 'utf8'
fields terminated by ','
ignore 1 lines;
set autocommit = true;

-- 반납일 null 처리
update lending 
	set rturn_date = null 
	where rturn_date = 00-00-00;


-- publishing_company 출판사
-- truncate table publishing_company;
desc publishing_company;
load data local infile 'D:/workspace/workspace_teamJSP/bookLib/WebContent/document/data/pls_data.csv'
into table yi_java3st_3team.publishing_company
character set 'utf8'
fields terminated by ','
ignore 1 lines;

-- recommendation 추천도서


-- large_classification 대분류
desc large_classification;
insert into large_classification values
(01, '지식학문'),
(02, '철학'),
(03, '종교'),
(04, '사회과학'),
(05, '자연과학'),
(06, '기술과학'),
(07, '예술'),
(08, '언어'),
(09, '문학'),
(10, '역사');

-- middle_classification 중분류
desc middle_classification ;
insert into middle_classification(mlsfc_no, mlsfc_name, lclas_no) values
(01, '신문', 01),
(02, '백과사전', 01),
(01, '동양철학', 02),
(02, '서양철학', 02),
(01, '비교종교', 03),
(02, '자연종교', 03),
(01, '통계학', 04),
(02, '정치학', 04),
(01, '생명과학', 05),
(02, '천문학', 05),
(01, '기계공학', 06),
(02, '환경공학', 06),
(01, '음악', 07),
(02, '공예', 07),
(01, '국어', 08),
(02, '기타언어', 08),
(01, '한국문학', 09),
(02, '영미문학', 09),
(01, '아시아', 10),
(02, '유럽', 10);

-- title 직책
desc title;
insert into title values
(0,'총관리자'),
(1,'사서');

-- librarian 사서
desc librarian;
load data local infile 'D:/workspace/workspace_teamJSP/bookLib/WebContent/document/data/librarian.csv'
into table yi_java3st_3team.librarian 
character set 'utf8'
fields terminated by ','
ignore 1 lines;

-- zip_code 우편번호
-- truncate table zip_code; -- zip_code 전체 삭제
-- select * from zip_code;
desc zip_code;
load data local infile 'D:/workspace/workspace_teamJSP/bookLib/WebContent/document/data/경북,대구.csv'
into table yi_java3st_3team.zip_code
character set 'utf8'
fields terminated by ','
ignore 1 lines;

-- recommendation 추천도서
desc recommendation;
insert into recommendation(book_code, book_cont) values 
('0901.001-1', '엄마를 뜻하는 ‘맘(Mom)’과 벌레를 뜻하는 ‘충(蟲)’의 합성어인 ‘맘충’은 제 아이만 싸고도는 일부 몰상식한 엄마를 가리키는 용어다. 2014년 말 촉발된 ‘맘충이’ 사건을 목격한 저자는 여성, 특히 육아하는 여성에 대한 사회의 폭력적인 시선에 충격 받아 이 작품을 쓰기 시작했는데, 온라인상에서 사실 관계도 확인되지 않은 상황만 놓고 엄마들을 비하하는 태도에 문제의식을 느낀 저자가 지금 한국을 살아가는 여성들의 삶이 과거에서 얼마나 더 진보했는지, 혹은 그렇지 않은지 질문할 수 있는 이야기를 해보고자 했다.');
