package com.yi.model;

import java.util.Arrays;
import java.util.Date;

public class Book {
	private String bookCode;
	private String bookName;
	private String authrName;
	private String trnslrName;
	private PublishingCompany pls;
	private Date pblicteYear;
	private int bookPrice;
	private int bookCnt;
	private int lendPsbCdt;
	private int totalLeCnt;
	private byte[] bookImg;
	private LargeClassification lcNo;
	private MiddleClassification mlNo;
	private Date registDate;
	private int dsuseCdt;
	private String bookImgPath;

	public Book() {
	}

	public Book(String bookCode) {
		this.bookCode = bookCode;
	}

	public Book(String bookName, Date registDate) {
		super();
		this.bookName = bookName;
		this.registDate = registDate;
	}

	public Book(String bookCode, String bookName, String authrName, PublishingCompany pls, Date pblicteYear) {
		super();
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.authrName = authrName;
		this.pls = pls;
		this.pblicteYear = pblicteYear;
	}

	public Book(String bookName, String authrName, String trnslrName, PublishingCompany pls, byte[] bookImg,
			LargeClassification lcNo, MiddleClassification mlNo) {
		this.bookName = bookName;
		this.authrName = authrName;
		this.trnslrName = trnslrName;
		this.pls = pls;
		this.bookImg = bookImg;
		this.lcNo = lcNo;
		this.mlNo = mlNo;
	}

	public Book(String bookCode, String bookName, String authrName, String trnslrName, PublishingCompany pls,
			Date pblicteYear, int bookPrice, int lendPsbCdt, byte[] bookImg, LargeClassification lcNo,
			MiddleClassification mlNo) {
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.authrName = authrName;
		this.trnslrName = trnslrName;
		this.pls = pls;
		this.pblicteYear = pblicteYear;
		this.bookPrice = bookPrice;
		this.lendPsbCdt = lendPsbCdt;
		this.bookImg = bookImg;
		this.lcNo = lcNo;
		this.mlNo = mlNo;
	}

	public Book(String bookCode, String bookName, String authrName, String trnslrName, PublishingCompany pls,
			Date pblicteYear, int bookPrice, int lendPsbCdt, int totalLeCnt, LargeClassification lcNo,
			MiddleClassification mlNo, Date registDate, int dsuseCdt) {
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.authrName = authrName;
		this.trnslrName = trnslrName;
		this.pls = pls;
		this.pblicteYear = pblicteYear;
		this.bookPrice = bookPrice;
		this.lendPsbCdt = lendPsbCdt;
		this.totalLeCnt = totalLeCnt;
		this.lcNo = lcNo;
		this.mlNo = mlNo;
		this.registDate = registDate;
		this.dsuseCdt = dsuseCdt;
	}

	public Book(String bookCode, String bookName, String authrName, String trnslrName, PublishingCompany pls,
			Date pblicteYear, int bookPrice, int bookCnt, int lendPsbCdt, int totalLeCnt, LargeClassification lcNo,
			MiddleClassification mlNo, Date registDate, int dsuseCdt) {
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.authrName = authrName;
		this.trnslrName = trnslrName;
		this.pls = pls;
		this.pblicteYear = pblicteYear;
		this.bookPrice = bookPrice;
		this.bookCnt = bookCnt;
		this.lendPsbCdt = lendPsbCdt;
		this.totalLeCnt = totalLeCnt;
		this.lcNo = lcNo;
		this.mlNo = mlNo;
		this.registDate = registDate;
		this.dsuseCdt = dsuseCdt;
	}

	public Book(String bookCode, String bookName, String authrName, String trnslrName, PublishingCompany pls,
			Date pblicteYear, int bookPrice, int lendPsbCdt, int totalLeCnt, byte[] bookImg, LargeClassification lcNo,
			MiddleClassification mlNo, Date registDate, int dsuseCdt) {
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.authrName = authrName;
		this.trnslrName = trnslrName;
		this.pls = pls;
		this.pblicteYear = pblicteYear;
		this.bookPrice = bookPrice;
		this.lendPsbCdt = lendPsbCdt;
		this.totalLeCnt = totalLeCnt;
		this.bookImg = bookImg;
		this.lcNo = lcNo;
		this.mlNo = mlNo;
		this.registDate = registDate;
		this.dsuseCdt = dsuseCdt;
	}

	public Book(String bookCode, String bookName, String authrName, String trnslrName, PublishingCompany pls,
			Date pblicteYear, int bookPrice, int bookCnt, int lendPsbCdt, int totalLeCnt, byte[] bookImg,
			LargeClassification lcNo, MiddleClassification mlNo, Date registDate, int dsuseCdt) {
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.authrName = authrName;
		this.trnslrName = trnslrName;
		this.pls = pls;
		this.pblicteYear = pblicteYear;
		this.bookPrice = bookPrice;
		this.bookCnt = bookCnt;
		this.lendPsbCdt = lendPsbCdt;
		this.totalLeCnt = totalLeCnt;
		this.bookImg = bookImg;
		this.lcNo = lcNo;
		this.mlNo = mlNo;
		this.registDate = registDate;
		this.dsuseCdt = dsuseCdt;
	}

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthrName() {
		return authrName;
	}

	public void setAuthrName(String authrName) {
		this.authrName = authrName;
	}

	public String getTrnslrName() {
		return trnslrName;
	}

	public void setTrnslrName(String trnslrName) {
		this.trnslrName = trnslrName;
	}

	public PublishingCompany getPls() {
		return pls;
	}

	public void setPls(PublishingCompany pls) {
		this.pls = pls;
	}

	public Date getPblicteYear() {
		return pblicteYear;
	}

	public void setPblicteYear(Date pblicteYear) {
		this.pblicteYear = pblicteYear;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public int getBookCnt() {
		return bookCnt;
	}

	public void setBookCnt(int bookCnt) {
		this.bookCnt = bookCnt;
	}

	public int getLendPsbCdt() {
		return lendPsbCdt;
	}

	public void setLendPsbCdt(int lendPsbCdt) {
		this.lendPsbCdt = lendPsbCdt;
	}

	public int getTotalLeCnt() {
		return totalLeCnt;
	}

	public void setTotalLeCnt(int totalLeCnt) {
		this.totalLeCnt = totalLeCnt;
	}

	public byte[] getBookImg() {
		return bookImg;
	}

	public void setBookImg(byte[] bookImg) {
		this.bookImg = bookImg;
	}

	public LargeClassification getLcNo() {
		return lcNo;
	}

	public void setLcNo(LargeClassification lcNo) {
		this.lcNo = lcNo;
	}

	public MiddleClassification getMlNo() {
		return mlNo;
	}

	public void setMlNo(MiddleClassification mlNo) {
		this.mlNo = mlNo;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public int getDsuseCdt() {
		return dsuseCdt;
	}

	public void setDsuseCdt(int dsuseCdt) {
		this.dsuseCdt = dsuseCdt;
	}
	
	public String getBookImgPath() {
		return bookImgPath;
	}

	public void setBookImgPath(String bookImgPath) {
		this.bookImgPath = bookImgPath;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((authrName == null) ? 0 : authrName.hashCode());
		result = prime * result + bookCnt;
		result = prime * result + ((bookCode == null) ? 0 : bookCode.hashCode());
		result = prime * result + Arrays.hashCode(bookImg);
		result = prime * result + ((bookImgPath == null) ? 0 : bookImgPath.hashCode());
		result = prime * result + ((bookName == null) ? 0 : bookName.hashCode());
		result = prime * result + bookPrice;
		result = prime * result + dsuseCdt;
		result = prime * result + ((lcNo == null) ? 0 : lcNo.hashCode());
		result = prime * result + lendPsbCdt;
		result = prime * result + ((mlNo == null) ? 0 : mlNo.hashCode());
		result = prime * result + ((pblicteYear == null) ? 0 : pblicteYear.hashCode());
		result = prime * result + ((pls == null) ? 0 : pls.hashCode());
		result = prime * result + ((registDate == null) ? 0 : registDate.hashCode());
		result = prime * result + totalLeCnt;
		result = prime * result + ((trnslrName == null) ? 0 : trnslrName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		if (authrName == null) {
			if (other.authrName != null)
				return false;
		} else if (!authrName.equals(other.authrName))
			return false;
		if (bookCnt != other.bookCnt)
			return false;
		if (bookCode == null) {
			if (other.bookCode != null)
				return false;
		} else if (!bookCode.equals(other.bookCode))
			return false;
		if (!Arrays.equals(bookImg, other.bookImg))
			return false;
		if (bookImgPath == null) {
			if (other.bookImgPath != null)
				return false;
		} else if (!bookImgPath.equals(other.bookImgPath))
			return false;
		if (bookName == null) {
			if (other.bookName != null)
				return false;
		} else if (!bookName.equals(other.bookName))
			return false;
		if (bookPrice != other.bookPrice)
			return false;
		if (dsuseCdt != other.dsuseCdt)
			return false;
		if (lcNo == null) {
			if (other.lcNo != null)
				return false;
		} else if (!lcNo.equals(other.lcNo))
			return false;
		if (lendPsbCdt != other.lendPsbCdt)
			return false;
		if (mlNo == null) {
			if (other.mlNo != null)
				return false;
		} else if (!mlNo.equals(other.mlNo))
			return false;
		if (pblicteYear == null) {
			if (other.pblicteYear != null)
				return false;
		} else if (!pblicteYear.equals(other.pblicteYear))
			return false;
		if (pls == null) {
			if (other.pls != null)
				return false;
		} else if (!pls.equals(other.pls))
			return false;
		if (registDate == null) {
			if (other.registDate != null)
				return false;
		} else if (!registDate.equals(other.registDate))
			return false;
		if (totalLeCnt != other.totalLeCnt)
			return false;
		if (trnslrName == null) {
			if (other.trnslrName != null)
				return false;
		} else if (!trnslrName.equals(other.trnslrName))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return String.format(
				"Book [bookCode=%s, bookName=%s, authrName=%s, trnslrName=%s, pls=%s, pblicteYear=%s, bookPrice=%s, bookCnt=%s, lendPsbCdt=%s, totalLeCnt=%s, bookImg=%s, lcNo=%s, mlNo=%s, registDate=%s, dsuseCdt=%s, bookImgPath=%s]",
				bookCode, bookName, authrName, trnslrName, pls, pblicteYear, bookPrice, bookCnt, lendPsbCdt, totalLeCnt,
				bookImg.length, lcNo, mlNo, registDate, dsuseCdt, bookImgPath);
	}

	public String toDebug() {
		return String.format(
				"code: %s, name: %s, authr: %s, trnslr: %s, pls: %s,  pblicteYear: %s, price: %s, cnt: %s, %n"
						+ "lendCdt: %s, totalLeCnt: %s, bookImg: %s, lcNo: %s, mlNo: %s, registDate: %s, dsuseCdt: %s",
				bookCode, bookName, authrName, trnslrName, pls.getPlsName(), pblicteYear, bookPrice, bookCnt,
				lendPsbCdt, totalLeCnt, bookImg, lcNo.getLclasName(), mlNo.getMlsfcName(), registDate, dsuseCdt);
	}
}
