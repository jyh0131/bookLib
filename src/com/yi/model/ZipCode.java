package com.yi.model;

public class ZipCode {
	private int zipCode;
	private String ctprvn;
	private String signgu;
	private String roadName;
	private int buldNoOriginNo;
	private int buldNoViceNo;

	public ZipCode() {
		super();
	}

	public ZipCode(int zipCode) {
		super();
		this.zipCode = zipCode;
	}

	public ZipCode(String ctprvn, String signgu, String roadName, int buldNoOriginNo, int buldNoViceNo) {
		super();
		this.ctprvn = ctprvn;
		this.signgu = signgu;
		this.roadName = roadName;
		this.buldNoOriginNo = buldNoOriginNo;
		this.buldNoViceNo = buldNoViceNo;
	}

	public ZipCode(int zipCode, String ctprvn, String signgu, String roadName, int buldNoOriginNo, int buldNoViceNo) {
		super();
		this.zipCode = zipCode;
		this.ctprvn = ctprvn;
		this.signgu = signgu;
		this.roadName = roadName;
		this.buldNoOriginNo = buldNoOriginNo;
		this.buldNoViceNo = buldNoViceNo;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getCtprvn() {
		return ctprvn;
	}

	public void setCtprvn(String ctprvn) {
		this.ctprvn = ctprvn;
	}

	public String getSigngu() {
		return signgu;
	}

	public void setSigngu(String signgu) {
		this.signgu = signgu;
	}

	public String getRoadName() {
		return roadName;
	}

	public void setRoadName(String roadName) {
		this.roadName = roadName;
	}

	public int getBuldNoOriginNo() {
		return buldNoOriginNo;
	}

	public void setBuldNoOriginNo(int buldNoOriginNo) {
		this.buldNoOriginNo = buldNoOriginNo;
	}

	public int getBuldNoViceNo() {
		return buldNoViceNo;
	}

	public void setBuldNoViceNo(int buldNoViceNo) {
		this.buldNoViceNo = buldNoViceNo;
	}


		@Override
		public String toString() {
		if(zipCode==0) {
			return "";
		}else {
			return String.format("(%d)", zipCode);
		}			
	}
}
