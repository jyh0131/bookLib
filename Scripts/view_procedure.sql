-- 도서 전체 검색 view
DROP VIEW IF EXISTS vw_book;
create view vw_book as 
	select b1.book_code , b1.book_name, b1.authr_name , b1.trnslr_name , b1.pls, p.pls_name , b1.pblicte_year ,
	   b1.book_price , b2.book_cnt, b1.lend_psb_cdt , b1.total_le_cnt , b1.book_img , b1.lc_no, l.lclas_name , b1.ml_no, m.mlsfc_name,
	   b1.regist_date , b1.dsuse_cdt, b1.book_img_path 
	from book b1 
		left join publishing_company p on b1.pls = p.pls_no left join large_classification l on b1.lc_no = l.lclas_no 
		left join middle_classification m on m.mlsfc_no = b1.ml_no and l.lclas_no = m.lclas_no,
		(select book_name, authr_name , pls, pblicte_year , book_price , count(*) as book_cnt from book group by book_name, authr_name , pls, pblicte_year , book_price) b2
	where b1.book_name = b2.book_name and b1.authr_name = b2.authr_name and b1.pls = b2.pls and b1.pblicte_year = b2.pblicte_year and 
			b1.book_price = b2.book_price;
	
-- order by b1.book_code ;
	
-- 신청도서 전체검색 view
DROP VIEW IF EXISTS vw_request_book;
create view vw_request_book as 
select reqst_book_no , rb1.reqst_book_name , reqst_book_author , reqst_book_trnslr , request_book_pls , 
	reqst_mb_id , reqst_date , wh_cdt , rb2.cnt
	from request_book rb1, 
		(select reqst_book_name , count(*) as cnt from request_book group by reqst_book_name) rb2
	where rb1.reqst_book_name = rb2.reqst_book_name
	group by rb1.reqst_book_name
	order by reqst_date;

-- 신청도서 검색 (회원용)
DROP VIEW IF EXISTS vw_request_book_member;
create view vw_request_book_member as 
select reqst_book_no , rb1.reqst_book_name , reqst_book_author , reqst_book_trnslr , request_book_pls , 
	reqst_mb_id , reqst_date , wh_cdt , rb2.cnt
	from request_book rb1, 
		(select reqst_book_name , count(*) as cnt from request_book group by reqst_book_name) rb2
	where rb1.reqst_book_name = rb2.reqst_book_name;


	
-- 대여 프로시저(회원 아이디, 도서코드)
drop procedure if exists rent_book;

delimiter $$
$$
create procedure rent_book(in _mber_id varchar(30), in _book_cd varchar(20))

begin
	declare continue handler for sqlexception
	begin
		select '오류 발생했습니다.';
		rollback;
	end;
	set AUTOCOMMIT = 0;
	start transaction;
		-- 회원 테이블에 총대여권수, 대여도서권수가 대여한 숫자만큼  증가시키는 업데이트
		update member
			set total_le_cnt = total_le_cnt + 1, lend_book_cnt = lend_book_cnt +1
			where mber_id = _mber_id;
			
		-- 도서 테이블에 대여가능여부, 총대여횟수가 1로 바뀌고 , 1이 증가하여야 한다
		update book 
			set lend_psb_cdt = 1, total_le_cnt = total_le_cnt +1
			where book_code = _book_cd;
	
		-- 대여반납 테이블에 대여 도서정보가 등록
		INSERT INTO lending
		(mber_id, book_cd, lend_date, rturn_due_date, rturn_psm_cdt, rturn_date, overdue_cdt)
		VALUES(_mber_id, _book_cd, curdate(), ADDDATE(curdate(), 15), 0, null, 0);
	
	commit;
	set AUTOCOMMIT = 1;
end $$

delimiter ;








/*-- 반납 프로시저 테스트(회원 아이디, 도서 코드)
drop procedure if exists update_lending_return_date_overdue_cdt;

delimiter $$
$$
create procedure update_lending_return_date_overdue_cdt(in _mber_id varchar(30), in _book_cd varchar(20))

begin
	declare continue handler for sqlexception
	begin
		select '오류 발생했습니다.';
		rollback;
	end;
	set AUTOCOMMIT = 0;
	start transaction;
-- 대여반납 테이블
-- 반납일 수정 쿼리문(특정 회원의 특정 도서 반납일을 오늘로 수정)
		update lending
			set rturn_date = curdate()
			where mber_id = _mber_id and book_cd = _book_cd;
-- 반납일과 반납예정일의 차이가 0이상 일시 연체 여부를 연체로 수정
		update lending
			set overdue_cdt = 1
			where mber_id = _mber_id and book_cd = _book_cd and DATEDIFF(rturn_date , rturn_due_date) > 0;
	commit;
	set AUTOCOMMIT = 1;
end $$

delimiter ;


-- 반납 프로시저 테스트2(회원 아이디, 도서 코드)
drop procedure if exists update_lending_lend_psb_cdt_lend_book_cnt_book_lend_psb_cdt;

delimiter $$
$$
create procedure update_lending_lend_psb_cdt_lend_book_cnt_book_lend_psb_cdt(in _mber_id varchar(30))

begin
	declare cnt int;
	declare continue handler for sqlexception
	begin
		select '오류 발생했습니다.';
		rollback;
	end;
	set AUTOCOMMIT = 0;
	start transaction;
		-- 회원 테이블
		-- 특정 회원의 대여가능 여부를 연체횟수에 따라 수정
		update member
			set lend_psb_cdt =1
			where mber_id = _mber_id and od_cnt >4;
		-- 특정 회원의 반납되지 않은 도서의 갯수를 변수에 담음
		select count(*) into cnt
			from lending
			where mber_id = _mber_id and rturn_date is null;
		-- 담은 변수의 값을 특정 회원의 대여가능 권수의 값으로 넣음
		update member
			set lend_book_cnt = cnt
			where mber_id = _mber_id;
		-- 도서 테이블
		-- 도서의 대여 가능 여부를 수정
		update book b join lending l
			on b.book_code = l.book_cd
			set lend_psb_cdt = 0
			where l.rturn_date is not null;
	commit;
	set AUTOCOMMIT = 1;
end $$

delimiter ;*/

-- 반납 프로시저 테스트(회원 아이디, 도서코드)
drop procedure if exists return_book;

delimiter $$
$$
create procedure return_book(in _mber_id varchar(30), in _book_cd varchar(20))

begin
	declare cnt int;
	declare continue handler for sqlexception
	begin
		select '오류 발생했습니다.';
		rollback;
	end;
	set AUTOCOMMIT = 0;
	start transaction;
		-- 대여반납 테이블
		-- 연체도서의 갯수를 카운트 후 변수에 입력
		select count(*) into cnt
			from lending
			where overdue_cdt = 0  and rturn_date is null and mber_id = _mber_id and book_cd = _book_cd and DATEDIFF(curdate() , rturn_due_date ) > 0;
		-- 반납대여 테이블
		-- 반납대여 테이블에서 반납일의 null값을 반납날짜로 업데이트
		update lending 
			set rturn_date = date_format(curdate(), "%Y-%m-%d")
			where rturn_date is null and mber_id = _mber_id and book_cd = _book_cd;			
		-- 반납대여 테이블에서 반납일이 반납예정일보다 늦다는 조건에 부합할시  연체여부의 값을 연체로 업데이트, 
		-- 반납일이 반납예정일과 같거나 빠를시는 적용 x 
		update lending
			set overdue_cdt = 1
			where DATEDIFF(rturn_date, rturn_due_date ) > 0 and mber_id = _mber_id and book_cd = _book_cd;
		-- 도서 테이블
		/* 반납이 이루어졌을 경우 책 테이블의 대여가능유무를 대여가능으로 업데이트 */
		update lending l left join book b 
			on l.book_cd = b.book_code
			set lend_psb_cdt = 0
			where l.rturn_date is not null;
		-- 회원 테이블
		-- 회원 테이블의 특정 회원의 대여도서권수(=대여반납 테이블에 반납일이 없는 행의 수)를 감소시키기() 위한 업데이트
		update member
			set lend_book_cnt = lend_book_cnt -1
			where mber_id = _mber_id;
		-- 연체 도서 카운팅한 수를 연체횟수에 입력
		update member
			set od_cnt = od_cnt + cnt
			where mber_id = _mber_id; 
		-- 회원 테이블의 연체횟수가 5회 이상일시 대여가능여부를 업데이트 
		update member
			set lend_psb_cdt = 1
			where od_cnt>4;
	commit;
	set AUTOCOMMIT = 1;
end $$

delimiter ;