package com.kh.myjob.common.vo;

public class Covid19VO {

	private String gubun; //시도명
	private int defCnt; //누적 확진자 수
	private int incDec; //신규 확진자 수
	private String stdDay; //기준 일시
	
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public int getDefCnt() {
		return defCnt;
	}
	public void setDefCnt(int defCnt) {
		this.defCnt = defCnt;
	}
	public int getIncDec() {
		return incDec;
	}
	public void setIncDec(int incDec) {
		this.incDec = incDec;
	}
	public String getStdDay() {
		return stdDay;
	}
	public void setStdDay(String stdDay) {
		this.stdDay = stdDay;
	}
}
