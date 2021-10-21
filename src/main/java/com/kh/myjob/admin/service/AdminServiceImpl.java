package com.kh.myjob.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myjob.admin.vo.NoticeBoardVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<NoticeBoardVO> selectNoticeBoardList() {
		return sqlsession.selectList("adminMapper.selectNoticeBoardList");
	}
	
}
