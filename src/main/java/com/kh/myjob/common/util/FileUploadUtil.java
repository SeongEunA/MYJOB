package com.kh.myjob.common.util;

import java.util.Calendar;

public class FileUploadUtil {
	//현재 날짜와 시간을 가져옴
	public static String getNowDateTime() {
		Calendar cal = Calendar.getInstance();
	
		String nowDateTime = "";
		
		nowDateTime += cal.get(Calendar.YEAR);
		nowDateTime += cal.get(Calendar.MONTH) + 1;
		nowDateTime += cal.get(Calendar.DATE);
		nowDateTime += cal.get(Calendar.HOUR);
		nowDateTime += cal.get(Calendar.MINUTE);
		nowDateTime += cal.get(Calendar.SECOND);
		nowDateTime += cal.get(Calendar.MILLISECOND);
		
		return nowDateTime;
	
	}

}
