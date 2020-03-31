package com.yi.model;

public class Title {
	private int titleNo;
	private String titleName;

	public Title() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public Title(String titleName) {
		super();
		this.titleName = titleName;
	}



	public Title(int titleNo) {
		super();
		this.titleNo = titleNo;
	}

	public Title(int titleNo, String titleName) {
		super();
		this.titleNo = titleNo;
		this.titleName = titleName;
	}

	public int getTitleNo() {
		return titleNo;
	}

	public void setTitleNo(int titleNo) {
		this.titleNo = titleNo;
	}

	public String getTitleName() {
		return titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((titleName == null) ? 0 : titleName.hashCode());
		result = prime * result + titleNo;
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
		Title other = (Title) obj;
		if (titleName == null) {
			if (other.titleName != null)
				return false;
		} else if (!titleName.equals(other.titleName))
			return false;
		if (titleNo != other.titleNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("%s [ %d ]", titleName, titleNo);
	}

}
