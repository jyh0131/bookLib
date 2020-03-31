package com.yi.dao;

import com.yi.model.ZipCode;

public interface ZipCodeDao {
	public abstract ZipCode selectZipCodeByNo(ZipCode zip); //우편번호체크
}
