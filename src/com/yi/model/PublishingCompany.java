package com.yi.model;

public class PublishingCompany {
	private int plsNo;
	private String plsName;

	public PublishingCompany() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PublishingCompany(int plsNo) {
		super();
		this.plsNo = plsNo;
	}

	public PublishingCompany(String plsName) {
		this.plsName = plsName;
	}

	public PublishingCompany(int plsNo, String plsName) {
		super();
		this.plsNo = plsNo;
		this.plsName = plsName;
	}

	public int getPlsNo() {
		return plsNo;
	}

	public void setPlsNo(int plsNo) {
		this.plsNo = plsNo;
	}

	public String getPlsName() {
		return plsName;
	}

	public void setPlsName(String plsName) {
		this.plsName = plsName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((plsName == null) ? 0 : plsName.hashCode());
		result = prime * result + plsNo;
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
		PublishingCompany other = (PublishingCompany) obj;
		if (plsName == null) {
			if (other.plsName != null)
				return false;
		} else if (!plsName.equals(other.plsName))
			return false;
		if (plsNo != other.plsNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("[%02d] %s", plsNo, plsName);
	}

}
