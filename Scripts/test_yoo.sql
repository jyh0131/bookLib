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