package com.yi.model;

import java.util.Arrays;
import java.util.Date;

public class Librarian {
	private String lbId;
	private String lbPass;
	private String lbName;
	private Date lbBirthDay;
	private ZipCode lbZip;
	private String lbBassAd;
	private String lbDetailAd;
	private String lbTel;
	private byte[] lbImg;
	private Title title;
	private Date joinDate;
	private int workCdt;
	private String LibImgPath;

	
	
	
	
	public Librarian(String lbId, String lbName, Date lbBirthDay, ZipCode lbZip, String lbBassAd, String lbDetailAd,
			String lbTel, byte[] lbImg, Title title, Date joinDate, int workCdt, String libImgPath) {
		super();
		this.lbId = lbId;
		this.lbName = lbName;
		this.lbBirthDay = lbBirthDay;
		this.lbZip = lbZip;
		this.lbBassAd = lbBassAd;
		this.lbDetailAd = lbDetailAd;
		this.lbTel = lbTel;
		this.lbImg = lbImg;
		this.title = title;
		this.joinDate = joinDate;
		this.workCdt = workCdt;
		LibImgPath = libImgPath;
	}

	public Librarian(String lbId, String lbPass, String lbName, Date lbBirthDay, ZipCode lbZip, String lbBassAd,
			String lbDetailAd, String lbTel, byte[] lbImg, Title title, Date joinDate, int workCdt, String libImgPath) {
		super();
		this.lbId = lbId;
		this.lbPass = lbPass;
		this.lbName = lbName;
		this.lbBirthDay = lbBirthDay;
		this.lbZip = lbZip;
		this.lbBassAd = lbBassAd;
		this.lbDetailAd = lbDetailAd;
		this.lbTel = lbTel;
		this.lbImg = lbImg;
		this.title = title;
		this.joinDate = joinDate;
		this.workCdt = workCdt;
		LibImgPath = libImgPath;
	}

	public String getLibImgPath() {
		return LibImgPath;
	}

	public void setLibImgPath(String libImgPath) {
		LibImgPath = libImgPath;
	}

	public Librarian() {
	}

	public Librarian(String lbId) {
		this.lbId = lbId;
	}

	


	public Librarian(String lbId, String lbName, Title title, int workCdt) {
		super();
		this.lbId = lbId;
		this.lbName = lbName;
		this.title = title;
		this.workCdt = workCdt;
	}

	public Librarian(String lbId, String lbPass, String lbName, Title title, Date joinDate, int workCdt) {
		super();
		this.lbId = lbId;
		this.lbPass = lbPass;
		this.lbName = lbName;
		this.title = title;
		this.joinDate = joinDate;
		this.workCdt = workCdt;
	}

	public Librarian(String lbId, String lbName, Date lbBirthDay, ZipCode lbZip, String lbBassAd, String lbDetailAd,
			String lbTel, byte[] lbImg, Title title, Date joinDate, int workCdt) {
		super();
		this.lbId = lbId;
		this.lbName = lbName;
		this.lbBirthDay = lbBirthDay;
		this.lbZip = lbZip;
		this.lbBassAd = lbBassAd;
		this.lbDetailAd = lbDetailAd;
		this.lbTel = lbTel;
		this.lbImg = lbImg;
		this.title = title;
		this.joinDate = joinDate;
		this.workCdt = workCdt;
	}

	public Librarian(String lbId, String lbPass) {
		this.lbId = lbId;
		this.lbPass = lbPass;
	}

	public Librarian(String lbId, int workCdt) {
		super();
		this.lbId = lbId;
		this.workCdt = workCdt;
	}

	public Librarian(String lbName, Date lbBirthDay) {
		this.lbName = lbName;
		this.lbBirthDay = lbBirthDay;
	}

	public Librarian(String lbId, String lbName, Date lbBirthDay) {
		this.lbId = lbId;
		this.lbName = lbName;
		this.lbBirthDay = lbBirthDay;
	}

	public Librarian(String lbId, String lbPass, String lbName, Date lbBirthDay, ZipCode lbZip, String lbBassAd,
			String lbDetailAd, String lbTel, byte[] lbImg) {
		this.lbId = lbId;
		this.lbPass = lbPass;
		this.lbName = lbName;
		this.lbBirthDay = lbBirthDay;
		this.lbZip = lbZip;
		this.lbBassAd = lbBassAd;
		this.lbDetailAd = lbDetailAd;
		this.lbTel = lbTel;
		this.lbImg = lbImg;
	}

	public Librarian(String lbId, String lbPass, String lbName, Date lbBirthDay, ZipCode lbZip, String lbBassAd,
			String lbDetailAd, String lbTel, Title title, Date joinDate, int workCdt) {
		this.lbId = lbId;
		this.lbPass = lbPass;
		this.lbName = lbName;
		this.lbBirthDay = lbBirthDay;
		this.lbZip = lbZip;
		this.lbBassAd = lbBassAd;
		this.lbDetailAd = lbDetailAd;
		this.lbTel = lbTel;
		this.title = title;
		this.joinDate = joinDate;
		this.workCdt = workCdt;
	}

	public Librarian(String lbId, String lbPass, String lbName, Date lbBirthDay, ZipCode lbZip, String lbBassAd,
			String lbDetailAd, String lbTel, byte[] lbImg, Title title, Date joinDate, int workCdt) {
		this.lbId = lbId;
		this.lbPass = lbPass;
		this.lbName = lbName;
		this.lbBirthDay = lbBirthDay;
		this.lbZip = lbZip;
		this.lbBassAd = lbBassAd;
		this.lbDetailAd = lbDetailAd;
		this.lbTel = lbTel;
		this.lbImg = lbImg;
		this.title = title;
		this.joinDate = joinDate;
		this.workCdt = workCdt;
	}

	public String getLbId() {
		return lbId;
	}

	public void setLbId(String lbId) {
		this.lbId = lbId;
	}

	public String getLbPass() {
		return lbPass;
	}

	public void setLbPass(String lbPass) {
		this.lbPass = lbPass;
	}

	public String getLbName() {
		return lbName;
	}

	public void setLbName(String lbName) {
		this.lbName = lbName;
	}

	public Date getLbBirthDay() {
		return lbBirthDay;
	}

	public void setLbBirthDay(Date lbBirthDay) {
		this.lbBirthDay = lbBirthDay;
	}

	public ZipCode getLbZip() {
		return lbZip;
	}

	public void setLbZip(ZipCode lbZip) {
		this.lbZip = lbZip;
	}

	public String getLbBassAd() {
		return lbBassAd;
	}

	public void setLbBassAd(String lbBassAd) {
		this.lbBassAd = lbBassAd;
	}

	public String getLbDetailAd() {
		return lbDetailAd;
	}

	public void setLbDetailAd(String lbDetailAd) {
		this.lbDetailAd = lbDetailAd;
	}

	public String getLbTel() {
		return lbTel;
	}

	public void setLbTel(String lbTel) {
		this.lbTel = lbTel;
	}

	public Title getTitle() {
		return title;
	}

	public void setTitle(Title title) {
		this.title = title;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public int getWorkCdt() {
		return workCdt;
	}

	public void setWorkCdt(int workCdt) {
		this.workCdt = workCdt;
	}

	public byte[] getLbImg() {
		return lbImg;
	}

	public void setLbImg(byte[] lbImg) {
		this.lbImg = lbImg;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((joinDate == null) ? 0 : joinDate.hashCode());
		result = prime * result + ((lbBassAd == null) ? 0 : lbBassAd.hashCode());
		result = prime * result + ((lbBirthDay == null) ? 0 : lbBirthDay.hashCode());
		result = prime * result + ((lbDetailAd == null) ? 0 : lbDetailAd.hashCode());
		result = prime * result + ((lbId == null) ? 0 : lbId.hashCode());
		result = prime * result + Arrays.hashCode(lbImg);
		result = prime * result + ((lbName == null) ? 0 : lbName.hashCode());
		result = prime * result + ((lbPass == null) ? 0 : lbPass.hashCode());
		result = prime * result + ((lbTel == null) ? 0 : lbTel.hashCode());
		result = prime * result + ((lbZip == null) ? 0 : lbZip.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Librarian other = (Librarian) obj;
		if (joinDate == null) {
			if (other.joinDate != null)
				return false;
		} else if (!joinDate.equals(other.joinDate))
			return false;
		if (lbBassAd == null) {
			if (other.lbBassAd != null)
				return false;
		} else if (!lbBassAd.equals(other.lbBassAd))
			return false;
		if (lbBirthDay == null) {
			if (other.lbBirthDay != null)
				return false;
		} else if (!lbBirthDay.equals(other.lbBirthDay))
			return false;
		if (lbDetailAd == null) {
			if (other.lbDetailAd != null)
				return false;
		} else if (!lbDetailAd.equals(other.lbDetailAd))
			return false;
		if (lbId == null) {
			if (other.lbId != null)
				return false;
		} else if (!lbId.equals(other.lbId))
			return false;
		if (!Arrays.equals(lbImg, other.lbImg))
			return false;
		if (lbName == null) {
			if (other.lbName != null)
				return false;
		} else if (!lbName.equals(other.lbName))
			return false;
		if (lbPass == null) {
			if (other.lbPass != null)
				return false;
		} else if (!lbPass.equals(other.lbPass))
			return false;
		if (lbTel == null) {
			if (other.lbTel != null)
				return false;
		} else if (!lbTel.equals(other.lbTel))
			return false;
		if (lbZip == null) {
			if (other.lbZip != null)
				return false;
		} else if (!lbZip.equals(other.lbZip))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (workCdt != other.workCdt)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Librarian [lbId=" + lbId + ", lbPass=" + lbPass + ", lbName=" + lbName + ", lbBirthDay=" + lbBirthDay
				+ ", lbZip=" + lbZip + ", lbBassAd=" + lbBassAd + ", lbDetailAd=" + lbDetailAd + ", lbTel=" + lbTel
				+ ", lbImg=" + Arrays.toString(lbImg) + ", title=" + title + ", joinDate=" + joinDate + ", workCdt="
				+ workCdt + ", LibImgPath=" + LibImgPath + "]";
	}

}
