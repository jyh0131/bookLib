package com.yi.model;

public class Grade {
	private int gradeNo;
	private String gradeName;
	private int bookLeCnt;

	public Grade() {
		super();
	}

	public Grade(int gradeNo) {
		super();
		this.gradeNo = gradeNo;
	}


	public Grade(int gradeNo, String gradeName) {
		super();
		this.gradeNo = gradeNo;
	}
	
	public Grade(String gradeName) {
		this.gradeName = gradeName;
	}

	public Grade(int gradeNo, String gradeName, int bookLeCnt) {
		super();
		this.gradeNo = gradeNo;
		this.gradeName = gradeName;
		this.bookLeCnt = bookLeCnt;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getBookLeCnt() {
		return bookLeCnt;
	}

	public void setBookLeCnt(int bookLeCnt) {
		this.bookLeCnt = bookLeCnt;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bookLeCnt;
		result = prime * result + ((gradeName == null) ? 0 : gradeName.hashCode());
		result = prime * result + gradeNo;
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
		Grade other = (Grade) obj;
		if (bookLeCnt != other.bookLeCnt)
			return false;
		if (gradeName == null) {
			if (other.gradeName != null)
				return false;
		} else if (!gradeName.equals(other.gradeName))
			return false;
		if (gradeNo != other.gradeNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("%s", gradeName);
	}

}
