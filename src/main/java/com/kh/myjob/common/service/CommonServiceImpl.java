package com.kh.myjob.common.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myjob.common.vo.NoticeBoardVO;

@Service("commonService")
public class CommonServiceImpl implements CommonService{
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<NoticeBoardVO> selectNoticeBoardList() {
		return sqlsession.selectList("commonMapper.selectNoticeBoardList");
	}

	@Override
	public NoticeBoardVO selectDetailNoticeBoard(String noticeBoardCode) {
		return sqlsession.selectOne("commonMapper.selectDetailNoticeBoard", noticeBoardCode);
	}

	@Override
	public boolean deleteNoticeBoard(String noticeBoardCode) {
		//공지사항 삭제 성공 : true, 공지사항 삭제 실패 : false
		int result = sqlsession.delete("commonMapper.deleteNoticeBoard", noticeBoardCode);
		return result == 1 ? true : false;
	}

	
}
