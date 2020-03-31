package com.yi.model;

import java.util.Date;

public class RequestBook {
	private int requestBookNo;
	private Member requestMbId;
	private String requestBookName;
	private String requestBookAuthor;
	private String requestBookTrnslr;
	private String requestBookPls;
	private Date requestDate;
	private int whCdt;
	private int overlapCnt;

	public RequestBook() {
	}

	public RequestBook(int requestBookNo) {
		this.requestBookNo = requestBookNo;
	}

	public RequestBook(Member requestMbId) {
		this.requestMbId = requestMbId;
	}

	public RequestBook(Member requestMbId, String requestBookName, String requestBookAuthor, String requestBookTrnslr,
			String requestBookPls, Date requestDate, int whCdt) {
		this.requestMbId = requestMbId;
		this.requestBookName = requestBookName;
		this.requestBookAuthor = requestBookAuthor;
		this.requestBookTrnslr = requestBookTrnslr;
		this.requestBookPls = requestBookPls;
		this.requestDate = requestDate;
		this.whCdt = whCdt;
	}

	public RequestBook(int requestBookNo, Member requestMbId, String requestBookName, String requestBookAuthor,
			String requestBookTrnslr, String requestBookPls, Date requestDate, int whCdt, int overlapCnt) {
		this.requestBookNo = requestBookNo;
		this.requestMbId = requestMbId;
		this.requestBookName = requestBookName;
		this.requestBookAuthor = requestBookAuthor;
		this.requestBookTrnslr = requestBookTrnslr;
		this.requestBookPls = requestBookPls;
		this.requestDate = requestDate;
		this.whCdt = whCdt;
		this.overlapCnt = overlapCnt;
	}

	public int getRequestBookNo() {
		return requestBookNo;
	}

	public void setRequestBookNo(int requestBookNo) {
		this.requestBookNo = requestBookNo;
	}

	public Member getRequestMbId() {
		return requestMbId;
	}

	public void setRequestMbId(Member requestMbId) {
		this.requestMbId = requestMbId;
	}

	public String getRequestBookName() {
		return requestBookName;
	}

	public void setRequestBookName(String requestBookName) {
		this.requestBookName = requestBookName;
	}

	public String getRequestBookAuthor() {
		return requestBookAuthor;
	}

	public void setRequestBookAuthor(String requestBookAuthor) {
		this.requestBookAuthor = requestBookAuthor;
	}

	public String getRequestBookTrnslr() {
		return requestBookTrnslr;
	}

	public void setRequestBookTrnslr(String requestBookTrnslr) {
		this.requestBookTrnslr = requestBookTrnslr;
	}

	public String getRequestBookPls() {
		return requestBookPls;
	}

	public void setRequestBookPls(String requestBookPls) {
		this.requestBookPls = requestBookPls;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public int getWhCdt() {
		return whCdt;
	}

	public void setWhCdt(int whCdt) {
		this.whCdt = whCdt;
	}

	public int getOverlapCnt() {
		return overlapCnt;
	}

	public void setOverlapCnt(int overlapCnt) {
		this.overlapCnt = overlapCnt;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + overlapCnt;
		result = prime * result + ((requestBookAuthor == null) ? 0 : requestBookAuthor.hashCode());
		result = prime * result + ((requestBookName == null) ? 0 : requestBookName.hashCode());
		result = prime * result + requestBookNo;
		result = prime * result + ((requestBookPls == null) ? 0 : requestBookPls.hashCode());
		result = prime * result + ((requestBookTrnslr == null) ? 0 : requestBookTrnslr.hashCode());
		result = prime * result + ((requestDate == null) ? 0 : requestDate.hashCode());
		result = prime * result + ((requestMbId == null) ? 0 : requestMbId.hashCode());
		result = prime * result + whCdt;
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
		RequestBook other = (RequestBook) obj;
		if (overlapCnt != other.overlapCnt)
			return false;
		if (requestBookAuthor == null) {
			if (other.requestBookAuthor != null)
				return false;
		} else if (!requestBookAuthor.equals(other.requestBookAuthor))
			return false;
		if (requestBookName == null) {
			if (other.requestBookName != null)
				return false;
		} else if (!requestBookName.equals(other.requestBookName))
			return false;
		if (requestBookNo != other.requestBookNo)
			return false;
		if (requestBookPls == null) {
			if (other.requestBookPls != null)
				return false;
		} else if (!requestBookPls.equals(other.requestBookPls))
			return false;
		if (requestBookTrnslr == null) {
			if (other.requestBookTrnslr != null)
				return false;
		} else if (!requestBookTrnslr.equals(other.requestBookTrnslr))
			return false;
		if (requestDate == null) {
			if (other.requestDate != null)
				return false;
		} else if (!requestDate.equals(other.requestDate))
			return false;
		if (requestMbId == null) {
			if (other.requestMbId != null)
				return false;
		} else if (!requestMbId.equals(other.requestMbId))
			return false;
		if (whCdt != other.whCdt)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format(
				"RequestBook [requestBookNo=%s, requestMbId=%s, requestBookName=%s, requestBookAuthor=%s, requestBookTrnslr=%s, requestBookPls=%s, requestDate=%s, whCdt=%s, overlapCnt=%s]",
				requestBookNo, requestMbId, requestBookName, requestBookAuthor, requestBookTrnslr, requestBookPls,
				requestDate, whCdt, overlapCnt);
	}

	public String toWhCdtString() {
		return String.format("%s", whCdt > 0 ? "입고완료" : "미입고");
	}
}
