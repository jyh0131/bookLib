package com.yi.model;

public class Recommendation {
	private int recomBookNo;
	private Book bookCode;
	private String bookCont;

	public Recommendation() {}
	
	public Recommendation(int recomBookNo) {
		this.recomBookNo = recomBookNo;
	}
	
	public Recommendation(Book bookCode) {
		this.bookCode = bookCode;
	}

	public Recommendation(Book bookCode, String bookCont) {
		this.bookCode = bookCode;
		this.bookCont = bookCont;
	}

	public Recommendation(int recomBookNo, Book bookCode, String bookCont) {
		this.recomBookNo = recomBookNo;
		this.bookCode = bookCode;
		this.bookCont = bookCont;
	}

	public int getRecomBookNo() {
		return recomBookNo;
	}

	public void setRecomBookNo(int recomBookNo) {
		this.recomBookNo = recomBookNo;
	}

	public Book getBookCode() {
		return bookCode;
	}

	public void setBookCode(Book bookCode) {
		this.bookCode = bookCode;
	}

	public String getBookCont() {
		return bookCont;
	}

	public void setBookCont(String bookCont) {
		this.bookCont = bookCont;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bookCode == null) ? 0 : bookCode.hashCode());
		result = prime * result + ((bookCont == null) ? 0 : bookCont.hashCode());
		result = prime * result + recomBookNo;
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
		Recommendation other = (Recommendation) obj;
		if (bookCode == null) {
			if (other.bookCode != null)
				return false;
		} else if (!bookCode.equals(other.bookCode))
			return false;
		if (bookCont == null) {
			if (other.bookCont != null)
				return false;
		} else if (!bookCont.equals(other.bookCont))
			return false;
		if (recomBookNo != other.recomBookNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("Recommendation [recomBookNo=%s, bookCode=%s, bookCont=%s]", recomBookNo, bookCode,
				bookCont);
	}

}
