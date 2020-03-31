package com.yi.model;

import java.util.Date;

public class Lending {
	private int lendRturnNo;
	private Member mberId;
	private Book bookCd;
	private Date lendDate;
	private Date rturnDueDate;
	private int rturnPsmCdt;
	private Date rturnDate;
	private int overdueCdt;
	private int overdueBookCnt;

	public Lending() {
	}

	public Lending(int lendRturnNo) {
		super();
		this.lendRturnNo = lendRturnNo;
	}

	public Lending(Member mberId) {
		this.mberId = mberId;
	}

	public Lending(Book bookCd) {
		this.bookCd = bookCd;
	}

	public Lending(Member mberId, Book bookCd, Date lendDate, Date rturnDueDate) {
		this.mberId = mberId;
		this.bookCd = bookCd;
		this.lendDate = lendDate;
		this.rturnDueDate = rturnDueDate;
	}

	public Lending(Member mberId, Book bookCd, Date lendDate, Date rturnDueDate, int overdueBookCnt) {
		super();
		this.mberId = mberId;
		this.bookCd = bookCd;
		this.lendDate = lendDate;
		this.rturnDueDate = rturnDueDate;
		this.overdueBookCnt = overdueBookCnt;
	}

	public Lending(Member mberId, Book bookCd, Date lendDate, Date rturnDueDate, Date rturnDate, int overdueCdt) {
		this.mberId = mberId;
		this.bookCd = bookCd;
		this.lendDate = lendDate;
		this.rturnDueDate = rturnDueDate;
		this.rturnDate = rturnDate;
		this.overdueCdt = overdueCdt;
	}

	public Lending(Member mberId, Book bookCd, Date lendDate, Date rturnDueDate, int rturnPsmCdt, Date rturnDate,
			int overdueCdt) {
		this.mberId = mberId;
		this.bookCd = bookCd;
		this.lendDate = lendDate;
		this.rturnDueDate = rturnDueDate;
		this.rturnPsmCdt = rturnPsmCdt;
		this.rturnDate = rturnDate;
		this.overdueCdt = overdueCdt;
	}

	public Lending(int lendRturnNo, Member mberId, Book bookCd, Date lendDate, Date rturnDueDate, int rturnPsmCdt,
			Date rturnDate, int overdueCdt) {
		super();
		this.lendRturnNo = lendRturnNo;
		this.mberId = mberId;
		this.bookCd = bookCd;
		this.lendDate = lendDate;
		this.rturnDueDate = rturnDueDate;
		this.rturnPsmCdt = rturnPsmCdt;
		this.rturnDate = rturnDate;
		this.overdueCdt = overdueCdt;
	}

	public int getLendRturnNo() {
		return lendRturnNo;
	}

	public void setLendRturnNo(int lendRturnNo) {
		this.lendRturnNo = lendRturnNo;
	}

	public Member getMberId() {
		return mberId;
	}

	public void setMberId(Member mberId) {
		this.mberId = mberId;
	}

	public Book getBookCd() {
		return bookCd;
	}

	public void setBookCd(Book bookCd) {
		this.bookCd = bookCd;
	}

	public Date getLendDate() {
		return lendDate;
	}

	public void setLendDate(Date lendDate) {
		this.lendDate = lendDate;
	}

	public Date getRturnDueDate() {
		return rturnDueDate;
	}

	public void setRturnDueDate(Date rturnDueDate) {
		this.rturnDueDate = rturnDueDate;
	}

	public int getRturnPsmCdt() {
		return rturnPsmCdt;
	}

	public void setRturnPsmCdt(int rturnPsmCdt) {
		this.rturnPsmCdt = rturnPsmCdt;
	}

	public Date getRturnDate() {
		return rturnDate;
	}

	public void setRturnDate(Date rturnDate) {
		this.rturnDate = rturnDate;
	}

	public int getOverdueCdt() {
		return overdueCdt;
	}

	public void setOverdueCdt(int overdueCdt) {
		this.overdueCdt = overdueCdt;
	}

	public int getOverdueBookCnt() {
		return overdueBookCnt;
	}

	public void setOverdueBookCnt(int overdueBookCnt) {
		this.overdueBookCnt = overdueBookCnt;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bookCd == null) ? 0 : bookCd.hashCode());
		result = prime * result + ((lendDate == null) ? 0 : lendDate.hashCode());
		result = prime * result + lendRturnNo;
		result = prime * result + ((mberId == null) ? 0 : mberId.hashCode());
		result = prime * result + overdueBookCnt;
		result = prime * result + overdueCdt;
		result = prime * result + ((rturnDate == null) ? 0 : rturnDate.hashCode());
		result = prime * result + ((rturnDueDate == null) ? 0 : rturnDueDate.hashCode());
		result = prime * result + rturnPsmCdt;
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
		Lending other = (Lending) obj;
		if (bookCd == null) {
			if (other.bookCd != null)
				return false;
		} else if (!bookCd.equals(other.bookCd))
			return false;
		if (lendDate == null) {
			if (other.lendDate != null)
				return false;
		} else if (!lendDate.equals(other.lendDate))
			return false;
		if (lendRturnNo != other.lendRturnNo)
			return false;
		if (mberId == null) {
			if (other.mberId != null)
				return false;
		} else if (!mberId.equals(other.mberId))
			return false;
		if (overdueBookCnt != other.overdueBookCnt)
			return false;
		if (overdueCdt != other.overdueCdt)
			return false;
		if (rturnDate == null) {
			if (other.rturnDate != null)
				return false;
		} else if (!rturnDate.equals(other.rturnDate))
			return false;
		if (rturnDueDate == null) {
			if (other.rturnDueDate != null)
				return false;
		} else if (!rturnDueDate.equals(other.rturnDueDate))
			return false;
		if (rturnPsmCdt != other.rturnPsmCdt)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format(
				"Lending [lendRturnNo=%s, mberId=%s, bookCd=%s, lendDate=%s, rturnDueDate=%s, rturnPsmCdt=%s, rturnDate=%s, overdueCdt=%s, overdueBookCnt=%s]",
				lendRturnNo, mberId, bookCd, lendDate, rturnDueDate, rturnPsmCdt, rturnDate, overdueCdt,
				overdueBookCnt);
	}

}
