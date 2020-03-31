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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + buldNoOriginNo;
		result = prime * result + buldNoViceNo;
		result = prime * result + ((ctprvn == null) ? 0 : ctprvn.hashCode());
		result = prime * result + ((roadName == null) ? 0 : roadName.hashCode());
		result = prime * result + ((signgu == null) ? 0 : signgu.hashCode());
		result = prime * result + zipCode;
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
		ZipCode other = (ZipCode) obj;
		if (buldNoOriginNo != other.buldNoOriginNo)
			return false;
		if (buldNoViceNo != other.buldNoViceNo)
			return false;
		if (ctprvn == null) {
			if (other.ctprvn != null)
				return false;
		} else if (!ctprvn.equals(other.ctprvn))
			return false;
		if (roadName == null) {
			if (other.roadName != null)
				return false;
		} else if (!roadName.equals(other.roadName))
			return false;
		if (signgu == null) {
			if (other.signgu != null)
				return false;
		} else if (!signgu.equals(other.signgu))
			return false;
		if (zipCode != other.zipCode)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ZipCode [zipCode=" + zipCode + ", ctprvn=" + ctprvn + ", signgu=" + signgu + ", roadName=" + roadName
				+ ", buldNoOriginNo=" + buldNoOriginNo + ", buldNoViceNo=" + buldNoViceNo + "]";
	}


}
