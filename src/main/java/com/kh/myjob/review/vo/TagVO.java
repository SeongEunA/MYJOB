package com.kh.myjob.review.vo;

public class TagVO {


private String tagCode;
private String tagName;
private String tagArr;
private String[] tagArrSplit;
private String reviewBoardCode;

public String getReviewBoardCode() {
	return reviewBoardCode;
}
public void setReviewBoardCode(String reviewBoardCode) {
	this.reviewBoardCode = reviewBoardCode;
}
public String[] getTagArrSplit() {
	return tagArrSplit;
}
public void setTagArrSplit(String[] tagArrSplit) {
	this.tagArrSplit = tagArrSplit;
}
public String getTagArr() {
	return tagArr;
}
public void setTagArr(String tagArr) {
	this.tagArr = tagArr;
}
public String getTagCode() {
	return tagCode;
}
public void setTagCode(String tagCode) {
	this.tagCode = tagCode;
}
public String getTagName() {
	return tagName;
}
public void setTagName(String tagName) {
	this.tagName = tagName;
}


}
