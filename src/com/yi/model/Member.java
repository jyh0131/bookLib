package com.yi.model;

import java.util.Arrays;
import java.util.Date;

public class Member {
	private String mberId;
	private String mberPass;
	private String mberName;
	private Date mberBrthdy;
	private ZipCode mberZip;
	private String mberBassAd;
	private String mberDetailAd;
	private String mberTel;
	private byte[] mberImg;
	private int totalLeCnt;
	private int lendBookCnt;
	private Grade grade;
	private int lendPsbCdt;
	private Date joinDt;
	private int wdrCdt;
	private int odCnt;
	private String mberBrthStr;
	private String memberImgPath;
	
	
	
	
	public String getMemberImgPath() {
		return memberImgPath;
	}

	public void setMemberImgPath(String memberImgPath) {
		this.memberImgPath = memberImgPath;
	}

	public Member() {
	}

	public Member(String mberId) {
		this.mberId = mberId;
	}
	
	
	


	public Member(String mberId, String mberPass, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel) {
		super();
		this.mberId = mberId;
		this.mberPass = mberPass;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
	}

	public Member(String mberId, String mberPass, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel, byte[] mberImg, int totalLeCnt, int lendBookCnt, Grade grade,
			int lendPsbCdt, Date joinDt, int wdrCdt, int odCnt) {
		super();
		this.mberId = mberId;
		this.mberPass = mberPass;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
		this.mberImg = mberImg;
		this.totalLeCnt = totalLeCnt;
		this.lendBookCnt = lendBookCnt;
		this.grade = grade;
		this.lendPsbCdt = lendPsbCdt;
		this.joinDt = joinDt;
		this.wdrCdt = wdrCdt;
		this.odCnt = odCnt;
		this.mberBrthStr = mberBrthStr;
	}

	public Member(String mberId, String mberPass, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel, byte[] mberImg, int totalLeCnt, int lendBookCnt, Grade grade,
			int lendPsbCdt, int wdrCdt, int odCnt) {
		super();
		this.mberId = mberId;
		this.mberPass = mberPass;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
		this.mberImg = mberImg;
		this.totalLeCnt = totalLeCnt;
		this.lendBookCnt = lendBookCnt;
		this.grade = grade;
		this.lendPsbCdt = lendPsbCdt;
		this.wdrCdt = wdrCdt;
		this.odCnt = odCnt;
	}

	public Member(String mberId, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel, byte[] mberImg, int totalLeCnt, int lendBookCnt, Grade grade,
			int lendPsbCdt, Date joinDt, int wdrCdt, int odCnt) {
		super();
		this.mberId = mberId;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
		this.mberImg = mberImg;
		this.totalLeCnt = totalLeCnt;
		this.lendBookCnt = lendBookCnt;
		this.grade = grade;
		this.lendPsbCdt = lendPsbCdt;
		this.joinDt = joinDt;
		this.wdrCdt = wdrCdt;
		this.odCnt = odCnt;
	}

	public Member(String mberId, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel, byte[] mberImg, Grade grade) {
		super();
		this.mberId = mberId;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
		this.mberImg = mberImg;
		this.grade = grade;
	}

	public Member(String mberId, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel, int totalLeCnt, int lendBookCnt, Grade grade, int lendPsbCdt,
			Date joinDt, int wdrCdt, int odCnt) {
		super();
		this.mberId = mberId;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
		this.totalLeCnt = totalLeCnt;
		this.lendBookCnt = lendBookCnt;
		this.grade = grade;
		this.lendPsbCdt = lendPsbCdt;
		this.joinDt = joinDt;
		this.wdrCdt = wdrCdt;
		this.odCnt = odCnt;
	}


	public Member(String mberId, String mberPass, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel, Date joinDt) {
		super();
		this.mberId = mberId;
		this.mberPass = mberPass;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
		this.joinDt = joinDt;
	}
	


	public Member(String mberId, String mberPass, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel, byte[] mberImg, int wdrCdt, Grade grade, int lendPsbCdt, int odCnt) {
		this.mberId = mberId;
		this.mberPass = mberPass;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
		this.mberImg = mberImg;
		this.wdrCdt = wdrCdt;
		this.grade = grade;
		this.lendPsbCdt = lendPsbCdt;
		this.odCnt = odCnt;
	}

	public Member(String mberId, String mberPass) {
		this.mberId = mberId;
		this.mberPass = mberPass;
	}

	public Member(String mberName, Date mberBrthdy) {
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
	}

	public Member(String mberId, String mberName, Date mberBrthdy) {
		this.mberId = mberId;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
	}

	public Member(String mberId, String mberName, int lendBookCnt, Grade grade, int lendPsbCdt) {
		this.mberId = mberId;
		this.mberName = mberName;
		this.lendBookCnt = lendBookCnt;
		this.grade = grade;
		this.lendPsbCdt = lendPsbCdt;
	}

	public Member(String mberId, String mberPass, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel, byte[] mberImg, Date joinDt) {
		super();
		this.mberId = mberId;
		this.mberPass = mberPass;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
		this.mberImg = mberImg;
		this.joinDt = joinDt;
	}

	public Member(String mberId, String mberPass, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel, int totalLeCnt, int lendBookCnt, Grade grade, int lendPsbCdt,
			Date joinDt, int wdrCdt) {
		this.mberId = mberId;
		this.mberPass = mberPass;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
		this.totalLeCnt = totalLeCnt;
		this.lendBookCnt = lendBookCnt;
		this.grade = grade;
		this.lendPsbCdt = lendPsbCdt;
		this.joinDt = joinDt;
		this.wdrCdt = wdrCdt;
	}

	public Member(String mberId, String mberPass, String mberName, Date mberBrthdy, ZipCode mberZip, String mberBassAd,
			String mberDetailAd, String mberTel, byte[] mberImg, int totalLeCnt, int lendBookCnt, Grade grade,
			int lendPsbCdt, Date joinDt, int wdrCdt) {
		this.mberId = mberId;
		this.mberPass = mberPass;
		this.mberName = mberName;
		this.mberBrthdy = mberBrthdy;
		this.mberZip = mberZip;
		this.mberBassAd = mberBassAd;
		this.mberDetailAd = mberDetailAd;
		this.mberTel = mberTel;
		this.mberImg = mberImg;
		this.totalLeCnt = totalLeCnt;
		this.lendBookCnt = lendBookCnt;
		this.grade = grade;
		this.lendPsbCdt = lendPsbCdt;
		this.joinDt = joinDt;
		this.wdrCdt = wdrCdt;
	}



	public String getMberId() {
		return mberId;
	}

	public void setMberId(String mberId) {
		this.mberId = mberId;
	}

	public String getMberPass() {
		return mberPass;
	}

	public void setMberPass(String mberPass) {
		this.mberPass = mberPass;
	}

	public String getMberName() {
		return mberName;
	}

	public void setMberName(String mberName) {
		this.mberName = mberName;
	}

	public Date getMberBrthdy() {
		return mberBrthdy;
	}

	public void setMberBrthdy(Date mberBrthdy) {
		this.mberBrthdy = mberBrthdy;
	}

	public ZipCode getMberZip() {
		return mberZip;
	}

	public void setMberZip(ZipCode mberZip) {
		this.mberZip = mberZip;
	}

	public String getMberBassAd() {
		return mberBassAd;
	}

	public void setMberBassAd(String mberBassAd) {
		this.mberBassAd = mberBassAd;
	}

	public String getMberDetailAd() {
		return mberDetailAd;
	}

	public void setMberDetailAd(String mberDetailAd) {
		this.mberDetailAd = mberDetailAd;
	}

	public String getMberTel() {
		return mberTel;
	}

	public void setMberTel(String mberTel) {
		this.mberTel = mberTel;
	}

	public int getTotalLeCnt() {
		return totalLeCnt;
	}

	public void setTotalLeCnt(int totalLeCnt) {
		this.totalLeCnt = totalLeCnt;
	}

	public int getLendBookCnt() {
		return lendBookCnt;
	}

	public void setLendBookCnt(int lendBookCnt) {
		this.lendBookCnt = lendBookCnt;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public int getLendPsbCdt() {
		return lendPsbCdt;
	}

	public void setLendPsbCdt(int lendPsbCdt) {
		this.lendPsbCdt = lendPsbCdt;
	}

	public Date getJoinDt() {
		return joinDt;
	}

	public void setJoinDt(Date joinDt) {
		this.joinDt = joinDt;
	}

	public int getWdrCdt() {
		return wdrCdt;
	}

	public void setWdrCdt(int wdrCdt) {
		this.wdrCdt = wdrCdt;
	}

	public byte[] getMberImg() {
		return mberImg;
	}

	public void setMberImg(byte[] mberImg) {
		this.mberImg = mberImg;
	}

	public int getOdCnt() {
		return odCnt;
	}

	public void setOdCnt(int odCnt) {
		this.odCnt = odCnt;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((grade == null) ? 0 : grade.hashCode());
		result = prime * result + ((joinDt == null) ? 0 : joinDt.hashCode());
		result = prime * result + lendBookCnt;
		result = prime * result + lendPsbCdt;
		result = prime * result + ((mberBassAd == null) ? 0 : mberBassAd.hashCode());
		result = prime * result + ((mberBrthdy == null) ? 0 : mberBrthdy.hashCode());
		result = prime * result + ((mberDetailAd == null) ? 0 : mberDetailAd.hashCode());
		result = prime * result + ((mberId == null) ? 0 : mberId.hashCode());
		result = prime * result + Arrays.hashCode(mberImg);
		result = prime * result + ((mberName == null) ? 0 : mberName.hashCode());
		result = prime * result + ((mberPass == null) ? 0 : mberPass.hashCode());
		result = prime * result + ((mberTel == null) ? 0 : mberTel.hashCode());
		result = prime * result + ((mberZip == null) ? 0 : mberZip.hashCode());
		result = prime * result + odCnt;
		result = prime * result + totalLeCnt;
		result = prime * result + wdrCdt;
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
		Member other = (Member) obj;
		if (grade == null) {
			if (other.grade != null)
				return false;
		} else if (!grade.equals(other.grade))
			return false;
		if (joinDt == null) {
			if (other.joinDt != null)
				return false;
		} else if (!joinDt.equals(other.joinDt))
			return false;
		if (lendBookCnt != other.lendBookCnt)
			return false;
		if (lendPsbCdt != other.lendPsbCdt)
			return false;
		if (mberBassAd == null) {
			if (other.mberBassAd != null)
				return false;
		} else if (!mberBassAd.equals(other.mberBassAd))
			return false;
		if (mberBrthdy == null) {
			if (other.mberBrthdy != null)
				return false;
		} else if (!mberBrthdy.equals(other.mberBrthdy))
			return false;
		if (mberDetailAd == null) {
			if (other.mberDetailAd != null)
				return false;
		} else if (!mberDetailAd.equals(other.mberDetailAd))
			return false;
		if (mberId == null) {
			if (other.mberId != null)
				return false;
		} else if (!mberId.equals(other.mberId))
			return false;
		if (!Arrays.equals(mberImg, other.mberImg))
			return false;
		if (mberName == null) {
			if (other.mberName != null)
				return false;
		} else if (!mberName.equals(other.mberName))
			return false;
		if (mberPass == null) {
			if (other.mberPass != null)
				return false;
		} else if (!mberPass.equals(other.mberPass))
			return false;
		if (mberTel == null) {
			if (other.mberTel != null)
				return false;
		} else if (!mberTel.equals(other.mberTel))
			return false;
		if (mberZip == null) {
			if (other.mberZip != null)
				return false;
		} else if (!mberZip.equals(other.mberZip))
			return false;
		if (odCnt != other.odCnt)
			return false;
		if (totalLeCnt != other.totalLeCnt)
			return false;
		if (wdrCdt != other.wdrCdt)
			return false;

		return true;
	}

	@Override
	public String toString() {
		return "Member [mberId=" + mberId + ", mberPass=" + mberPass + ", mberName=" + mberName + ", mberBrthdy="
				+ mberBrthdy + ", mberZip=" + mberZip + ", mberBassAd=" + mberBassAd + ", mberDetailAd=" + mberDetailAd
				+ ", mberTel=" + mberTel + ", mberImg=" + Arrays.toString(mberImg) + ", totalLeCnt=" + totalLeCnt
				+ ", lendBookCnt=" + lendBookCnt + ", grade=" + grade + ", lendPsbCdt=" + lendPsbCdt + ", joinDt="
				+ joinDt + ", wdrCdt=" + wdrCdt + ", odCnt=" + odCnt + ", mberBrthStr=" + mberBrthStr
				+ ", memberImgPath=" + memberImgPath + "]";
	}

	public void getMberBrthStr(String mberBrthStr) {
		this.mberBrthStr = mberBrthStr;
	}

	
}
