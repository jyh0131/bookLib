select*
from librarian;

select*
from member;

select lb_id, lb_pass, lb_name, lb_birthday, lb_zip, lb_bass_ad, lb_detail_ad, lb_tel, title, lb_img_path
from librarian
where lb_id='dong@book.ff.kr';

select lb_id, lb_pass, lb_name, lb_birthday, lb_zip, lb_bass_ad, lb_detail_ad, lb_tel, lb_img, title, join_date, work_cdt, lb_img_path from librarian where lb_id = 'dong@book.ff.kr';