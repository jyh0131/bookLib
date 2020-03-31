package com.yi.model;

public class MiddleClassification {
	private LargeClassification lclasNo;
	private int mlsfcNo;
	private String mlsfcName;

	public MiddleClassification() {
	}
	
	public MiddleClassification(int mlsfcNo) {
		this.mlsfcNo = mlsfcNo;
	}

	public MiddleClassification(LargeClassification lclasNo, int mlsfcNo) {
		this.lclasNo = lclasNo;
		this.mlsfcNo = mlsfcNo;
	}
	
	public MiddleClassification(int mlsfcNo, String mlsfcName) {
		this.mlsfcNo = mlsfcNo;
		this.mlsfcName = mlsfcName;
	}

	public MiddleClassification(LargeClassification lclasNo, int mlsfcNo, String mlsfcName) {
		this.lclasNo = lclasNo;
		this.mlsfcNo = mlsfcNo;
		this.mlsfcName = mlsfcName;
	}

	public LargeClassification getLclasNo() {
		return lclasNo;
	}

	public void setLclasNo(LargeClassification lclasNo) {
		this.lclasNo = lclasNo;
	}

	public int getMlsfcNo() {
		return mlsfcNo;
	}

	public void setMlsfcNo(int mlsfcNo) {
		this.mlsfcNo = mlsfcNo;
	}

	public String getMlsfcName() {
		return mlsfcName;
	}

	public void setMlsfcName(String mlsfcName) {
		this.mlsfcName = mlsfcName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((lclasNo == null) ? 0 : lclasNo.hashCode());
		result = prime * result + ((mlsfcName == null) ? 0 : mlsfcName.hashCode());
		result = prime * result + mlsfcNo;
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
		MiddleClassification other = (MiddleClassification) obj;
		if (lclasNo == null) {
			if (other.lclasNo != null)
				return false;
		} else if (!lclasNo.equals(other.lclasNo))
			return false;
		if (mlsfcName == null) {
			if (other.mlsfcName != null)
				return false;
		} else if (!mlsfcName.equals(other.mlsfcName))
			return false;
		if (mlsfcNo != other.mlsfcNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("[%02d] %s", mlsfcNo, mlsfcName);
	}

}
