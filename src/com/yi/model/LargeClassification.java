package com.yi.model;

public class LargeClassification {
	private int lclasNo;
	private String lclasName;

	public LargeClassification() {}

	public LargeClassification(int lclasNo) {
		this.lclasNo = lclasNo;
	}
	
	public LargeClassification(String lclasName) {
		this.lclasName = lclasName;
	}

	public LargeClassification(int lclasNo, String lclasName) {
		this.lclasNo = lclasNo;
		this.lclasName = lclasName;
	}

	public int getLclasNo() {
		return lclasNo;
	}

	public void setLclasNo(int lclasNo) {
		this.lclasNo = lclasNo;
	}

	public String getLclasName() {
		return lclasName;
	}

	public void setLclasName(String lclasName) {
		this.lclasName = lclasName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((lclasName == null) ? 0 : lclasName.hashCode());
		result = prime * result + lclasNo;
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
		LargeClassification other = (LargeClassification) obj;
		if (lclasName == null) {
			if (other.lclasName != null)
				return false;
		} else if (!lclasName.equals(other.lclasName))
			return false;
		if (lclasNo != other.lclasNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("[%02d] %s", lclasNo, lclasName);
	}

}
