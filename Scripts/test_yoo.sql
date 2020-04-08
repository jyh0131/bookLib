select user(), database();

select * from book where book_code like '0901.051%';

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


