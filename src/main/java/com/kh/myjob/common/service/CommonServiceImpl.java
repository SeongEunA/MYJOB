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

	
}
