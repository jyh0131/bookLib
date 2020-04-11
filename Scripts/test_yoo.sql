select user(), database();

select * from book where book_code like '0901.051%';

select * from vw_book group by book_name order by pblicte_year desc limit 10;

-- 도서
select b1.book_code , b1.book_name, b1.authr_name , b1.trnslr_name , b1.pls, p.pls_name , b1.pblicte_year ,
	   b1.book_price , b2.book_cnt, b1.lend_psb_cdt , b1.total_le_cnt , b1.book_img , b1.lc_no, l.lclas_name , b1.ml_no, m.mlsfc_name,
	   b1.regist_date , b1.dsuse_cdt, b1.book_img_path 
	from book b1 
		left join publishing_company p on b1.pls = p.pls_no left join large_classification l on b1.lc_no = l.lclas_no 
		left join middle_classification m on m.mlsfc_no = b1.ml_no and l.lclas_no = m.lclas_no,
		(select book_name, authr_name , pls, pblicte_year , book_price , count(*) as book_cnt from book group by book_name, authr_name , pls, pblicte_year , book_price) b2
	where b1.book_name = b2.book_name and b1.authr_name = b2.authr_name and b1.pls = b2.pls and b1.pblicte_year = b2.pblicte_year and 
			b1.book_price = b2.book_price and b1.book_code = '0601.017-1';
	order by b1.book_code ;
	
select b1.book_code , b1.book_name, b1.authr_name , b1.trnslr_name , b1.pls, p.pls_name , b1.pblicte_year ,
		b1.book_price , b2.book_cnt, b1.lend_psb_cdt , b1.total_le_cnt , b1.book_img , b1.lc_no, l.lclas_name , b1.ml_no , m.mlsfc_name ,
		b1.regist_date , b1.dsuse_cdt, b1.book_img_path 
	from book b1 
		left join publishing_company p on b1.pls = p.pls_no left join large_classification l on b1.lc_no = l.lclas_no 
		left join middle_classification m on m.mlsfc_no = b1.ml_no and l.lclas_no = m.lclas_no, 
		(select book_name, authr_name , pls, pblicte_year , book_price , count(*) as book_cnt from book group by book_name, authr_name , pls, pblicte_year , book_price) b2 
	where b1.book_name = b2.book_name and b1.authr_name = b2.authr_name and b1.pls = b2.pls and b1.pblicte_year = b2.pblicte_year and b1.book_price = b2.book_price 
		and b1.book_code = '0402.007-1'
	order by b1.book_code ;
	
select * from vw_book order by book_code;

-- 추천도서 
select r.recom_book_no , r.book_code , r.book_cont , lc.lclas_no , lc.lclas_name , ml.mlsfc_no , ml.mlsfc_name , b.authr_name , b.trnslr_name , b.book_name , pls.pls_no , 
		pls.pls_name , b.book_img_path, b.pblicte_year 
	from recommendation r join book b on b.book_code = r.book_code  
						  join large_classification lc on b.lc_no = lc.lclas_no 
						  join middle_classification ml on b.ml_no = ml.mlsfc_no and b.lc_no = ml.lclas_no 
						  join publishing_company pls on b.pls = pls.pls_no 
	order by r.recom_book_no;
	

-- 출판사 관리
select pls_no, pls_name from publishing_company where pls_name = '창';

-- 대분류에 따른 중분류 갯수
select count(*) from middle_classification where lclas_no = 3 group by lclas_no ;

select lc.lclas_no, lc.lclas_name , ml.mlsfc_no , ml.mlsfc_name from middle_classification ml join large_classification lc on ml.lclas_no = lc.lclas_no where ml.lclas_no = 1;

select * from large_classification l join middle_classification m on l.lclas_no = m.lclas_no where l.lclas_no = 1;
select * from large_classification where lclas_no = 01;


select count(b.book_code) as 'duringLendBooks' from book b left join lending l on b.book_code = l.book_cd where b.lend_psb_cdt = 1 and DATEDFF(curdate(), l.rturn_due_date)>0;


select * from middle_classification;
delete from middle_classification where mlsfc_no = 3 and mlsfc_name = 'test23' and lclas_no = 10;

select count(ml.mlsfc_no) 
from large_classification lc left join middle_classification ml on lc.lclas_no = ml.lclas_no 
where lc.lclas_no = 111;



select mber_id, mber_pass, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img, total_le_cnt, lend_book_cnt, grade, grad_name, book_le_cnt, lend_psb_cdt, join_dt, wdr_cdt,od_cnt from member m left join grade g on m.grade = g.grade_no where mber_id ='7susdmlqka';

select mber_id, mber_pass, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img, mber_img_path, total_le_cnt, lend_book_cnt, grade, grad_name, book_le_cnt, lend_psb_cdt, join_dt, wdr_cdt,od_cnt from member m left join grade g on m.grade = g.grade_no where mber_id = '7susdmlqka';


select mber_id, mber_name, mber_pass, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img_path
from member
where mber_id = '7susdmlqka';

-- 신청도서
select reqst_book_no, reqst_book_name, reqst_book_author, reqst_book_trnslr, request_book_pls, reqst_date, wh_cdt, cnt 
from vw_request_book 
order by reqst_book_no;

select reqst_book_no, reqst_book_name, reqst_book_author, reqst_book_trnslr, request_book_pls, reqst_mb_id, reqst_date, wh_cdt, cnt 
from vw_request_book
where year(reqst_date) = '2020' and month(reqst_date) = '4' and wh_cdt = 0;

select mber_id, mber_pass, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, 
mber_img, mber_img_path, total_le_cnt, lend_book_cnt, grade, grad_name, book_le_cnt, lend_psb_cdt, 
join_dt, wdr_cdt,od_cnt 
from member m left join grade g on m.grade = g.grade_no 
where mber_id = 'jojo123@naver.com';

select l.lend_rturn_no , l.mber_id , b.book_code, b.book_name , b.authr_name , b.trnslr_name, b.lc_no , lc.lclas_name , b.ml_no , ml.mlsfc_name , 
		b.pls, pls.pls_name , b.pblicte_year , lend_date , rturn_due_date, rturn_psm_cdt, rturn_date, overdue_cdt 
	from lending l left join book b on l.book_cd = b.book_code 
				left join large_classification lc on lc.lclas_no = b.lc_no 
				left join middle_classification ml on ml.mlsfc_no = b.ml_no and lc.lclas_no = ml.lclas_no 
				left join publishing_company pls on pls.pls_no = b.pls 
	where mber_id = 'jojo123@naver.com' and rturn_date is null 
	order by lend_date desc;

select lend_rturn_no , mber_id , book_cd , lend_date , rturn_due_date , rturn_psm_cdt , rturn_date , overdue_cdt 
	from lending 
	where lend_rturn_no = 54;
	
select * from lending where lend_rturn_no = 56;

update lending set rturn_due_date = '2020.04.16' where lend_rturn_no = 56;


select pblicte_year, book_name , book_img_path , authr_name , trnslr_name , b.lc_no , l.lclas_name , b.ml_no , m.mlsfc_name , b.pls , p.pls_name 
	from book b left join large_classification l on b.lc_no = l.lclas_no 
				left join middle_classification m on b.ml_no = m.mlsfc_no and l.lclas_no = m.lclas_no 
				left join publishing_company p on b.pls = p.pls_no 
	group by book_name
	order by pblicte_year desc limit 10;
	
select l1.book_cd , b.book_name, b.book_img_path , b.authr_name , b.trnslr_name , b.lc_no , lc.lclas_name , b.ml_no , ml.mlsfc_name , 
		b.pls , p.pls_name ,l2.totlaCnt, b2.book_cnt , b.pblicte_year 
	from lending l1 left join book b on l1.book_cd = b.book_code 
					left join large_classification lc on b.lc_no = lc.lclas_no 
					left join middle_classification ml on b.ml_no = ml.mlsfc_no and lc.lclas_no = ml.lclas_no
					left join publishing_company p on b.pls = p.pls_no ,
					(select book_cd , count(*) as totlaCnt from lending group by book_cd) l2,
					(select book_name, authr_name , pls, pblicte_year , book_price , count(*) as book_cnt from book group by book_name, authr_name , pls, pblicte_year , book_price) b2
	where l1.book_cd = l2.book_cd and b.book_name = b2.book_name and b.authr_name = b2.authr_name and b.pls = b2.pls and b.pblicte_year = b2.pblicte_year and 
			b.book_price = b2.book_price
	group by l1.book_cd
	order by l2.totlaCnt desc limit 10;
	
select * from vw_book where book_name = '설이';

select * from `member` m;

insert into `member`(mber_id , mber_pass , mber_name , mber_brthdy , mber_zip , mber_tel , join_dt ) 
values ('yoogj0513@naver.com', '123', '유경진', '1989-05-13', '11111', '000-0000-0000', now());

select * from `member` m where mber_name ='유경진';