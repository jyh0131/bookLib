package com.yi.dao;

import java.util.List;

import com.yi.model.PublishingCompany;

public interface PublishingCompanyDao {
	PublishingCompany selectPublishingCompanyByNo(PublishingCompany pc);

	List<PublishingCompany> selectPublishingCompanyByAll();
	
	List<PublishingCompany> selectPublishingCompanyByNameAll(String pcName);

	int insertPublishingCompany(PublishingCompany pc);

	int updatePublishingCompany(PublishingCompany pc);

	int deletePublishingCompany(PublishingCompany pc);
	
	int selectLastCode();
}
